*---------------------*
 FUNCTION COMENTARIOS()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Insercao de comentarios",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 05,01 SAY "PROCEDURE MAIN()     //comenta o que vier depois das barras"
 *
 @ 07,01 SAY " * PROCEDURE MAIN()  comenta a linha toda"
 *
 @ 09,01 SAY " // PROCEDURE MAIN() comenta a linha toda"
 *
 @ 11,01 SAY "/*"
 @ 12,02 SAY "PROCEDURE MAIN()"
 @ 13,02 SAY "comenta multiplas linhas"
 @ 14,01 SAY "*/"


 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL