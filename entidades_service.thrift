#namespace rb raifsd

typedef i32 int

exception NotFound {
    1: string razao
}
exception Invalid {
    1: string razao
}
exception Fail {
    1: string razao
}

struct Vertice {
    1: required int nome,
    2: required string descricao,
    3: required int cor,
    4: required double peso
}

struct Aresta {
    1: required int id,
    2: required int verticeOrigem,
    3: required int verticeDestino,
    4: required double peso,
    5: required bool biDirecional,
    6: required string descricao
}

struct Grafo {
    1: list<Vertice> listaVertices,
    2: list<Aresta> listaArestas
}



service Crud {
    /* crud do vertice */
    void criaVertice(1:int nome, 2:string descricao, 3:int cor, 4:double peso) throws (1:Fail razao)
    void deletaVertice(1:int nome) throws (1:Fail razao)
    Vertice consultaVertice(1:int nome) throws (1:Fail razao)
    void atualizaVertice(1:int nome, 2:string descricao, 3:int cor, 4:double peso) throws (1:Fail razao)
    /*crud da aresta */
    void criaAresta(1:int id, 2:int verticeOrigem, 3:int verticeDestino, 4:double peso, 5:bool biDirecional, 6:string  descricao) throws (1:Fail razao)
    void deletaAresta(1:int verticeOrigem, 2:int verticeDestino) throws (1:Fail razao)
    Aresta consultaAresta(1:int id) throws (1:Fail razao)
    void atualizaAresta(1:int id, 2:int verticeOrigem, 3:int verticeDestino, 4:double peso, 5:bool biDirecional, 6:string  descricao) throws (1:Fail razao)
      /* tratamento */
    list<Aresta> listarVerticesArestas(1:int vertice) throws (1:NotFound prob)
    list<Vertice> listarVerticeAdja(1:int vertice) throws (1:NotFound prob)
}