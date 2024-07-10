/*Operadores

 Operadores matematicos:
  - Adição: +
  - Subtração: -
  - Multiplicação: *
  - Diviso: /
  - Exponenciação: ^
  - Resto da divisão: %

 Operadores lógicos:
  - E: .AND.
  - OU: .OR.
  - NÃO: !

 Operadores relacionais:
  - Maior: >
  - Menor: <
  - Igual: ==
  - Diferente:<>

 Operador macro: &

*/
 FUNCTION OPERADORES()

 LOCAL nVlr_Inicial, nPeriodo,nJuros, nTaxaJuros, nTot_Juros, nVlr_Final
 LOCAL nVlr1, nVlr2, nNumero, nNum1, nNum2
 LOCAL cTexto1, cTexto2
 LOCAL lVerdade:=.T., lFalso:=.F.

 nTaxaJuros  :=0.25
 nVlr_Inicial:=100.00
 nPeriodo    :=5
 nVlr1       :=5.87
 nVlr2       :=0.3
 nNumero     :=10
 nNum1       :=50
 nNum2       :=38
 cTexto1     :="PLENA"
 cTexto2     :="EXITO"

* Operadores matematicos *

 //divisao e multiplicação
 nJuros:=(nTaxaJuros/nVlr_Inicial) * nPeriodo

 //multiplicação
 nTot_Juros:=nVlr_Inicial * nJuros

 //adição
 nVlr_Final:=nVlr_Inicial + nTot_Juros

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Operadores",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,00 SAY "Operadores matematicos"
 @ 06,01 SAY "nJuros:     " + AllTrim(Str(nJuros))
 @ 07,01 SAY "nTot_Juros: " + AllTrim(Str(nTot_Juros))
 @ 08,01 SAY "nVlr_Final: " + AllTrim(Str(nVlr_Final))
 *
 @ 09,00 SAY Replicate("=",119)
 *
 @ 11,00 SAY "Operadores compostos"
 @ 13,01 SAY "nVlr1:=(nVlr1-nVlr2): " + AllTrim(Str(nVlr1-nVlr2))
 @ 14,01 SAY "nVlr1 -= nVlr2      : " + AllTrim(Str(nVlr1 -= nVlr2))
 *
 @ 15,00 SAY Replicate("=",119)
 *
 @ 17,01 SAY "Operadores de incremento"
 @ 19,01 SAY "nNumero   : " + AllTrim(Str(nNumero))
 @ 20,01 SAY "++nNumero : " + AllTrim(Str(++nNumero))
 @ 21,01 SAY "nNumero   : " + AllTrim(Str(nNumero))
 @ 22,01 SAY "nNumero++ : " + AllTrim(Str(nNumero++))
 *
 @ 23,00 SAY Replicate("=",119)
 *
 @ 25,00 SAY "Operadores logicos"
 @ 27,01 SAY "lVerdade .AND. lFalso  : " + ltoc(lVerdade .AND. lFalso)
 @ 28,01 SAY "lVerdade .AND. lVerdade: " + ltoc(lVerdade .AND. lVerdade)
 @ 29,01 SAY "lVerdade .OR. lFalso   : " + ltoc(lVerdade .OR. lFalso)
 @ 30,01 SAY "lVerdade .OR. lVerdade : " + ltoc(lVerdade .OR. lVerdade)
 @ 31,01 SAY "!lVerdade              : " + ltoc(!lVerdade)
 @ 32,01 SAY "!lFalso                : " + ltoc(!lFalso)
 *
 @ 34,00 SAY Replicate("=",119)
 *
 @ 36,00 SAY "Operadores relacionais"
 @ 38,01 SAY "nNum1 > nNum2     : " + ltoc(nNum1 > nNum2)
 @ 39,01 SAY "cTexto1 == cTexto2: " + ltoc(cTexto1 == cTexto2)
 @ 40,01 SAY "cTexto1 == cTexto2: " + ltoc((Len(cTexto1) == Len(cTexto2)))
 @ 41,01 SAY "nNum1 != cTexto2  : " + ltoc(nNum1 != cTexto2)

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

