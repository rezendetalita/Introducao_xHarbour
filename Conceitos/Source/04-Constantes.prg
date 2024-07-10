/*CONSTANTES:
  São valores que não se alteram durante a execução do programa.
  Devem ser declaradas fora do MAIN() ou no inicio do bloco de execução.
  Por boa prática costumam ser declaradas em letras MAIÚCULAS.

  Sintaxe:
   #define NOME_CONSTANTE "Valor da constante"
*/

 #define PRODUTO "ARROZ"
 #define PRECO_AVISTA  17.90
 #define PRECO_PRAZO   19.00

 #define VERDE    "G"
 #define BRANCO   "W"
 #define VERMELHO "R"


 FUNCTION CONSTANTES()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Constantes",119)
 @ 03,00 SAY Replicate("-",119)

 @ 05,01 SAY "PRODUTO      : " + PRODUTO
 @ 06,01 SAY "PRECO A VISTA: " + AllTrim(Str(PRECO_AVISTA))
 @ 07,01 SAY "PRECO A PRAZO: " + AllTrim(Str(PRECO_PRAZO))

 @ 09,00 SAY Replicate("-",119)

 SET COLOR TO VERDE
 @ 11,01 SAY "Texto definido como VERDE"

 SET COLOR TO VERMELHO
 @ 12,01 SAY "Texto definido como VERMELHO"

 SET COLOR TO BRANCO
 @ 13,01 SAY "Texto definido como BRANCO"


 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

RETURN NIL

