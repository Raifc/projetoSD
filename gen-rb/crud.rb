#
# Autogenerated by Thrift Compiler (0.10.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require_relative 'entidades_service_types'

module Crud
  class Client
    include ::Thrift::Client

    def criaVertice(nome, descricao, cor, peso)
      send_criaVertice(nome, descricao, cor, peso)
      recv_criaVertice()
    end

    def send_criaVertice(nome, descricao, cor, peso)
      send_message('criaVertice', CriaVertice_args, :nome => nome, :descricao => descricao, :cor => cor, :peso => peso)
    end

    def recv_criaVertice()
      result = receive_message(CriaVertice_result)
      raise result.razao unless result.razao.nil?
      return
    end

    def deletaVertice(nome)
      send_deletaVertice(nome)
      recv_deletaVertice()
    end

    def send_deletaVertice(nome)
      send_message('deletaVertice', DeletaVertice_args, :nome => nome)
    end

    def recv_deletaVertice()
      result = receive_message(DeletaVertice_result)
      raise result.razao unless result.razao.nil?
      return
    end

    def consultaVertice(nome)
      send_consultaVertice(nome)
      return recv_consultaVertice()
    end

    def send_consultaVertice(nome)
      send_message('consultaVertice', ConsultaVertice_args, :nome => nome)
    end

    def recv_consultaVertice()
      result = receive_message(ConsultaVertice_result)
      return result.success unless result.success.nil?
      raise result.razao unless result.razao.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'consultaVertice failed: unknown result')
    end

    def atualizaVertice(nome, descricao, cor, peso)
      send_atualizaVertice(nome, descricao, cor, peso)
      recv_atualizaVertice()
    end

    def send_atualizaVertice(nome, descricao, cor, peso)
      send_message('atualizaVertice', AtualizaVertice_args, :nome => nome, :descricao => descricao, :cor => cor, :peso => peso)
    end

    def recv_atualizaVertice()
      result = receive_message(AtualizaVertice_result)
      raise result.razao unless result.razao.nil?
      return
    end

    def criaAresta(id, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
      send_criaAresta(id, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
      recv_criaAresta()
    end

    def send_criaAresta(id, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
      send_message('criaAresta', CriaAresta_args, :id => id, :verticeOrigem => verticeOrigem, :verticeDestino => verticeDestino, :peso => peso, :biDirecional => biDirecional, :descricao => descricao)
    end

    def recv_criaAresta()
      result = receive_message(CriaAresta_result)
      raise result.razao unless result.razao.nil?
      return
    end

    def deletaAresta(verticeOrigem, verticeDestino)
      send_deletaAresta(verticeOrigem, verticeDestino)
      recv_deletaAresta()
    end

    def send_deletaAresta(verticeOrigem, verticeDestino)
      send_message('deletaAresta', DeletaAresta_args, :verticeOrigem => verticeOrigem, :verticeDestino => verticeDestino)
    end

    def recv_deletaAresta()
      result = receive_message(DeletaAresta_result)
      raise result.razao unless result.razao.nil?
      return
    end

    def consultaAresta(id)
      send_consultaAresta(id)
      return recv_consultaAresta()
    end

    def send_consultaAresta(id)
      send_message('consultaAresta', ConsultaAresta_args, :id => id)
    end

    def recv_consultaAresta()
      result = receive_message(ConsultaAresta_result)
      return result.success unless result.success.nil?
      raise result.razao unless result.razao.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'consultaAresta failed: unknown result')
    end

    def atualizaAresta(id, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
      send_atualizaAresta(id, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
      recv_atualizaAresta()
    end

    def send_atualizaAresta(id, verticeOrigem, verticeDestino, peso, biDirecional, descricao)
      send_message('atualizaAresta', AtualizaAresta_args, :id => id, :verticeOrigem => verticeOrigem, :verticeDestino => verticeDestino, :peso => peso, :biDirecional => biDirecional, :descricao => descricao)
    end

    def recv_atualizaAresta()
      result = receive_message(AtualizaAresta_result)
      raise result.razao unless result.razao.nil?
      return
    end

    def listarVerticesArestas(vertice)
      send_listarVerticesArestas(vertice)
      return recv_listarVerticesArestas()
    end

    def send_listarVerticesArestas(vertice)
      send_message('listarVerticesArestas', ListarVerticesArestas_args, :vertice => vertice)
    end

    def recv_listarVerticesArestas()
      result = receive_message(ListarVerticesArestas_result)
      return result.success unless result.success.nil?
      raise result.prob unless result.prob.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'listarVerticesArestas failed: unknown result')
    end

    def listarVerticeAdja(vertice)
      send_listarVerticeAdja(vertice)
      return recv_listarVerticeAdja()
    end

    def send_listarVerticeAdja(vertice)
      send_message('listarVerticeAdja', ListarVerticeAdja_args, :vertice => vertice)
    end

    def recv_listarVerticeAdja()
      result = receive_message(ListarVerticeAdja_result)
      return result.success unless result.success.nil?
      raise result.prob unless result.prob.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'listarVerticeAdja failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_criaVertice(seqid, iprot, oprot)
      args = read_args(iprot, CriaVertice_args)
      result = CriaVertice_result.new()
      begin
        @handler.criaVertice(args.nome, args.descricao, args.cor, args.peso)
      rescue ::Fail => razao
        result.razao = razao
      end
      write_result(result, oprot, 'criaVertice', seqid)
    end

    def process_deletaVertice(seqid, iprot, oprot)
      args = read_args(iprot, DeletaVertice_args)
      result = DeletaVertice_result.new()
      begin
        @handler.deletaVertice(args.nome)
      rescue ::Fail => razao
        result.razao = razao
      end
      write_result(result, oprot, 'deletaVertice', seqid)
    end

    def process_consultaVertice(seqid, iprot, oprot)
      args = read_args(iprot, ConsultaVertice_args)
      result = ConsultaVertice_result.new()
      begin
        result.success = @handler.consultaVertice(args.nome)
      rescue ::Fail => razao
        result.razao = razao
      end
      write_result(result, oprot, 'consultaVertice', seqid)
    end

    def process_atualizaVertice(seqid, iprot, oprot)
      args = read_args(iprot, AtualizaVertice_args)
      result = AtualizaVertice_result.new()
      begin
        @handler.atualizaVertice(args.nome, args.descricao, args.cor, args.peso)
      rescue ::Fail => razao
        result.razao = razao
      end
      write_result(result, oprot, 'atualizaVertice', seqid)
    end

    def process_criaAresta(seqid, iprot, oprot)
      args = read_args(iprot, CriaAresta_args)
      result = CriaAresta_result.new()
      begin
        @handler.criaAresta(args.id, args.verticeOrigem, args.verticeDestino, args.peso, args.biDirecional, args.descricao)
      rescue ::Fail => razao
        result.razao = razao
      end
      write_result(result, oprot, 'criaAresta', seqid)
    end

    def process_deletaAresta(seqid, iprot, oprot)
      args = read_args(iprot, DeletaAresta_args)
      result = DeletaAresta_result.new()
      begin
        @handler.deletaAresta(args.verticeOrigem, args.verticeDestino)
      rescue ::Fail => razao
        result.razao = razao
      end
      write_result(result, oprot, 'deletaAresta', seqid)
    end

    def process_consultaAresta(seqid, iprot, oprot)
      args = read_args(iprot, ConsultaAresta_args)
      result = ConsultaAresta_result.new()
      begin
        result.success = @handler.consultaAresta(args.id)
      rescue ::Fail => razao
        result.razao = razao
      end
      write_result(result, oprot, 'consultaAresta', seqid)
    end

    def process_atualizaAresta(seqid, iprot, oprot)
      args = read_args(iprot, AtualizaAresta_args)
      result = AtualizaAresta_result.new()
      begin
        @handler.atualizaAresta(args.id, args.verticeOrigem, args.verticeDestino, args.peso, args.biDirecional, args.descricao)
      rescue ::Fail => razao
        result.razao = razao
      end
      write_result(result, oprot, 'atualizaAresta', seqid)
    end

    def process_listarVerticesArestas(seqid, iprot, oprot)
      args = read_args(iprot, ListarVerticesArestas_args)
      result = ListarVerticesArestas_result.new()
      begin
        result.success = @handler.listarVerticesArestas(args.vertice)
      rescue ::NotFound => prob
        result.prob = prob
      end
      write_result(result, oprot, 'listarVerticesArestas', seqid)
    end

    def process_listarVerticeAdja(seqid, iprot, oprot)
      args = read_args(iprot, ListarVerticeAdja_args)
      result = ListarVerticeAdja_result.new()
      begin
        result.success = @handler.listarVerticeAdja(args.vertice)
      rescue ::NotFound => prob
        result.prob = prob
      end
      write_result(result, oprot, 'listarVerticeAdja', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class CriaVertice_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NOME = 1
    DESCRICAO = 2
    COR = 3
    PESO = 4

    FIELDS = {
      NOME => {:type => ::Thrift::Types::I32, :name => 'nome'},
      DESCRICAO => {:type => ::Thrift::Types::STRING, :name => 'descricao'},
      COR => {:type => ::Thrift::Types::I32, :name => 'cor'},
      PESO => {:type => ::Thrift::Types::DOUBLE, :name => 'peso'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class CriaVertice_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    RAZAO = 1

    FIELDS = {
      RAZAO => {:type => ::Thrift::Types::STRUCT, :name => 'razao', :class => ::Fail}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class DeletaVertice_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NOME = 1

    FIELDS = {
      NOME => {:type => ::Thrift::Types::I32, :name => 'nome'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class DeletaVertice_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    RAZAO = 1

    FIELDS = {
      RAZAO => {:type => ::Thrift::Types::STRUCT, :name => 'razao', :class => ::Fail}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ConsultaVertice_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NOME = 1

    FIELDS = {
      NOME => {:type => ::Thrift::Types::I32, :name => 'nome'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ConsultaVertice_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    RAZAO = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::Vertice},
      RAZAO => {:type => ::Thrift::Types::STRUCT, :name => 'razao', :class => ::Fail}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class AtualizaVertice_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NOME = 1
    DESCRICAO = 2
    COR = 3
    PESO = 4

    FIELDS = {
      NOME => {:type => ::Thrift::Types::I32, :name => 'nome'},
      DESCRICAO => {:type => ::Thrift::Types::STRING, :name => 'descricao'},
      COR => {:type => ::Thrift::Types::I32, :name => 'cor'},
      PESO => {:type => ::Thrift::Types::DOUBLE, :name => 'peso'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class AtualizaVertice_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    RAZAO = 1

    FIELDS = {
      RAZAO => {:type => ::Thrift::Types::STRUCT, :name => 'razao', :class => ::Fail}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class CriaAresta_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    ID = 1
    VERTICEORIGEM = 2
    VERTICEDESTINO = 3
    PESO = 4
    BIDIRECIONAL = 5
    DESCRICAO = 6

    FIELDS = {
      ID => {:type => ::Thrift::Types::I32, :name => 'id'},
      VERTICEORIGEM => {:type => ::Thrift::Types::I32, :name => 'verticeOrigem'},
      VERTICEDESTINO => {:type => ::Thrift::Types::I32, :name => 'verticeDestino'},
      PESO => {:type => ::Thrift::Types::DOUBLE, :name => 'peso'},
      BIDIRECIONAL => {:type => ::Thrift::Types::BOOL, :name => 'biDirecional'},
      DESCRICAO => {:type => ::Thrift::Types::STRING, :name => 'descricao'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class CriaAresta_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    RAZAO = 1

    FIELDS = {
      RAZAO => {:type => ::Thrift::Types::STRUCT, :name => 'razao', :class => ::Fail}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class DeletaAresta_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    VERTICEORIGEM = 1
    VERTICEDESTINO = 2

    FIELDS = {
      VERTICEORIGEM => {:type => ::Thrift::Types::I32, :name => 'verticeOrigem'},
      VERTICEDESTINO => {:type => ::Thrift::Types::I32, :name => 'verticeDestino'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class DeletaAresta_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    RAZAO = 1

    FIELDS = {
      RAZAO => {:type => ::Thrift::Types::STRUCT, :name => 'razao', :class => ::Fail}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ConsultaAresta_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    ID = 1

    FIELDS = {
      ID => {:type => ::Thrift::Types::I32, :name => 'id'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ConsultaAresta_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    RAZAO = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::Aresta},
      RAZAO => {:type => ::Thrift::Types::STRUCT, :name => 'razao', :class => ::Fail}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class AtualizaAresta_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    ID = 1
    VERTICEORIGEM = 2
    VERTICEDESTINO = 3
    PESO = 4
    BIDIRECIONAL = 5
    DESCRICAO = 6

    FIELDS = {
      ID => {:type => ::Thrift::Types::I32, :name => 'id'},
      VERTICEORIGEM => {:type => ::Thrift::Types::I32, :name => 'verticeOrigem'},
      VERTICEDESTINO => {:type => ::Thrift::Types::I32, :name => 'verticeDestino'},
      PESO => {:type => ::Thrift::Types::DOUBLE, :name => 'peso'},
      BIDIRECIONAL => {:type => ::Thrift::Types::BOOL, :name => 'biDirecional'},
      DESCRICAO => {:type => ::Thrift::Types::STRING, :name => 'descricao'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class AtualizaAresta_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    RAZAO = 1

    FIELDS = {
      RAZAO => {:type => ::Thrift::Types::STRUCT, :name => 'razao', :class => ::Fail}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ListarVerticesArestas_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    VERTICE = 1

    FIELDS = {
      VERTICE => {:type => ::Thrift::Types::I32, :name => 'vertice'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ListarVerticesArestas_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    PROB = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Aresta}},
      PROB => {:type => ::Thrift::Types::STRUCT, :name => 'prob', :class => ::NotFound}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ListarVerticeAdja_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    VERTICE = 1

    FIELDS = {
      VERTICE => {:type => ::Thrift::Types::I32, :name => 'vertice'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ListarVerticeAdja_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    PROB = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Vertice}},
      PROB => {:type => ::Thrift::Types::STRUCT, :name => 'prob', :class => ::NotFound}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

