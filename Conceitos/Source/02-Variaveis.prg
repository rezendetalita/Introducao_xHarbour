/* Variaveis e Tipos de variáveis
 Variáveis são alocações da memória devidamente identifcadas, usadas para armazenar um determinado valor.
 Valor esse, que pode ser alterado durante a execução do programa.

Escopo das variáveis:
 LOCAL   = Valem apenas dentro da rotina onde foram declaradas.
 PRIVATE = Valem dentro da rotina onde foram declaradas e em todas as funções abaixo que estiverem dentro desse bloco.
           As variáveis PRIVATE são o tipo default de variável, ou seja, se você criar uma variável sem declarar seu tipo, ela será declarada como PRIVATE.
 PUBLIC  = Valem dentro de todo o projeto.

 Tipos de variáveis:
 numéricas  = armazenam números inteiros e decimais: 5, 2, 3.89, 5.41...
 caracteres = armazenam strings: "Maria","R","A"
 lógicas    = armazenam valores booleanos: Verdadeiro - 1 e Falso - 0
 data       = armazenam datas, no Harbour as datas são exibidas no formato mês/dia/ano
 arrays     = armazenam um conjunto de valores acessíveis por suas posições
              vetor (unidimensional):{'ARROZ', 'FEIJAO', 'ACUCAR', 'CAFE'}
              matriz(multidimensional): {{ "Apto 101" , "Apto 102" },{ "Apto 201" , "Apto 202" }}
 hash       = um Hash é um tipo especial de array, cujo ponteiro pode ser uma string: hCliente[ "nome" ] := "Joao"
*/

 FUNCTION VARIAVEIS()

 LOCAL nInteiro, nDecimal
 LOCAL cProduto, cObsProduto
 LOCAL lTrue, lFalse
 LOCAL dVencimento
 LOCAL aProdutos:={}, aLocalProduto:={}
 LOCAL hClientes:=HASH()

 //PRIVATE
 //PUBLIC

 nInteiro:=12
 nDecimal:=1.65

 cProduto:='PRODUTO'
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

 CLS

 @ 01,00 SAY Replicate("-",70)
 @ 02,00 SAY PadC("Tipos de Variaveis",70)
 @ 03,00 SAY Replicate("-",70)
 *
 @ 04,01 SAY PadC("Numericas",70)
 @ 06,01 SAY "nInteiro: " + AllTrim(Str(nInteiro))
 @ 07,01 SAY "nDecimal: " + AllTrim(Str(nDecimal))
 @ 08,00 SAY Replicate("-",70)
 *
 @ 09,01 SAY PadC("Caracteres",70)
 @ 11,01 SAY "cProduto   : " + cProduto
 @ 12,01 SAY "cObsProduto: " + cObsProduto
 @ 13,00 SAY Replicate("-",70)
 *
 @ 14,01 SAY PadC("Logicas",70)
 @ 16,01 SAY "lTrue : " + ltoc(lTrue)
 @ 17,01 SAY "lFalse: " + ltoc(lFalse)
 @ 18,00 SAY Replicate("-",70)
 *
 @ 19,01 SAY PadC("Data",70)
 @ 21,01 SAY "dVencimento: " + DToC(dVencimento)
 @ 22,00 SAY Replicate("-",70)
 *
 @ 23,01 SAY PadC("Vetor",70)
 @ 25,01 SAY "aProdutos[1]: " + aProdutos[1]
 @ 26,01 SAY "aProdutos[2]: " + aProdutos[2]
 @ 27,01 SAY "aProdutos[3]: " + aProdutos[3]
 @ 28,00 SAY Replicate("-",70)
 *
 @ 29,01 SAY PadC("Matriz",70)
 @ 31,01 SAY "aLocalProduto[1][1]: " + aLocalProduto[1][1]
 @ 32,01 SAY "aLocalProduto[1][2]: " + aLocalProduto[1][2]
 @ 33,01 SAY "aLocalProduto[2][1]: " + aLocalProduto[2][1]
 @ 34,01 SAY "aLocalProduto[2][2]: " + aLocalProduto[2][2]
 @ 35,00 SAY Replicate("-",70)
 *
 @ 36,00 SAY PadC("Hash",70)
 @ 38,01 SAY "hClientes['Clientes']['Nome']     : " + hClientes['Clientes']['Nome']
 @ 39,01 SAY "hClientes['Clientes']['Sobrenome']: " + hClientes['Clientes']['Sobrenome']


 Inkey(0)

 RETURN NIL