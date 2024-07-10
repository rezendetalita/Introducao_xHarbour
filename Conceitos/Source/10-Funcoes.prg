/*
 Funções são rotinas que recebem dados de entrada (ou não), executam algum processo e retornam algo.

 Para criar uma função utilize a palavra FUNCTION seguida do nome da função e ().
 Informe um RETURN, que pode ser de qualquer tipo: numérico, caracter, lógico, etc. Se a função não retorna nada, use o RETURN NIL.
 Entre FUNCTION e RETURN, fica o corpo da função, onde são realizados os processamentos.
*/

#INCLUDE "COMMON.CH" // Necessário para usar o comando DEFAULT. Verifique a função SOMA() para mais detalhes.

*------------------*
 FUNCTION FUNCOES()

 LIMPAR_TELA()
 *
 * Algumas funções podem ser importadas de bibliotecas. No exemplo abaixo, é possível ver que as funções Replicate() e PadC() não foram criadas. Elas tem origem na biblioteca "rtl.lib".
 * É possível importar bibliotecas através do menu: Proyecto > Propriedades del Proyecto > Librerías.
 * Para saber de qual biblioteca a função é, consulte a documentação dessa função no manual do xHarbour.
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Funcoes",119)
 @ 03,00 SAY Replicate("-",119)
 *
 * A função MES() recebe o número do mês como parâmetro, e retorna o seu respectivo nome.
 *
 @ 04,00 SAY PadC("FUNCTION MES()",119)
 *
 @ 05,01 SAY "MES(1):"
 @ 05,20 SAY MES(1)
 *
 @ 06,01 SAY "MES(2):"
 @ 06,20 SAY MES(2)
 *
 @ 07,01 SAY "MES(7):"
 @ 07,20 SAY MES(7)
 *
 @ 08,00 SAY Replicate("-",119)
 *
 * A função SOMA() recebe um, dois ou três números, e retorna o resultado da soma entre eles.
 *
 @ 09,00 SAY PadC("FUNCTION SOMA()",119)
 *
 @ 10,01 SAY "SOMA(1): "
 @ 10,20 SAY (SOMA(1))
 *
 @ 11,01 SAY "SOMA(10,17): "
 @ 11,20 SAY SOMA(10,17)
 *
 @ 12,01 SAY "SOMA(1000,1,0.50): "
 @ 12,20 SAY SOMA(1000,1,0.50)
 *
 @ 13,00 SAY Replicate("-",119)
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN NIL

*-----------------*
 FUNCTION MES(nMes)

 /*
 As funções podem ou não ter parâmetros para receber dados que serão usados.
 Os parâmetros ficam dentro de (). No exemplo acima, a função MES() recebe o parâmetro nMes.
 É importante que quem chamar a função MES(), informe um valor para esse parâmetro. Caso contrário, o parâmetro ficará com o valor NIL.
 */

 LOCAL cMes:=""
 *
 IF nMes==1
    cMes:="Janeiro"
  ELSEIF nMes==2
    cMes:="Fevereiro"
  ELSEIF nMes==3
    cMes:="Março"
  ELSEIF nMes==4
    cMes:="Abril"
  ELSEIF nMes==5
    cMes:="Maio"
  ELSEIF nMes==6
    cMes:="Junho"
  ELSEIF nMes==7
    cMes:="Julho"
  ELSEIF nMes==8
    cMes:="Agosto"
  ELSEIF nMes==9
    cMes:="Setembro"
  ELSEIF nMes==10
    cMes:="Outubro"
  ELSEIF nMes==11
    cMes:="Novembro"
  ELSEIF nMes==12
    cMes:="Dezembro"
 ENDIF
 *
 RETURN cMes

*------------------------------------------*
 FUNCTION SOMA(nNumero1, nNumero2, nNumero3)

 /*
 Nessa função ocorre um erro na soma, se um dos parâmetros não for informado, porque não é possível somar um número com um NIL.
 Ex: A chamada de SOMA(1) resultará em 1 + NIL + NIL, porque nNumero2 e nNumero3 não foram informados.

 Por isso, é uma boa prática definir um valor DEFAULT para os parâmetros.
 Obs: Para usar o comando DEFAULT, é necessário incluir o arquivo COMMON.CH no início do prg.
 */

 DEFAULT nNumero1 TO 0
 DEFAULT nNumero2 TO 0
 DEFAULT nNumero3 TO 0

 RETURN nNumero1+nNumero2+nNumero3