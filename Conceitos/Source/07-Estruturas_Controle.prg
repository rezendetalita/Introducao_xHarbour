/* Estruturas de controle
   Nas estruturas de controle, determinada ação ocorre caso uma condição seja Verdadeira ou Falsa*/

* =============================================================================== *
*                                    Sintaxe - IF                                 *
*   IF <condição>
*      se a condição for .T., faça algo
*   ENDIF

*   IF <condição>
*      se a condição for .T., faça algo
*    ELSE
*      senão, faça outra coisa
*   ENDIF
*
*   IF <condição>
*      se a condição for .T., faça algo
*    ELSEIF <condição2>
*      senão se a condição2 for .T., faça algo
*    ELSE
*      senão, se nenhuma das condições anteriores for .T., faça outra coisa
*   ENDIF

   //Sintaxe especial do IF
*   IIF{condição, se a condição for .T. faça algo, senão faça outra coisa}

* =============================================================================== *
*                                   Sintaxe - DO CASE                             *

*   DO CASE
*      CASE <condição1>
*           faça algo
*      CASE <condição2>
*           faça algo
*      .
*      .
*      .
*      OTHERWISE
*          caso nenhuma condição seja atendida
*   ENDCASE

* =============================================================================== *
*                                   Sintaxe - SWITCH
*
*   SWITCH <xVariavel>
*     CASE <valor1>
*         <instruções>...
*         [EXIT]
*     CASE <valor2>]
*         <instruções>...
*         [EXIT]
*     [OTHERWISE]
*         <instruções>...
*   END
*/
* =============================================================================== *

 FUNCTION  ESTRUTURAS_CONTROLE()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Estruturas de controle/decisao",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,00 SAY "IF...ELSEIF...ELSE"
 @ 05,01 SAY CONDICAO_IF()
 *
 @ 08,00 SAY Replicate("-",119)
 *
 @ 10,00 SAY "DO CASE"
 @ 11,01 SAY "Motivo da desoneracao: " + DO_CASE()
 *
 @ 12,00 SAY Replicate("-",119)
 *
 @ 13,00 SAY "SWITCH"
 @ 14,01 SAY SWITCH()


 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*----------------------------------------------*
 FUNCTION CONDICAO_IF()

 LOCAL cUF:='MG'

 @ 06,01 SAY "UF informada: " + AllTrim(cUF)

 IF cUF='AC'
    @ 07,01 SAY "CodIBGE inicia com: 12"
  ELSEIF cUF='AL'
    @ 07,01 SAY "CodIBGE inicia com: 27"
  ELSEIF cUF='AP'
    @ 07,01 SAY "CodIBGE inicia com: 16"
  ELSEIF cUF='AM'
    @ 07,01 SAY "CodIBGE inicia com: 13"
  ELSEIF cUF='MG'
    @ 07,01 SAY "CodIBGE inicia com: 31"
  ELSE
    @ 07,01 SAY "UF nao cadastrada."
 ENDIF

 RETURN NIL
*----------------------------------------------*

 FUNCTION DO_CASE()

 LOCAL nTipo:=3, cDescrOpc:=''

 DO CASE
   CASE nTipo==0
      cDescrOpc:=' '
   CASE nTipo==1
      cDescrOpc:='Taxi'
   CASE nTipo==3
      cDescrOpc:='Produtor Agropecuario'
   CASE nTipo==4
      cDescrOpc:='Frotista/Locadora'
   CASE nTipo==5
      cDescrOpc:='Diplomatico/Consular'
   CASE nTipo==6
      cDescrOpc:='Utilitarios e Motocicletas da Amazonia e Areas de Livre Comercio'
   OTHERWISE
      cDescrOpc:='Motivo invalido'
 ENDCASE

RETURN cDescrOpc

*----------------------------------------------*

 FUNCTION SWITCH()

 LOCAL cRetorno:='', nOpc

 INPUT "Escolha uma opcao de 1 a 4: " TO nOpc
 *
 SWITCH nOpc
   CASE 1
      cRetorno:='Inclusao de cheque'
      EXIT
   CASE 2
      cRetorno:='Pagamento com cheque'
      EXIT
   CASE 3
      cRetorno:='Recebimento com cheque'
      EXIT
   CASE 4
      cRetorno:='Transferencia do cheque'
      EXIT
 END
 *
 RETURN cRetorno
