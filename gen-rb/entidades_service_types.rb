#
# Autogenerated by Thrift Compiler (0.10.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

class NotFound < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.razao = message
  end

  def message; razao end

  RAZAO = 1

  FIELDS = {
    RAZAO => {:type => ::Thrift::Types::STRING, :name => 'razao'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Invalid < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.razao = message
  end

  def message; razao end

  RAZAO = 1

  FIELDS = {
    RAZAO => {:type => ::Thrift::Types::STRING, :name => 'razao'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Fail < ::Thrift::Exception
  include ::Thrift::Struct, ::Thrift::Struct_Union
  def initialize(message=nil)
    super()
    self.razao = message
  end

  def message; razao end

  RAZAO = 1

  FIELDS = {
    RAZAO => {:type => ::Thrift::Types::STRING, :name => 'razao'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Vertice
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
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field nome is unset!') unless @nome
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field descricao is unset!') unless @descricao
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field cor is unset!') unless @cor
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field peso is unset!') unless @peso
  end

  ::Thrift::Struct.generate_accessors self
end

class Aresta
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
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field id is unset!') unless @id
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field verticeOrigem is unset!') unless @verticeOrigem
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field verticeDestino is unset!') unless @verticeDestino
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field peso is unset!') unless @peso
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field biDirecional is unset!') if @biDirecional.nil?
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field descricao is unset!') unless @descricao
  end

  ::Thrift::Struct.generate_accessors self
end

class Grafo
  include ::Thrift::Struct, ::Thrift::Struct_Union
  LISTAVERTICES = 1
  LISTAARESTAS = 2

  FIELDS = {
    LISTAVERTICES => {:type => ::Thrift::Types::LIST, :name => 'listaVertices', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Vertice}},
    LISTAARESTAS => {:type => ::Thrift::Types::LIST, :name => 'listaArestas', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Aresta}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

