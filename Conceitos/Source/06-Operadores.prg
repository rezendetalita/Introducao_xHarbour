/*Operadores

 Operadores matematicos: "+", "-", "*", "/"
 Operadores lógicos    : .AND. , .OR. , !
 Operadores relacionais: >, <, ==, <>
*/

 FUNCTION OPERADORES()

 LOCAL nVlr_Inicial, nPeriodo, nTaxaJuros, nTot_Juros, nVlr_Final
 LOCAL nVlr1:=5.87, nVlr2:=0.30, nNumero:=10, nNum1:=50, nNum2:=38
 LOCAL lVerdade:=.T., lFalso:=.F.
 LOCAL cTexto1:="PLENA", cTexto2:="EXITO"
 PUBLIC nJuros

 nTaxaJuros  :=0.25
 nVlr_Inicial:=100.00
 nPeriodo    :=5

 nJuros    :=(nTaxaJuros/nVlr_Inicial) * nPeriodo
 nTot_Juros:=nVlr_Inicial * nJuros
 nVlr_Final:=nVlr_Inicial + nTot_Juros

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("=",119)
 @ 02,00 SAY PadC("Operadores",119)
 @ 03,00 SAY Replicate("=",119)
 *
 @ 05,01 SAY "Operadores matematicos"
 @ 07,01 SAY "nVlr_Inicial: " + AllTrim(Str(nVlr_Inicial))
 @ 08,01 SAY "nTot_Juros  : " + AllTrim(Str(nTot_Juros))
 @ 09,01 SAY "nVlr_Final  : " + AllTrim(Str(nVlr_Final))
 *
 @ 12,01 SAY "Operadores compostos"
 @ 14,01 SAY "nVlr1:=(nVlr1-nVlr2): " + AllTrim(Str(nVlr1-nVlr2))
 @ 15,01 SAY "nVlr1 -= nVlr2      : " + AllTrim(Str(nVlr1 -= nVlr2))

 @ 17,01 SAY "Operadores de incremento"
 @ 19,01 SAY "nNumero   : " + AllTrim(Str(nNumero))
 @ 20,01 SAY "++nNumero : " + AllTrim(Str(++nNumero))
 @ 21,01 SAY "nNumero   : " + AllTrim(Str(nNumero))
 @ 22,01 SAY "nNumero++ : " + AllTrim(Str(nNumero++))
 *
 @ 24,01 SAY "Operadores logicos"
 @ 26,01 SAY "lVerdade .AND. lFalso  : " + ltoc(lVerdade .AND. lFalso)
 @ 27,01 SAY "lVerdade .AND. lVerdade: " + ltoc(lVerdade .AND. lVerdade)
 @ 28,01 SAY "lVerdade .OR. lFalso   : " + ltoc(lVerdade .OR. lFalso)
 @ 29,01 SAY "lVerdade .OR. lVerdade : " + ltoc(lVerdade .OR. lVerdade)
 @ 30,01 SAY  "!lVerdade              : " + ltoc(!lVerdade)
 @ 31,01 SAY "!lFalso                : " + ltoc(!lFalso)
 *
 @ 33,01 SAY "Operadores relacionais"
 @ 35,01 SAY "nNum1 > nNum2     : " + ltoc(nNum1 > nNum2)
 @ 36,01 SAY "cTexto1 == cTexto2: " + ltoc(cTexto1 == cTexto2)
 @ 37,01 SAY "cTexto1 == cTexto2: " + ltoc((Len(cTexto1) == Len(cTexto2)))
 @ 38,01 SAY "nNum1 != cTexto2  : " + ltoc(nNum1 != cTexto2)

 RETURN NIL

 /*
 ? "----------------------------------------------------------------------------------"
   ? "                                Strings e Textos                                  "
   ? "----------------------------------------------------------------------------------"
   ? "Concatenacao"
   ? "------------"
   ? "Harbour linguagem de programacao aberta" +;
     "otima para aplicativos de negocios."
   ? "                                                                                  "
   ? "Reduzir linhas de codigo"
   ? "-------------------------"
   ? "Harbour"; ? "Similar ao Clipper"
   ? "                                                                                  "
   ? "Harbour"
   ? "Similar ao Clipper"
   ? "----------------------------------------------------------------------------------"

  */