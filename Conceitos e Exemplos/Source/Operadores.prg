/*
 * Proyecto: Operadores
 Operadores matematicos
 Operadores lógicos
 Operadores relacionais
*/

 FUNCTION OPERADORES()

   LOCAL nVlr_Inicial, nPeriodo, nTaxaJuros, nJuros, nTot_Juros, nVlr_Final
   LOCAL nVlr1:=5.87, nVlr2:=0.30, nNumero:=10, nNum1:=50, nNum2:=38
   LOCAL lVerdade:=.T., lFalso:=.F.
   LOCAL cTexto1:="PLENA", cTexto2:="EXITO"

   nTaxaJuros  :=0.25
   nVlr_Inicial:=100.00
   nPeriodo    :=5

   //Operadores matematicos
   nJuros    :=(nTaxaJuros/nVlr_Inicial) * nPeriodo
   nTot_Juros:=nVlr_Inicial * nJuros
   nVlr_Final:=nVlr_Inicial + nTot_Juros


   //Exibição na tela
   ? "-------------------------------------------------------------------"
   ? "                           Operadores                              "
   ? "-------------------------------------------------------------------"
   ? "Operadores matematicos"
   ? "----------------------"
   ? "nVlr_Inicial: " + AllTrim(Str(nVlr_Inicial))
   ? "nTot_Juros  : " + AllTrim(Str(nTot_Juros))
   ? "nVlr_Final  : " + AllTrim(Str(nVlr_Final))
   ? "                                                                   "
   ? "Operadores compostos"
   ? "--------------------"
   ? "nVlr1 -= nVlr2: " + AllTrim(Str(nVlr1 -= nVlr2))
   ? "nVlr1 *= nVlr2: " + AllTrim(Str(nVlr1 *= nVlr2))
   ? "nVlr1 += nVlr2: " + AllTrim(Str(nVlr1 += nVlr2))
   ? "                                                                   "
   ? "Operadores de incremento"
   ? "------------------------"
   ? "nNumero   : " + AllTrim(Str(nNumero))
   ? "++nNumero : " + AllTrim(Str(++nNumero))
   ? "                                                                   "
   ? "nNumero   : " + AllTrim(Str(nNumero))
   ? "nNumero++ : " + AllTrim(Str(nNumero++))
   ? "                                                                   "
   ? "Operadores logicos"
   ? "------------------------------------"
   ? "lVerdade .AND. lFalso  : " , lVerdade .AND. lFalso
   ? "lVerdade .AND. lVerdade: " , lVerdade .AND. lVerdade
   ? "lVerdade .OR. lFalso   : " , lVerdade .OR. lFalso
   ? "lVerdade .OR. lVerdade : " , lVerdade .OR. lVerdade
   ? "!lVerdade              : " , !lVerdade
   ? "!lFalso                : " , !lFalso
   ? "                                                                   "
   ? "Operadores relacionais"
   ? "------------------------------------"
   ? "nNum1 > nNum2     : " , nNum1 > nNum2
   ? "cTexto1 == cTexto2: " , cTexto1 == cTexto2
   ? "cTexto1 == cTexto2: " , (Len(cTexto1) == Len(cTexto2))
   ? "nNum1 != cTexto2  : " , nNum1 != cTexto2
   ? "-------------------------------------------------------------------"

 RETURN NIL

