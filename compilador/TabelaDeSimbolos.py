from enum import Enum


class Tipo(Enum):
    NUM_INT = "inteiro"
    NUM_REAL = "real"
    CADEIA  = "cadeia"
    INVALIDO = "invalido"
    TIPO = "tipo"
    LOGICO = "logico"
    PONTEIRO = "ponteiro"
    REGISTRO = "registro"
    VOID = "void"

class TabelaDeSimbolos():
    def __init__(self):
        self.tabela: dict[str, Tipo] = {}

    class EntradaTabelaSimbolos():
        def __init__(self, nome, tipo):
            self.nome = nome
            self.tipo =  tipo
    
    def adicionar(self, nome : str, tipo: Tipo):
        self.tabela[nome] = tipo    
    
    def existe(self, nome: str) -> bool:
        return self.tabela.get(nome) != None
    
    
    def verificar(self, nome : str):
        return self.tabela.get(nome)
