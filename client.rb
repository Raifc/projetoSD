
$LOAD_PATH.push('gen-rb')
# $:.unshift '../../lib/rb/lib'

require 'thrift'

require_relative 'gen-rb/crud'

begin
  port = ARGV[0] || 9090
  # inicia novo socket
  transport = Thrift::BufferedTransport.new(Thrift::Socket.new('localhost', port))
  # inicia protocolo de transporte
  protocol = Thrift::BinaryProtocol.new(transport)
  # novo cliente utilizando o protocolo acima para a aplicacao
  client = Crud::Client.new(protocol)



  v1 = 1
  v2 = 2

  puts "Conectando..\n"
  transport.open() # abertura de novo socket
  puts "Conectado!\n"

  # puts "Listando os vizinhos do vertice #{v1}"
  # puts client.listarVerticesArestas(1)
  # puts (client.verticesAdjacentes(v1))
  # puts "Criando Vertice\n"
  #client.criaVertice(4, 'vert5', 5, 3.5)
  # puts "Atualiza Vertice\n"
  # client.atualizaVertice(120, 'vert13332', 5, 2.5)
  # eita = client.consultaVertice(1)
  # puts eita.inspect
  # puts "Vertice criado\n"
  # puts "Listando vertices #{v2}"
  puts "\n\n"
#client.criaVertice(558,'vertTeste', 4, 5.9)
#client.criaVertice(559,'vertTeste', 8, 6.9)

#client.deletaVertice(558)
  #puts"Vertice Deletado"


#client.atualizaVertice(559,'verTesteFoiAlterado', 9, 13)

puts "criando aresta"
client.criaAresta(28546, 4, 12, 3.0,true,'aresta1')
#client.atualizaAresta
#client.deletaAresta




  transport.close
# rescue Thrift::Exception => tx
  # print 'Thrift::Exception: ', tx.message, "\n"
end
