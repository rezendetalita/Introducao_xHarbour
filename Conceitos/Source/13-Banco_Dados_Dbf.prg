/*
 Uma tabela DBF � composta de registros (linhas) e campos (colunas).
*/

*-------------------------*
 FUNCTION BANCO_DADOS_DBF()

 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Banco dados DBF",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Banco_Dados_Dbf"
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 * =============================================================================
 *                             Cria��o de tabela
 *
 * Cria uma tabela. Exemplo:
 *
 /* DBCreate("PRODUTOS.DBF",{{"CODIGO" ,"N",05,0},;
                             {"NOME"   ,"C",50,0},;
                             {"PRECO"  ,"N",06,2},;
                             {"DATA"   ,"D",08,0},;
                             {"INATIVO","L",01,0}})
 */
 * O primeiro par�metro � o nome da tabela, e o segundo um array com a estrutura da tabela.
 *
 * Na estrutura temos 4 informa��es:
 *
 * 1� - Nome do campo (n�o pode ultrapassar 10 caracteres)
 * 2� - Tipo do campo: N - Num�rico, C - Texto, D - Data, L - L�gico
 * 3� - Tamanho do campo
 * 4� - Quantidade de decimais
 *
 * Cada tipo de campo possui um tamanho m�ximo. Portanto, n�o informe um tamanho maior que o permitido:
 *
 * | Tipo      | Tamanho m�ximo |
 * | -------------------------- |
 * | Caractere |            254 |
 * | Num�rico  |             19 |
 * | L�gico    |              1 |
 * | Data      |              8 |
 *
 * Outra informa��o importante � que o tamanho de um campo num�rico com decimais deve englobar a v�rgula e os decimais. Por exemplo:
 *
 * {"PRECO","N",6,2}
 *
 * Dos 6 d�gitos definidos no tamanho, 2 deles ser�o reservados aos decimais e 1 � v�rgula. Portanto, nesse campo h� espa�o para at� 3 inteiros.
 *
 * =============================================================================
 *                       Abertura e sele��o de tabela
 *
 * Sempre que a aplica��o precisar acessar uma tabela, seja para inserir, alterar, excluir ou ler os dados dela, essa tabela tem que estar aberta e selecionada.
 * Para abrir uma tabela usamos dois comandos:
 *
 * SELECT 1      // Prepara uma �rea de ID 1 para "armazenar" a tabela que ser� aberta em seguida
 * USE PRODUTOS  // Abre a tabela PRODUTOS
 *
 * SELECT 2     // Prepara uma �rea de ID 2 para "armazenar" a tabela que ser� aberta em seguida
 * USE CLIENTES // Abre a tabela CLIENTES
 *
 * Para cada tabela, deve haver uma �rea somente para ela. Por exemplo, se voc� fizer isso:
 *
 * SELECT 1
 * USE PRODUTOS
 *
 * SELECT 1
 * USE CLIENTES
 *
 * A tabela PRODUTOS ser� fechada, porque a CLIENTES foi aberta na �rea em que ela estava.
 * Para evitar esse tipo de problema, sempre use SELECT 0. Ao usar o 0, a aplica��o usar� a pr�xima �rea dispon�vel automaticamente:
 *
 * SELECT 0     // Prepara a �rea de ID 1
 * USE PRODUTOS
 *
 * SELECT 0     // Prepara a �rea de ID 2
 * USE CLIENTES
 *
 * Depois de abrir a tabela, ela ficar� selecionada automaticamente.
 * No exemplo, a tabela CLIENTES est� selecionada, porque ela foi aberta por �ltimo.
 *
 * Para trocar de tabela, voc� precisa selecion�-la, dessa forma:
 *
 * SELECT PRODUTOS
 *
 * Dessa forma, a tabela selecionada no momento � a PRODUTOS, e n�o a CLIENTES.
 * A CLIENTES continua aberta, mas n�o selecionada.
 *
 * Esse comando � muito importante, e precisa ser utilizado sempre que for necess�rio usar uma tabela.
 * Use-o com sabedoria e cuidado, caso contr�rio, a aplica��o ir� ler ou alterar os dados da tabela errada.
 *
 * =============================================================================
 *                         Fechamento de tabela
 *
 * Fecha todas as tabelas abertas. Use-o sempre que terminar de us�-las. Exemplo:
 /*
   SELECT 0
   USE PRODUTOS

   SELECT 0
   USE CLIENTES

   SELECT PRODUTOS
   // ... faz alguma coisa na PRODUTOS ...

   SELECT CLIENTES
   // ... faz alguma coisa na CLIENTES ...

   SELECT PRODUTOS
   // ... faz mais alguma coisa na PRODUTOS ...

   DBCloseAll() // Fecha todas as tabelas, porque elas n�o ser�o mais usadas
 */
 *
 * Lembrando que depois de fechada, a aplica��o n�o consegue usar mais a tabela.
 * Portanto, pra n�o ter que ficar abrindo e fechando tabela toda hora, apenas feche quando tudo tiver terminado.
 *
 * =============================================================================
 *                            Novo registro
 *
 * Para criar um novo registro na tabela:
 *
 * 1 - Selecione a tabela              = SELECT
 * 2 - Crie um novo registro em branco = DBAppend()
 * 3 - Preencha os campos              = REPLACE
 * 4 - Salve as inser��es              = DBCommit() ou DBCommitAll()
 *
 * Exemplo:
 /*
   SELECT PRODUTOS
   DBAppend()
   REPLACE CODIGO  WITH 1
   REPLACE NOME    WITH "PRODUTO TESTE"
   REPLACE PRECO   WITH 2.50
   REPLACE DATA    WITH CToD("01/01/2024")
   REPLACE INATIVO WITH .F.
   DBCommit()
 */
 * Voc� pode usar DBCommitAll(), ao inv�s de DBCommit(), para salvar tudo de uma vez. Exemplo:
 /*
   SELECT PRODUTOS
   DBAppend()
   REPLACE CODIGO  WITH 1
   REPLACE NOME    WITH "PRODUTO TESTE"
   *
   SELECT CLIENTES
   DBAppend()
   REPLACE CODIGO WITH 1
   REPLACE NOME   WITH "JOS�"
   *
   DBCommitAll()
 */
 * =============================================================================
 *                            Alterar um registro
 *
 * Para alterar um registro na tabela:
 *
 * 1 - Selecione a tabela    = SELECT
 * 2 - Posicione no registro = Vamos ver isso mais pra frente
 * 3 - Trave o registro      = RLock()
 * 4 - Preencha cos campos   = REPLACE
 * 5 - Salve as altera��es   = DBCommit() ou DBCommitAll()
 * 6 - Destrave o registro   = DBUnlock() ou DBUnlockAll()
 *
 * Exemplo:
 /*
   SELECT PRODUTOS
   RLock()
   REPLACE NOME WITH "ABACAXI"
   DBCommit()
   DBUnlock()
 */
 * Assim como DBCommitAll(), voc� pode usar DBUnlockAll() para desbloquear todos os registros travados:
 /*
   SELECT PRODUTOS
   RLock()
   REPLACE NOME WITH "ABACAXI"
   *
   SELECT CLIENTES
   RLock()
   REPLACE NOME WITH "MARIA"
   *
   DBCommitAll()
   DBUnlockAll()
 */
 * Os exemplos acima alteram o primeiro registro das tabelas PRODUTOS e CLIENTES.
 * Para alterar outro registro, voc� precisa posicionar nele, antes de trav�-lo.
 *
 * Geralmente, isso � feito com DBSeek() ou DBSkip().
 * Vamos abordar esse assunto mais pra frente.
 *
 * Outro detalhe, � poss�vel travar uma tabela toda com a fun��o FLock().
 * Mas � indicado apenas em casos de extrema necessidade.
 *
 * =============================================================================
 *                           Exclus�o de um registro
 *
 * Para excluir um registro na tabela:
 *
 * 1 - Selecione a tabela              = SELECT
 * 2 - Posicione no registro           = Vamos ver isso mais pra frente
 * 3 - Trave o registro                = RLock()
 * 4 - Marque o registro como deletado = DELETE
 * 5 - Destrave o registro             = DBUnlock() ou DBUnlockAll()
 *
 * Exemplo:
 /*
   SELECT PRODUTOS
   RLock()
   DELETE
   DBUnlock()
 */
 * Para remover registros marcados como deletados para "sempre" (isso � feito ao reindexar o Autosys), use o comando PACK.
 * Esse comando s� funciona se a tabela tiver sido aberta em modo exclusivo.
 *
 * Exemplo:
 /*
   SELECT 0
   USE PRODUTOS EXCLUSIVE
   PACK
 */
 * =============================================================================
 RETURN NIL