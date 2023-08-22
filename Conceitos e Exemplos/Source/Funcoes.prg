/*
 * Proyecto: Trabalhando com Funções
*/

*----------------------------------------------*
FUNCTION Condicao_IF()

   LOCAL dVencimento, nDiasFaltantes

   SET DATE BRITISH

   dVencimento   :=CTOD( "17/07/2023" )
   *dVencimento   :=CTOD( "28/08/2023" )
   *dVencimento   :=CTOD( "23/08/2023" )

   nDiasFaltantes:=dVencimento-Date()

   ? "----------------------------------------------------------------------"
   ? "                    Estrutura de Decisao - IF/ELSE                    "
   ? "----------------------------------------------------------------------"
   ?"                                                                       "
   ?"Data da busca  : " , DToC(Date())
   ?"Data vencimento: " , dVencimento
   ?"                                                                       "
   IF dVencimento<Date()
      ? "Produto vencido, retire do estoque!"
    ELSEIF dVencimento==Date()
      ? "Hoje e a data limite de venda do produto."
    ELSE
      ? "Produto dentro da data de validade," + ;
        "faltam "+AllTrim(Str(nDiasFaltantes))+ ;
        "dias para o vencimento."
   ENDIF

RETURN NIL
*----------------------------------------------*

FUNCTION Condicao_DoCase()

   LOCAL nNota:=0

   ? "----------------------------------------------------------------------"
   ? "                   Estrutura de Decisao - DO CASE                     "
   ? "----------------------------------------------------------------------"
   ?"                                                                       "
   // Recebe o valor da nota
   INPUT "Informe a nota do aluno : " TO nNota

   // Decide se foi aprovado ou não de acordo com a média
   DO CASE
      CASE ( nNota > 10 ) .OR. ( nNota < 0 )
         ? "Valor invalido"
      CASE ( nNota >= 7 )
         ? "Aluno Aprovado"
      CASE ( nNota >= 5 )
         ? "Aluno em Recuperacao"
      CASE ( nNota >= 0 )	
         ? "Aluno Reprovado"
      OTHERWISE
         ? "Valor invalido"
   ENDCASE

RETURN NIL

*----------------------------------------------*

 FUNCTION Condicao_Switch()

   LOCAL nOpc

   ? "----------------------------------------------------------------------"
   ? "                  Estrutura de Decisao - SWITCH                       "
   ? "----------------------------------------------------------------------"
   ?"                                                                       "
   INPUT "Escolha uma opcao( 1 , 2 ou 3)  : " TO nOpc

   SWITCH nOpc
      CASE 1
         ? "Opcao escolhida: 1"
         EXIT
      CASE 2
         ? "Opcao escolhida: 2"
         EXIT
      CASE 3
         ? "Opcao escolhida: 3"
         EXIT
   END

RETURN NIL
*----------------------------------------------*
//FUNCTION GET_TIPO_HISTORICO_VEICULOS(nTipo,cCliFor)