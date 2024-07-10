*---------------*
 PROCEDURE MAIN()

 LOCAL nOpcao:=0, GetList:={}
 *
 SET DATE       BRITISH
 SET CENTURY    ON
 SET EPOCH      TO 1950
 *
 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Introducao a linguagem Harbour",119)
 @ 03,00 SAY Replicate("-",119)
 @ 04,01 SAY "Informe uma opcao: " GET nOpcao PICT "99"
 @ 06,01 SAY " 1 - MAIN()"
 @ 07,01 SAY " 2 - Ponto e virgula"
 @ 08,01 SAY " 3 - Comentarios"
 @ 09,01 SAY " 4 - Constantes"
 @ 10,01 SAY " 5 - Variaveis"
 @ 11,01 SAY " 6 - Operadores"
 @ 12,01 SAY " 7 - Estruturas de controle"
 @ 13,01 SAY " 8 - Estruturas de repeticao"
 @ 14,01 SAY " 9 - SET"
 @ 15,01 SAY "10 - Funcoes"
 @ 16,01 SAY "11 - Funcoes do xHarbour"
 @ 17,01 SAY "12 - PROCEDURE"
 @ 18,01 SAY "13 - Banco de dados DBF"
 @ 19,01 SAY "14 - Tela"
 *
 READ
 *
 DO CASE
    CASE nOpcao==1
       EXEMPLO_MAIN()
    CASE nOpcao==2
       PONTO_E_VIRGULA()
    CASE nOpcao==3
       COMENTARIOS()
    CASE nOpcao==4
       CONSTANTES()
    CASE nOpcao==5
       VARIAVEIS()
    CASE nOpcao==6
       OPERADORES()
    CASE nOpcao==7
       ESTRUTURAS_CONTROLE()
    CASE nOpcao==8
       ESTRUTURAS_REPETICAO()
    CASE nOpcao==9
       COMANDO_SET()
    CASE nOpcao==10
       FUNCOES()
    CASE nOpcao==11
       FUNCOES_XHARBOUR()
    CASE nOpcao==12
       PROCEDURE()
    CASE nOpcao==13
       BANCO_DADOS_DBF()
    CASE nOpcao==14
       TELA()

 END
 *
 RETURN

*--------------------*
 FUNCTION EXEMPLO_MAIN()

 LOCAL GetList:={}

 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Estrutura inicial do programa",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 05,02 SAY "PROCEDURE MAIN()"
 @ 07,03 SAY "Introducao a linguagem Harbour"
 @ 09,02 SAY "RETURN"

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL