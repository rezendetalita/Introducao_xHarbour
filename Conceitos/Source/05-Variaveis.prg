/* Variaveis e Tipos de variáveis
 Variáveis são alocações da memória devidamente identificadas, usadas para armazenar um determinado valor.
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

 PRIVATE nValor:=10.5

 ESCOPO()
 *
 @ 07,00 SAY Replicate("=",119)
 @ 08,00 SAY PadC("Tipos de Variaveis",119)
 @ 09,00 SAY Replicate("=",119)
 *
 @ 11,01 SAY "Numericas"
 @ 12,01 SAY  NUMERICAS()
 *
 @ 14,01 SAY "Caracteres"
 @ 15,01 SAY  CARACTERES()
 *
 @ 17,01 SAY "Logicas"
 @ 18,01 SAY  LOGICAS()
 *
 @ 20,01 SAY "Data"
 @ 21,01 SAY DATA()
 *
 @ 23,01 SAY "Vetor"
 @ 24,01 SAY VETOR()
 *
 @ 26,01 SAY "Matriz"
 @ 27,01 SAY MATRIZ()
 *
 @ 29,01 SAY "Hash"
 @ 30,01 SAY HASH()

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*---------------------------*
 FUNCTION ESCOPO()

 LOCAL nSomatorio,nValor2
 MEMVAR nValor, nJuros

 nValor2:=5
 nSomatorio:= nValor + nValor2

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("=",119)
 @ 02,00 SAY PadC("Escopo de Variaveis",119)
 @ 03,00 SAY Replicate("=",119)

 @ 05,01 SAY "PRIVATE: " + AllTrim(Str(nValor))
 @ 06,01 SAY "PUBLIC : " + AllTrim(Str(nJuros))
 @ 07,01 SAY "LOCAL  : " + AllTrim(Str(nSomatorio))

 RETURN NIL

 *--------------------*
 FUNCTION NUMERICAS()

 LOCAL nInteiro, nDecimal, nSoma

 nInteiro:=12
 nDecimal:=1.65

 @ 14,01 SAY "nInteiro: " + AllTrim(Str(nInteiro))
 @ 15,01 SAY "nDecimal: " + AllTrim(Str(nDecimal))

 RETURN NIL

*--------------------*
 FUNCTION CARACTERES()

 LOCAL cProduto, cObsProduto

 cProduto:='PRODUTO'
 cObsProduto:='Lorem ipsum tellus pulvinar, tempor...'

 @ 18,01 SAY "cProduto   : " + cProduto
 @ 19,01 SAY "cObsProduto: " + cObsProduto

 RETURN NIL

*--------------------*
 FUNCTION LOGICAS()

 LOCAL lTrue, lFalse

 lTrue:=.T.
 lFalse:=.F.

 @ 22,01 SAY "lTrue : " + ltoc(lTrue)
 @ 23,01 SAY "lFalse: " + ltoc(lFalse)
 RETURN NIL

*--------------------*
 FUNCTION DATA()

 LOCAL dVencimento

 dVencimento:=Date()

 @ 26,01 SAY "dVencimento: " + DToC(dVencimento)

 RETURN NIL

*--------------------*
 FUNCTION VETOR()

 LOCAL aProdutos:={}

 aProdutos:={"PRODUTO_1", "PRODUTO_2", "PRODUTO_3", "PRODUTO_4"}
 *               [1]         [2]           [3]         [4]

 @ 29,01 SAY "aProdutos[1]: " + aProdutos[1]
 @ 30,01 SAY "aProdutos[2]: " + aProdutos[2]
 @ 31,01 SAY "aProdutos[3]: " + aProdutos[3]

 RETURN NIL

*--------------------*
 FUNCTION HASH()

 LOCAL hClientes:=HASH()

 hClientes['Clientes']              :=HASH()
 hClientes['Clientes']['Nome']      :="Joao"
 hClientes['Clientes']['Sobrenome'] :="Silva"

 @ 40,01 SAY "hClientes['Clientes']['Nome']     : " + hClientes['Clientes']['Nome']
 @ 41,01 SAY "hClientes['Clientes']['Sobrenome']: " + hClientes['Clientes']['Sobrenome']

 RETURN NIL

*--------------------*
 FUNCTION MATRIZ()

 LOCAL aLocalProduto:={}

 aLocalProduto:={{ "Prateleira 101" , "Prateleira 102" },;
                 { "Prateleira 201" , "Prateleira 202" }}
 *                     [1][1]       ,      [1][2]
 *                     [2][1]       ,      [2][2]
 @ 34,01 SAY "aLocalProduto[1][1]: " + aLocalProduto[1][1]
 @ 35,01 SAY "aLocalProduto[1][2]: " + aLocalProduto[1][2]
 @ 36,01 SAY "aLocalProduto[2][1]: " + aLocalProduto[2][1]
 @ 37,01 SAY "aLocalProduto[2][2]: " + aLocalProduto[2][2]

 RETURN NIL