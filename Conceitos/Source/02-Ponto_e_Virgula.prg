/*
No caso específico da Linguagem Harbour e xHarbour, o ponto e vírgula poderá ser utilizado em duas situações especificas:

Para indicar quando há uma quebra de linha.
   No caso onde linhas de comando ficam muito extensas, usa-se o ";" para indicar que essa instrução não acabou e deve ser continuada na linha seguinte.

Para realizar o agrupamento de várias instruções em uma mesma linha.
   Nesse caso, várias linhas de comando ficam em uma mesma linha, sendo separadas apenas pelo ";"
   Essa prática não é tão legal, pois pode deixar o código mais dificil de ser lido.
*/

*-------------------------*

 FUNCTION PONTO_E_VIRGULA()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Uso do Ponto e virgula",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 05,00 SAY "Quebra de linha"
 @ 07,01 SAY QUEBRA_LINHA()
 *
 @ 09,00 SAY Replicate("-",119)
 *
 @ 11,00 SAY "Agrupamento de linhas de comando:"
 @ 13,01 SAY JUNTA_LINHAS()

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*-----------------*
 FUNCTION QUEBRA_LINHA()

 LOCAL cInf_Complementar:=''
 LOCAL cProduto, nBCMonoRet,nAliqAdrem

 cProduto  :='GASOLINA A COMUM'
 nBCMonoRet:=13.584
 nAliqAdrem:=1.3721

 cInf_Complementar:=cProduto+;
                    ' - '+'BC ICMS Mono:'+AllTrim(Str(nBCMonoRet))+;
                    ' - '+'Aliq. Adrem:'+AllTrim(Str(nAliqAdrem))

 RETURN cInf_Complementar

*-----------------*
 FUNCTION JUNTA_LINHAS()

 LOCAL cInf_Complementar:=''
 LOCAL cProduto, nBCMonoRet,nAliqAdrem

 cProduto:='GASOLINA A COMUM' ; nBCMonoRet:=13.584 ; nAliqAdrem:=1.3721

 cInf_Complementar:=cProduto+' - BC ICMS Mono:'+AllTrim(Str(nBCMonoRet))+' - Aliq. Adrem:'+AllTrim(Str(nAliqAdrem))

 RETURN cInf_Complementar

