/*
 Procedures são como funções, mas elas não tem retorno.
 Se tirarmos o RETURN informado nas procedures abaixo, você verá que o projeto será compilado e executado normalmente.
 O RETURN é apenas para vermos onde a PROCEDURE termina.

 Normalmente, optamos por utilizar FUNCTION com RETURN NIL, ao invés de PROCEDURE.
*/

*---------------------*
 PROCEDURE PROCEDURE()

 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("PROCEDURE",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Procedure"
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN

*----------------------*
 PROCEDURE LIMPAR_TELA()

 * O comando abaixo pode ser usado no prompt para limpar a tela :)

 CLS

 RETURN

*----------------------*
 PROCEDURE PAUSAR_TELA()

 * A função abaixo fica aguardando que uma tecla seja pressionada pelo usuário.
 * Além disso, ela retorna o código da tecla, assim como a função LastKey().

 Inkey(0)

 RETURN