/*
 * Proyecto: Estrutura_basica de um programa em Harbour
*/

 // início do programa
 PROCEDURE MAIN()

 LOCAL nOpcao:=0, GetList:={}

 @ 01,00 SAY Replicate("-",80)
 @ 02,00 SAY PadC("Introducao a linguagem Harbour",80)
 @ 03,00 SAY Replicate("-",80)
 @ 04,01 SAY "Informe uma opcao: " GET nOpcao PICT "9"
 @ 06,02 SAY "1 - MAIN()"
 @ 07,02 SAY "2 - Variaveis"
 @ 08,02 SAY "3 - Constantes"
 @ 09,02 SAY "4 - Operadores"
 @ 10,02 SAY "5 - Estruturas de controle"
 @ 11,02 SAY "6 - Estruturas de repeticao"
 @ 12,02 SAY "7 - PROCEDURE e FUNCTION"
 @ 13,02 SAY "8 - Banco de dados DBF"
 @ 14,02 SAY "9 - Tela"
 @ 15,01 SAY "10 - Comandos SET"
 @ 16,01 SAY "11 - Comentarios"
 @ 17,01 SAY "12 - Ponto e vírgula"

 READ

 DO CASE
    CASE nOpcao==1
       //
    CASE nOpcao==2
       VARIAVEIS()
    CASE nOpcao==3
       CONSTANTES()
    CASE nOpcao==4
       OPERADORES()
    CASE nOpcao==5
       ESTRUTURAS_CONTROLE()
    CASE nOpcao==6
       ESTRUTURAS_REPETICAO()
    CASE nOpcao==7
       PROCEDURE_FUNCTION()
    CASE nOpcao==8
       BANCO_DADOS_DBF()
    CASE nOpcao==9
       TELA()
    CASE nOpcao==10
       COMANDOS_SET()
    CASE nOpcao==11
       COMENTARIOS()
    CASE nOpcao==12
       PONTO_E_VIRGULA()
 END

 RETURN
 //fim da execução