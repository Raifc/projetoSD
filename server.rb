# $:.push('gen-rb')

require 'thrift'

require_relative "gen-rb/crud"
require_relative "gen-rb/entidades_service_types"
require_relative "gen-rb/entidades_service_constants"


def to_b(element)
  if element == "true" || element == "True"
    return true
  else
    return false
  end
end


def cria_objeto_vertice(nome, descricao, cor, peso)
  vertice = Vertice.new()
  vertice.nome = nome
  vertice.descricao = descricao
  vertice.cor = cor
  vertice.peso = peso

  vertice
end

def cria_objeto_aresta(id, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
  aresta = Aresta.new()
  aresta.id = id
  aresta.verticeOrigem = verticeOrigem
  aresta.verticeDestino = verticeDestino
  aresta.peso = peso
  aresta.biDirecional = biDirecional
  aresta.descricao = descricao

  aresta
end

def atrasa_processamento(tempo)
  puts("Dormindo")
  sleep(tempo)
  puts("Acordou")
end

class GraphHandler
  # attr_accessor :semaforo, :lista_vertices, :lista_arestas

  def initialize()
    @lista_vertices = []
    @lista_arestas = []
    @semaforo = Mutex.new()
  end

  def ping
    puts "pong!"
  end

  def le_arquivo(grafo_id=1) #le os vertices e arestas do arquivo
    @lista_vertices = []
    @lista_arestas = []
    @semaforo.synchronize do
      @array_de_vertice = Array.new()
      @array_de_aresta = Array.new()
      File.foreach("vertice.txt") do |linha|
          @array_de_vertice << linha.chomp
      end


      File.foreach("aresta.txt") do |linha| #le as arestas do arquivo
          @array_de_aresta << linha.chomp
      end

      @array_de_vertice.each do |vertice| #le os vertices do arquivo
        @novo_vertice = vertice.split(",")
        if @novo_vertice.include? ""        #verifica se existe algum espaço em branco,se houver  retorna o erro
          # raise("Um dos elementos esta vazio, confira o arquivo vertice")
        end
        vertice = cria_objeto_vertice(@novo_vertice[0].to_i ,@novo_vertice[1] ,@novo_vertice[2].to_i ,@novo_vertice[3].to_f) #instancia um novo vertice, nessa funçao podemos pedir para que o usuario digite

        @lista_vertices << vertice #cria a lista de vertices
      end

      @array_de_aresta.each do |aresta| #verifica o espaço em branco nas arestas
        @nova_aresta = aresta.split(",")
        if @nova_aresta.include? ""
          # raise("Um dos elementos esta vazio, confira o arquivo vertice")
        end

        aresta = cria_objeto_aresta(@nova_aresta[0].to_i, @nova_aresta[1].to_i,@nova_aresta[2].to_i,@nova_aresta[3].to_f,to_b(@nova_aresta[4]),@nova_aresta[5]) #cria aresta - não dá pra colocar a aresta e os vertices dentro do grafo depois da criaçao?

        @lista_arestas << aresta
      end

    end
  end

  def escreve_no_arquivo(tipo_do_objeto)
    dado_formatado = ""
    if tipo_do_objeto == 'vertice'
      @lista_vertices.each do |elemento|
        elemento_array  = "#{[elemento.nome, elemento.descricao, elemento.cor, elemento.peso].join(",")}\n"
        dado_formatado = dado_formatado+elemento_array
      end
    else
      @lista_arestas.each do |elemento|
        elemento_array  = "#{[elemento.id, elemento.verticeOrigem, elemento.verticeDestino, elemento.peso, elemento.biDirecional, elemento.descricao].join(",")}\n"
        dado_formatado = dado_formatado+element_array
      end
    end

    @semaforo.synchronize do
      File.open("#{tipo_do_objeto}.txt", 'w') do |arquivo|
        arquivo.write(dado_formatado)
      end
    end
  end

  def procura_vertice(nome_vertice)
    vertice = nil
    self.le_arquivo()
    @lista_vertices.each do |vertice_atual|
      if (vertice_atual.nome).to_i == (nome_vertice).to_i
        vertice = vertice_atual
      end
    end
    puts vertice.inspect
    vertice
  end

  def procura_aresta(id_aresta)
    aresta = nil
    self.le_arquivo()
    @lista_arestas.each do |aresta_atual|
      if aresta_atual.id == id_aresta
        aresta = aresta_atual
      end
    end
    puts aresta.inspect
    aresta
  end

  # done
  def criaVertice(nome, descricao, cor, peso)
    puts "chamou criavertice"
    self.le_arquivo()
    atrasa_processamento(2)
    if procura_vertice(nome) != nil
      raise(Fail.new('Vertixe ja existe'))
      return
    end

    @semaforo.synchronize do
      dado = "#{[nome,descricao,cor,peso].join(',')}\n"
      File.open("vertice.txt","a") do |arquivo|
        arquivo.write(dado)
      end
    end
  end

  def criaAresta(id, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
    self.le_arquivo()
    atrasa_processamento(2)
    if procura_aresta(id) != nil
      raise(Fail.new('Aresta ja existe'))
      return
    end
    @semaforo.synchronize do
       dado = "#{[id, verticeOrigem, verticeDestino, peso, biDirecional, descricao].join(',')}\n"
       File.open("aresta.txt", "a") do |arquivo|
        arquivo.write(dado)
      end
    end
  end

  # done
  def atualizaVertice(nome, descricao, cor, peso)
    @lista_vertices = []
    @lista_arestas = []
    self.le_arquivo()
    atrasa_processamento(2)
    @lista_vertices.each do |vertice_atual|
      if vertice_atual.nome == nome
        vertice_atual.cor = cor
        vertice_atual.descricao = descricao
        vertice_atual.peso = peso
      end
    end
    escreve_no_arquivo("vertice")
  end


  def atualizaAresta(id_aresta, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
    @lista_arestas = []
    self.le_arquivo()
    atrasa_processamento(2)
    @lista_arestas.each do |aresta_atual|
      if aresta_atual.id == id_aresta
        aresta_atual.verticeOrigem = verticeOrigem
        aresta_atual.verticeDestino = verticeDestino
        aresta_atual.peso = peso
        aresta_atual.biDirecional = to_b(biDirecional)
        aresta_atual.descricao = descricao
      end
    end
    escreve_no_arquivo("aresta")
  end

  # done
  def deletaVertice(nome_vertice)
    @lista_vertices = []
    @lista_arestas = []
    self.le_arquivo()
    atrasa_processamento(2)
    vertice_selecionado = self.procura_vertice(nome_vertice)

    if vertice_selecionado == nil
      raise(Fail.new("Vertice nao existe"))
    else
      @lista_arestas.each do |aresta_atual|
        if ((aresta_atual.verticeDestino).to_i == (nome_vertice).to_i || (aresta_atual.verticeOrigem).to_i == (nome_vertice).to_i )
          @lista_arestas.delete(aresta_atual)
        end
      end
      @lista_vertices.each do |vertice_atual|
        if vertice_atual.nome == nome_vertice
          @lista_vertices.delete(vertice_atual)
        end
      end
    end
      escreve_no_arquivo("vertice")
  end

  def deletaAresta(id_aresta)
    @lista_arestas = []
    self.le_arquivo()
    atrasa_processamento(2)
    if (self.procura_aresta(id_aresta) == nil)
      raise(Fail("Aresta nao existe"))
    end
    @lista_arestas.each do |aresta_atual|
      if(aresta_atual.id)
        @lista_arestas.delete(aresta_atual)
      end
    end

     escreve_no_arquivo("aresta")
  end

  def consultaVertice(nome_vertice)
    self.le_arquivo()
    atrasa_processamento(2)
    procura_vertice(nome_vertice)
  end

  def consultaAresta(id_aresta)
    self.le_arquivo()
    atrasa_processamento(2)
    procura_aresta(id_aresta)
  end

  def listarVerticesArestas(nome_vertice)
    self.le_arquivo()
    atrasa_processamento(2)
    lista_vert = []
    @lista_vertices.each do |vertice_atual|
      if vertice_atual.nome == nome_vertice
        lista_vert << vertice_atual
      end
    end
    lista_vert
  end

  def listarVerticeAdja(nome_vertice)
    self.le_arquivo()
    lista_vert = []
    @lista_arestas.each do |aresta_atual|
      if aresta_atual.verticeOrigem || aresta_atual.verticeDestino == nome_vertice
        lista_vert << aresta_atual
      end
    end
    lista_vert
  end
end




#graf = GraphHandler.new()
# end

handler = GraphHandler.new()
processor = Crud::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

puts "Starting the server..."
server.serve()
puts "done."
