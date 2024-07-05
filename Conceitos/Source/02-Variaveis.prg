/* Variaveis e seus tipos
 Variáveis são alocações da memória devidamente identifcadas, usadas para armazenar um determinado valor.
 Valor esse, que pode ser alterado durante a execução do programa.

Escopo das váriaveis:
 LOCAL   = Valem apenas dentro da rotina onde foram declaradas.
 PRIVATE = Valem dentro da rotina onde foram declaradas e em todas as funções abaixo que estiverem dentro desse bloco.
           As variáveis PRIVATE são o tipo default de variável, ou seja, se você criar uma variável sem dizer seu tipo, ela será declarada como PRIVATE.
 PUBLIC  = Valem dentro de todo o projeto.

 Tipos de variáveis:
 numéricas  = armazenam números inteiros e decimais: 5, 2, 3.89, 5.41
 caracteres = armazenam strings: "Maria", "Harbour","R","A"
 lógicas    = armazenam valores booleanos: Verdadeiro - 1 e Falso - 0
 data       = armazenam datas: o Harbour vem pré-configurado para exibir as datas no formato norte-americano ( mês/dia/ano )
 arrays     = armazenam um conjunto de valores acessíveis por suas posições
              vetor (unidimensional):{'ARROZ', 'FEIJAO', 'ACUCAR', 'CAFE'}
              matriz(multidimensional): {{ "Apto 101" , "Apto 102" },{ "Apto 201" , "Apto 202" }}
 hash       = um Hash é um tipo especial de array, cujo ponteiro pode ser uma string: hCliente[ "nome" ] := "Joao"
*/

 FUNCTION VARIAVEIS()

 LOCAL nValor:=0, nValor_Decimal
 LOCAL cProduto, cObsProduto
 LOCAL lTrue, lFalse
 LOCAL dVencimento
 LOCAL aProdutos:={}, aLocalProduto:={}
 LOCAL hClientes:=HASH()
 LOCAL GetList:={}

 //PRIVATE
 //PUBLIC

 nValor        :=12
 nValor_Decimal:=1.65

 cProduto   :='PRODUTO_1'
 cObsProduto:='Lorem ipsum tellus pulvinar, tempor...'

 lTrue:=.T.
 lFalse:=.F.

 dVencimento:=Date()

 aProdutos:={"PRODUTO_1", "PRODUTO_2", "PRODUTO_3", "PRODUTO_4"}
 *               [1]         [2]           [3]         [4]

 aLocalProduto:={{ "Prateleira 101" , "Prateleira 102" },;
                 { "Prateleira 201" , "Prateleira 202" }}
 *                     [1][1]       ,      [1][2]
 *                     [2][1]       ,      [2][2]

 hClientes['Clientes']              :=HASH()
 hClientes['Clientes']['Nome']      :="Joao"
 hClientes['Clientes']['Sobrenome'] :="Silva"

 CLEAR

 @ 01,00 SAY Replicate("-",80)
 @ 02,00 SAY PadC("Tipos de Variaveis",80)
 @ 03,00 SAY Replicate("-",80)
 @ 04,01 SAY "Numericas"
 @ 05,01 SAY "----------"
 @ 06,01 SAY "nValor        : " + AllTrim(Str(nValor))
 @ 07,01 SAY "nValor_Decimal: " + AllTrim(Str(nValor_Decimal))
 @ 09,01 SAY "Caracteres"
 @ 10,01 SAY "-----------"
 @ 11,01 SAY "cProduto   : " + cProduto
 @ 12,01 SAY "cObsProduto: " + cObsProduto
 @ 14,01 SAY "Logicas"
 @ 15,01 SAY "--------"
 @ 16,01 SAY "lTrue : " + ltoc(lTrue)
 @ 17,01 SAY "lFalse: " + ltoc(lFalse)
 @ 19,01 SAY "Data"
 @ 20,01 SAY "-----"
 @ 21,01 SAY "dVencimento: " + DToC(dVencimento)
 @ 23,01 SAY "Vetor"
 @ 24,01 SAY "------"
 @ 25,01 SAY "aProdutos[1]: " + aProdutos[1]
 @ 26,01 SAY "aProdutos[2]: " + aProdutos[2]
 @ 27,01 SAY "aProdutos[3]: " + aProdutos[3]
 @ 29,01 SAY "Matriz"
 @ 30,01 SAY "-------"
 @ 31,01 SAY "aLocalProduto[1][1]: " + aLocalProduto[1][1]
 @ 32,01 SAY "aLocalProduto[1][2]: " + aLocalProduto[1][2]
 @ 33,01 SAY "aLocalProduto[2][1]: " + aLocalProduto[2][1]
 @ 34,01 SAY "aLocalProduto[2][2]: " + aLocalProduto[2][2]
 @ 36,01 SAY "Hash"
 @ 37,01 SAY "-----"
 @ 38,01 SAY "hClientes['Clientes']['Nome']     : " + hClientes['Clientes']['Nome']
 @ 39,01 SAY "hClientes['Clientes']['Sobrenome']: " + hClientes['Clientes']['Sobrenome']


 Inkey(0)

 RETURN NIL