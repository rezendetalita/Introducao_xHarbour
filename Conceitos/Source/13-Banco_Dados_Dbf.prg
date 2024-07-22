/*
 Uma tabela DBF é composta de registros (linhas) e campos (colunas).
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
 * =============================================================================
 *                             Criação de tabela
 *
 * Cria uma tabela. Exemplo:
/*
 IF !IsDirectory("DBF")
    Run("MD DBF")
 ENDIF

 IF !File("DBF\PRODUTOS.DBF")
    DBCreate("DBF\PRODUTOS.DBF",{{"CODIGO" ,"N",05,0},;
                                 {"NOME"   ,"C",50,0},;
                                 {"PRECO"  ,"N",06,2},;
                                 {"DATA"   ,"D",08,0},;
                                 {"INATIVO","L",01,0}})
 ENDIF

 IF !File("DBF\CLIENTES.DBF")
    DBCreate("DBF\CLIENTES.DBF",{{"CODIGO" ,"N",05,0},;
                                 {"NOME"   ,"C",50,0}})
 ENDIF
 */
 * O primeiro parâmetro é o nome da tabela, e o segundo um array com a estrutura da tabela.
 *
 * Na estrutura temos 4 informações:
 *
 * 1º - Nome do campo (não pode ultrapassar 10 caracteres)
 * 2º - Tipo do campo: N - Numérico, C - Texto, D - Data, L - Lógico
 * 3º - Tamanho do campo
 * 4º - Quantidade de decimais
 *
 * Cada tipo de campo possui um tamanho máximo. Portanto, não informe um tamanho maior que o permitido:
 *
 * | Tipo      | Tamanho máximo |
 * | -------------------------- |
 * | Caractere |            254 |
 * | Numérico  |             19 |
 * | Lógico    |              1 |
 * | Data      |              8 |
 *
 * Outra informação importante é que o tamanho de um campo numérico com decimais deve englobar a vírgula e os decimais. Por exemplo:
 *
 * {"PRECO","N",6,2}
 *
 * Dos 6 dígitos definidos no tamanho, 2 deles serão reservados aos decimais e 1 à vírgula. Portanto, nesse campo há espaço para até 3 inteiros.
 *
 * =============================================================================
 *                       Abertura e seleção de tabela
 *
 * Sempre que a aplicação precisar acessar uma tabela, seja para inserir, alterar, excluir ou ler os dados dela, essa tabela tem que estar aberta e selecionada.
 * Para abrir uma tabela usamos dois comandos:
 /*
 SELECT 1          // Prepara uma área de ID 1 para "armazenar" a tabela que será aberta em seguida
 USE DBF\PRODUTOS  // Abre a tabela PRODUTOS

 SELECT 2         // Prepara uma área de ID 2 para "armazenar" a tabela que será aberta em seguida
 USE DBF\CLIENTES // Abre a tabela CLIENTES
 */
 * Para cada tabela, deve haver uma área somente para ela. Por exemplo, se você fizer isso:
 /*
 SELECT 1
 USE DBF\PRODUTOS

 SELECT 1
 USE DBF\CLIENTES
 */
 *
 * A tabela PRODUTOS será fechada, porque a CLIENTES foi aberta na área em que ela estava.
 * Para evitar esse tipo de problema, sempre use SELECT 0. Ao usar o 0, a aplicação usará a próxima área disponível automaticamente:
 /*
 SELECT 0     // Prepara a área de ID 1
 USE DBF\PRODUTOS

 SELECT 0     // Prepara a área de ID 2
 USE DBF\CLIENTES
 */
 *
 * Depois de abrir a tabela, ela ficará selecionada automaticamente.
 * No exemplo, a tabela CLIENTES está selecionada, porque ela foi aberta por último.
 *
 * Para trocar de tabela, você precisa selecioná-la, dessa forma:
 *
 * SELECT PRODUTOS
 *
 * Dessa forma, a tabela selecionada no momento é a PRODUTOS, e não a CLIENTES.
 * A CLIENTES continua aberta, mas não selecionada.
 *
 * Esse comando é muito importante, e precisa ser utilizado sempre que for necessário usar uma tabela.
 * Use-o com sabedoria e cuidado, caso contrário, a aplicação irá ler ou alterar os dados da tabela errada.
 *
 * =============================================================================
 *                         Fechamento de tabela
 *
 * DBCloseAll() fecha todas as tabelas abertas. Use-o sempre que terminar de usá-las. Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT 0
 USE DBF\CLIENTES

 SELECT PRODUTOS
 // ... faz alguma coisa na PRODUTOS ...

 SELECT CLIENTES
 // ... faz alguma coisa na CLIENTES ...

 SELECT PRODUTOS
 // ... faz mais alguma coisa na PRODUTOS ...

 DBCloseAll() // Fecha todas as tabelas, porque elas não serão mais usadas
 */
 *
 * Lembrando que depois de fechada, a aplicação não consegue usar mais a tabela.
 * Portanto, pra não ter que ficar abrindo e fechando tabela toda hora, apenas feche quando tudo tiver terminado.
 *
 * =============================================================================
 *                            Novo registro
 *
 * Para criar um novo registro na tabela:
 *
 * 1 - Selecione a tabela              = SELECT (a tabela precisa estar aberta)
 * 2 - Crie um novo registro em branco = DBAppend()
 * 3 - Preencha os campos              = REPLACE
 * 4 - Salve as inserções              = DBCommit() ou DBCommitAll()
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 1
 REPLACE NOME    WITH "PRODUTO TESTE"
 REPLACE PRECO   WITH 2.50
 REPLACE DATA    WITH CToD("18/07/2024")
 REPLACE INATIVO WITH .F.
 DBCommit()

 DBCloseAll()
 */
 * Você pode usar DBCommitAll(), ao invés de DBCommit(), para salvar tudo de uma vez. Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT 0
 USE DBF\CLIENTES

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 2
 REPLACE NOME    WITH "PRODUTO TESTE 2"

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 3
 REPLACE NOME    WITH "PRODUTO TESTE 3"

 SELECT CLIENTES
 DBAppend()
 REPLACE CODIGO WITH 1
 REPLACE NOME   WITH "JOSÉ"

 DBCommitAll()
 DBCloseAll()
 */
 * =============================================================================
 *                            Alterar um registro
 *
 * Para alterar um registro na tabela:
 *
 * 1 - Selecione a tabela    = SELECT (a tabela precisa estar aberta)
 * 2 - Posicione no registro = Vamos ver isso mais pra frente
 * 3 - Trave o registro      = RLock()
 * 4 - Preencha os campos    = REPLACE
 * 5 - Salve as alterações   = DBCommit() ou DBCommitAll()
 * 6 - Destrave o registro   = DBUnlock() ou DBUnlockAll()
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 RLock()
 REPLACE NOME WITH "AMORA"
 DBCommit()
 DBUnlock()

 DBCloseAll()
 */
 * Assim como DBCommitAll(), você pode usar DBUnlockAll() para desbloquear todos os registros travados:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT 0
 USE DBF\CLIENTES

 SELECT PRODUTOS
 RLock()
 REPLACE NOME WITH "ABACAXI"

 SELECT CLIENTES
 RLock()
 REPLACE NOME WITH "MARIA"

 DBCommitAll()
 DBUnlockAll()
 */
 * Os exemplos acima alteram o primeiro registro das tabelas PRODUTOS e CLIENTES.
 * Para alterar outro registro, você precisa posicionar nele, antes de travá-lo.
 *
 * Geralmente, isso é feito com DBSeek() ou DBSkip().
 * Vamos abordar esse assunto mais pra frente.
 *
 * Outro detalhe, é possível travar uma tabela toda com a função FLock().
 * Mas é indicado apenas em casos de extrema necessidade.
 *
 * =============================================================================
 *                           Exclusão de um registro
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
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 RLock()
 DELETE
 DBUnlock()

 DBCloseAll()
 */
 * Para remover registros marcados como deletados para "sempre" (isso é feito ao reindexar o Autosys), use o comando PACK.
 * Esse comando só funciona se a tabela tiver sido aberta em modo exclusivo.
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS EXCLUSIVE
 PACK
 DBCloseAll()
 */
 * =============================================================================
 *                            Obtendo o valor de um campo
 *
 * Para ler o valor que está armazenado em um campo, utilize a seguinte sintaxe: NOME_DA_TABELA->NOME_DO_CAMPO.
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 MessageBox(,"Código: " +Str(PRODUTOS->CODIGO)  +Chr(13)+Chr(10)+;
             "Nome: "   +PRODUTOS->NOME         +Chr(13)+Chr(10)+;
             "Preço: "  +Str(PRODUTOS->PRECO)   +Chr(13)+Chr(10)+;
             "Data: "   +DToC(PRODUTOS->DATA)   +Chr(13)+Chr(10)+;
             "Inativo: "+LToC(PRODUTOS->INATIVO)+Chr(13)+Chr(10))

 DBCloseAll()
 */
 *
 * =============================================================================
 *                             Índices e ordenação
 *
 * Índices podem ser usados para ordenar uma tabela. Exemplo:
 /*
 IF !IsDirectory("NTX")
    Run("MD NTX")
 ENDIF

 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 INDEX ON PRODUTOS->NOME                         TAG IND_NOME        TO NTX\IND_PRODUTOS // Cria o índice por nome
 INDEX ON PRODUTOS->CODIGO                       TAG IND_CODIGO      TO NTX\IND_PRODUTOS // Cria o índice por código
 INDEX ON Str(PRODUTOS->CODIGO,5)+PRODUTOS->NOME TAG IND_CODIGO_NOME TO NTX\IND_PRODUTOS // Cria o índice por código + nome

 DBCloseAll()
 */
 * No exemplo acima, foram criados três índices, no arquivo de nome IND_PRODUTOS (na pasta NTX):
 * 1 - IND_NOME ordena a tabela por nome
 * 2 - IND_CODIGO ordena a tabela por código
 * 3 - IND_CODIGO_NOME ordena a tabela por código + nome (como CODIGO é numérico, foi preciso convertê-lo para caractere, para concatená-lo ao NOME)
 *
 * Depois de criado, o arquivo de índice continuará existindo até que seja deletado.
 * Portanto, não há necessidade de ficar indexando (INDEX ON) a tabela toda hora.
 *
 * Se o índice já existe em arquivo, basta "amarrar" o arquivo à tabela.
 *
 * O relacionamento entre tabela e arquivo de índice será perdido quando a tabela é fechada.
 * Ao abrir a tabela, para recuperar esse relacionamento, use o comando SET INDEX TO diretório+nome_do_arquivo:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS // Relaciona o arquivo IND_PRODUTOS com a tabela PRODUTOS
 DBCloseAll()
 */
 * E para desfazer o relacionamento entre tabela e arquivo de índice (sem precisar fechar a tabela) use o comando SET INDEX TO:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS // Relaciona o arquivo IND_PRODUTOS com a tabela PRODUTOS
 SET INDEX TO                  // Desfaz o relacionamento
 DBCloseAll()
 */
 * Como o primeiro índice do arquivo é o IND_NOME, a tabela será ordenada pelo campo NOME.
 * Para trocar a ordenação da tabela, use a função OrdSetFocus(TAG):
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("IND_CODIGO") // Ordena a tabela por código

 SELECT PRODUTOS
 OrdSetFocus("IND_NOME") // Ordena a tabela por nome

 DBCloseAll()
 */
 *
 * =============================================================================
 *                         Posicionamento de um registro
 *
 * Existem diversas formas de navegar pelos registros de uma tabela.
 * Qual vai ser usada? Tudo depende da situação.
 *
 * Lembre-se de selecionar a tabela desejada, antes de navegar por ela :)
 *
 * Se você quer ir para o primeiro registro da tabela, use DBGoTop():
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBGoTop()

 DBCloseAll()
 */
 *
 * Se você quer ir para o próximo registro, use DBSkip():
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBSkip()

 DBCloseAll()
 */
 *
 * Se você quer ir para o último registro, use DBGoBottom():
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBGoBottom()

 DBCloseAll()
 */
 * Se você quer percorrer todos os registros de uma tabela, você pode fazer assim:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBGoTop()       // Posiciona no primeiro registro
 DO WHILE !Eof() // Fazer enquanto não for o final do arquivo
    DBSkip()     // Pula para o próximo registro. Se o próximo registro é o final do arquivo, vai sair do DO WHILE.
 ENDDO

 DBCloseAll()
 */
 *
 * Se você quer posicionar em um registro específico, mas não sabe onde ele está, você precisa buscar alguma informação que identifique-o.
 * Para isso, usaremos a função DBSeek(). Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("IND_CODIGO") // Ordena a tabela por código
 DBSeek(2)                 // Busca o número 2 no campo ordenado (CODIGO)
 */
 * No exemplo acima, DBSeek() vai posicionar no primeiro registro que existir na tabela, com o campo CODIGO igual à 2.
 *
 * Você pode também, buscar mais de uma informação:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("IND_CODIGO_NOME") // Ordena a tabela por código
 DBSeek(Str(2,5)+"PRODUTO TESTE 2") // Busca "    3"+ "PRODUTO TESTE 2" nos campos ordenados (Str(CODIGO,5)+NOME)
 */
 * DBSeek() retorna .T. se encontrar algum registro, .F. se não encontrar.
 * Você pode usá-lo em um IF para confirmar se um registro foi encontrado ou não.
 *
 * E se ele encontrar mais de um registro?
 * Como dito anteriormente, DBSeek() posicionária no primeiro registro que encontrou.
 * E já que a tabela está ordenada, os demais registros virão em seguida.
 *
 * Nesse caso, você pode fazer um DO WHILE para percorrer os demais registros válidos:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("IND_NOME") // Ordena a tabela por código
 DBSeek("PRODUTO TESTE") // Busca "PRODUTO TESTE" no campo ordenado (NOME)

 // Há dois produtos com esse nome na tabela PRODUTOS. DBSeek() posicionou no primeiro.
 // O DO WHILE abaixo vai percorrer a tabela PRODUTOS, enquanto o NOME do registro posicionado, corresponder ao que foi buscado ("PRODUTO TESTE").
 // Portanto, a mensagem será exibida duas vezes.

 DO WHILE !Eof() .AND. PRODUTOS->NOME=="PRODUTO TESTE"
    MessageBox(,Str(PRODUTO->CODIGO)+' '+PRODUTO->NOME)
    DBSkip()
 ENDDO
 */
 *
 * =============================================================================
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN NIL