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
 *
 IF !IsDirectory("DBF")
    Run("MD DBF")
 ENDIF

 IF !File("DBF\PRODUTOS.DBF")
    DBCreate("DBF\PRODUTOS.DBF",{{"CODIGO" ,"N",05,0},;
                                 {"NOME"   ,"C",50,0},;
                                 {"PRECO"  ,"N",06,2},;
                                 {"DATA"   ,"D",08,0},;
                                 {"INATIVO","L",01,0},;
                                 {"CLIENTE","N",05,0}})
 ENDIF

 IF !File("DBF\CLIENTES.DBF")
    DBCreate("DBF\CLIENTES.DBF",{{"NOME"   ,"C",50,0},;
                                 {"CODIGO" ,"N",05,0}})
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
 * No exemplo acima, a tabela CLIENTES está selecionada, porque ela foi aberta por último.
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
 REPLACE NOME    WITH "PRODUTO TESTE 1"
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

 SELECT CLIENTES
 DBAppend()
 REPLACE CODIGO WITH 1
 REPLACE NOME   WITH "JOSÉ"

 SELECT CLIENTES
 DBAppend()
 REPLACE CODIGO WITH 3
 REPLACE NOME   WITH "GABRIEL"

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 2
 REPLACE NOME    WITH "PRODUTO TESTE 2"
 REPLACE CLIENTE WITH 3

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 3
 REPLACE NOME    WITH "PRODUTO TESTE 3"
 REPLACE CLIENTE WITH 3

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH 4
 REPLACE NOME    WITH "PRODUTO TESTE 4"
 REPLACE CLIENTE WITH 1

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
 REPLACE PRECO WITH 4.00
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
 REPLACE PRECO WITH 3.00

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

 MessageBox(,"Código: "              +Str(PRODUTOS->CODIGO)  +Chr(13)+Chr(10)+;
             "Nome: "                +PRODUTOS->NOME         +Chr(13)+Chr(10)+;
             "Preço: "               +Str(PRODUTOS->PRECO)   +Chr(13)+Chr(10)+;
             "Data: "                +DToC(PRODUTOS->DATA)   +Chr(13)+Chr(10)+;
             "Inativo: "             +LToC(PRODUTOS->INATIVO)+Chr(13)+Chr(10))

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
 INDEX ON PRODUTOS->NOME                         TAG NOME    TO NTX\IND_PRODUTOS // Cria o índice por nome
 INDEX ON PRODUTOS->CODIGO                       TAG CODIGO  TO NTX\IND_PRODUTOS // Cria o índice por código
 INDEX ON Str(PRODUTOS->CODIGO,5)+PRODUTOS->NOME TAG CODNOME TO NTX\IND_PRODUTOS // Cria o índice por código + nome

 DBCloseAll()
 */
 *
 * ATENÇÃO: TAG é o nome do índice, e pode ter no máximo 10 caracteres. Se informado mais de 10, o nome é automaticamente cortado.
 *
 * No exemplo acima, foram criados três índices, no arquivo de nome IND_PRODUTOS (na pasta NTX):
 * 1 - NOME ordena a tabela por nome
 * 2 - CODIGO ordena a tabela por código
 * 3 - CODNOME ordena a tabela por código + nome (como CODIGO é numérico, foi preciso convertê-lo para caractere, para concatená-lo ao NOME)
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
 * Como o primeiro índice do arquivo é o NOME, a tabela será ordenada pelo campo NOME.
 * Para trocar a ordenação da tabela, use a função OrdSetFocus(TAG):
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("NOME") // Ordena a tabela por código

 SELECT PRODUTOS
 OrdSetFocus("CODIGO") // Ordena a tabela por nome

 SELECT PRODUTOS
 OrdSetFocus("CODNOME") // Ordena a tabela por código e nome

 DBCloseAll()
 */
 * =============================================================================
 *                         Posicionamento de um registro
 *
 * Existem diversas formas de navegar pelos registros de uma tabela.
 * Qual vai ser usada? Tudo depende da situação.
 *
 * DBGoTop() posiciona no primeiro registro da tabela.
 * DBSkip() posiciona no próximo registro.
 * DBGoBottom() posiciona no último registro da tabela.
 *
 * Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 DBGoTop()       // Resultado: Posiciona no Registro 1
 DBSkip()        // Resultado: Posiciona no registro 2
 DBGoBottom()    // Resultado: Posiciona no registro 4

 DBCloseAll()
 */
 * Para percorrer todos os registros de uma tabela, você pode fazer assim:
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
 * Para posicionar em um registro específico, mas não se sabe em que posição ele está, você precisa buscar alguma informação que identifique-o.
 * Para isso, usaremos a função DBSeek(). DBSeek() retorna .T. se encontrar algum registro, .F. se não encontrar.
 * Você pode usá-lo em um IF para confirmar se um registro foi encontrado ou não.
 *
 * No exemplo abaixo, DBSeek() vai posicionar no primeiro registro encontrado, com o campo CODIGO igual a 2:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("CODIGO") // Ordena a tabela pelo campo CODIGO

 IF DBSeek(2) // Busca o número 2 no campo ordenado
    MessageBox(,"Achou: "+PRODUTOS->NOME)
  ELSE
    MessageBox(,"Não achou")
 ENDIF

 DBCloseAll()
 */
 * Para buscar mais de uma informação:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("CODNOME") // Ordena a tabela por código + nome (Str(CODIGO,5)+NOME)

 IF DBSeek(Str(3,5)+"PRODUTO TESTE 3") // Busca "    3"+"PRODUTO TESTE 3" nos campos ordenados
    MessageBox(,"Achou: "+PRODUTOS->NOME)
  ELSE
    MessageBox(,"Não achou")
 ENDIF

 DBCloseAll()
 */
 * Se houver mais de um registro com a informação buscada, DBSeek() posicionará no primeiro registro encontrado.
 * Por exemplo, na tabela temos 4 produtos com nome "PRODUTO TESTE n". Ao buscar por "PRODUTO TESTE", o DBSeek() encontrará o primeiro: "PRODUTO TESTE 1":
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("NOME") // Ordena a tabela pelo campo NOME
 DBSeek("PRODUTO TESTE") // Busca "PRODUTO TESTE" no campo ordenado
 MessageBox(,"Registro: "+Str(Recno())) // Resultado: Registro 1

 DBCloseAll()
 */
 * Vamos supor que você precisa inativar todos os produtos com nome "PRODUTO TESTE".
 * Já que a tabela está ordenada por nome, os demais produtos estão logo após do primeiro registro encontrado.
 *
 * Nesse caso, você pode fazer um DO WHILE para percorrer os demais produtos:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT MOVPROD
 OrdSetFocus("NOME") // Ordena a tabela por código
 DBSeek("PRODUTO TESTE") // Busca "PRODUTO TESTE" no campo ordenado (NOME)

 // Há quatro produtos com esse nome na tabela PRODUTOS. DBSeek() posicionou no primeiro.
 // O DO WHILE abaixo vai percorrer a tabela PRODUTOS, enquanto o NOME do registro posicionado, corresponder ao que foi buscado ("PRODUTO TESTE").
 // Portanto, a mensagem será exibida quatro vezes.

 DO WHILE !Eof() .AND. SubStr(PRODUTOS->NOME,1,13)=="PRODUTO TESTE"
    MessageBox(,"Começo do DO WHILE"              +Chr(13)+Chr(10)+;
                "Código: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo()))

    RLock()
    REPLACE INATIVO WITH .F.
    DBCommit()
    DBUnlock()

    DBSkip()

    MessageBox(,"Fim do DO WHILE"                 +Chr(13)+Chr(10)+;
                "Código: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo()))
 ENDDO

 DBCloseAll()
 */
 * =============================================================================
 *                                  Filtro
 *
 * Há duas formas de filtrar uma tabela DBF:
 *
 * 1 - com INDEX ON ... FOR
 * 2 - com DBSetFilter()
 *
 * Exemplo de filtro com INDEX ON ... FOR:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 INDEX ON PRODUTOS->CODIGO TAG "CODFILTRO" TO NTX\IND_PRODUTOS FOR PRODUTOS->CODIGO==1 .OR. PRODUTOS->CODIGO==2

 SELECT PRODUTOS
 DBGoTop()
 DO WHILE !Eof() // Resultado: exibirá apenas os produtos de código 1 e 2
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "Código: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBCloseAll()
 */
 * Como o filtro fica ligado à um índice, se a ordem da tabela mudar, o filtro também se perde. Exemplo:
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("CODFILTRO")
 DBGoTop()
 DO WHILE !Eof() // Exibirá os produtos de código 1 e 2
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "Código: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 SELECT PRODUTOS
 OrdSetFocus("CODIGO")
 DBGoTop()
 DO WHILE !Eof() // Exibirá todos os os produtos, porque o índice CODIGO não tem filtro
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "Código: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBCloseAll()
 */
 * Com DBSetFilter() isso já não acontece, porque o filtro não estará ligado à um índice.
 * Exemplo de filtro com DBSetFilter():
 /*
 SELECT 0
 USE DBF\PRODUTOS
 SET INDEX TO NTX\IND_PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("NOME")
 DBSetFilter({|| PRODUTOS->CODIGO==1 .OR. PRODUTOS->CODIGO==2},"PRODUTOS->CODIGO==1 .OR. PRODUTOS->CODIGO==2")
 DBGoTop()
 DO WHILE !Eof() // Exibirá os produtos de código 1 e 2
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "Código: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 SELECT PRODUTOS
 OrdSetFocus("CODIGO")
 DBGoTop()
 DO WHILE !Eof() // Exibirá os produtos de código 1 e 2, mesmo que a ordem tenha sido alterada
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "Código: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBClearFilter()

 SELECT PRODUTOS
 DBGoTop()
 DO WHILE !Eof() // Exibirá todos os produtos
    MessageBox(,"Ordem: "   +OrdSetFocus()        +Chr(13)+Chr(10)+;
                "Registro: "+Str(RecNo())         +Chr(13)+Chr(10)+;
                "Código: "  +Str(PRODUTOS->CODIGO)+Chr(13)+Chr(10)+;
                "Nome: "    +PRODUTOS->NOME       +Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBCloseAll()
 */
 *
 * =============================================================================
 *                              Relacionamento
 *
 * O relacionamento consiste em "amarrar" registros de duas tabelas que tenham algum dado em comum.
 * Dessa forma, ao navegar por uma tabela, automaticamente a outra acompanha essa navegação.
 *
 * Por exemplo, vamos relacionar a tabela PRODUTOS e CLIENTES.
 * Esse relacionamento será feito usando os campos PRODUTOS->CLIENTE e CLIENTES->CODIGO:
 * A ideia é: percorrer os registros da tabela PRODUTOS, e exibir o nome do cliente.
 *
 * Primeiro, precisamos indexar a tabela CLIENTES pelo campo CODIGO, pois é a ordem que irá apontar qual campo será relacionado:
 /*
 SELECT 0
 USE DBF\CLIENTES
 INDEX ON CLIENTES->CODIGO TAG CODIGO TO NTX\IND_CLIENTES
 INDEX ON CLIENTES->NOME   TAG NOME   TO NTX\IND_CLIENTES

 DBCloseAll()
 */
 * A ordenação da tabela CLIENTES é que vai apontar qual campo será relacionado.
 * Para fazer o relacionamento:
 /*
 SELECT 0
 USE DBF\CLIENTES
 SET INDEX TO NTX\IND_CLIENTES

 SELECT CLIENTES
 OrdSetFocus("CODIGO") // Ordena a tabela pelo campo que será relacionado

 SELECT 0
 USE DBF\PRODUTOS
 DBSetRelation("CLIENTES",{|| PRODUTOS->CLIENTE},"PRODUTOS->CLIENTE") // Relaciona a tabela CLIENTES (campo CODIGO) com a PRODUTOS (campo CLIENTE)

 SELECT CLIENTES
 OrdSetFocus("NOME")

 SELECT PRODUTOS
 DBGoTop()
 DO WHILE !Eof()
    MessageBox(,"Produto: "+PRODUTOS->NOME+Chr(13)+Chr(10)+;
                "Cliente: "+CLIENTES->NOME+Chr(13)+Chr(10))
    DBSkip()
 ENDDO

 DBCloseAll()
 */
 *
 * ATENÇÃO: Mudar a ordem da tabela CLIENTES, e navegar na tabela PRODUTOS, desfaz o relacionamento.
 *
 * =============================================================================
 *            Dica - Salvar e restaurar o "status" da tabela
 *
 * Ao trabalhar com tabelas DBF, recomendamos que:
 *
 * 1 - Você salve a tabela selecionada, antes de fazer um SELECT
 * 2 - Você salve a ordem e o registro da tabela, antes de alterá-los
 *
 * Mas calma, que não é pra fazer isso toda hora rs
 *
 * A primeira dica é ideal de ser usada ao criar uma nova função, onde será usado o SELECT em algum momento.
 * Já no começo da função SALVE a tabela, e antes de sair da função, RESTAURE a tabela que estava selecionada antes.
 *
 * Exemplo:
 *
 * FUNCTION EXEMPLO()
 *
 * LOCAL nArea:=Select() // Salva na variável nArea, o ID da tabela selecionada (ex: CLIENTES)
 *
 * SELECT PRODUTOS
 * Faz alguma coisa
 *
 * Select(nArea) // Restaura a tabela que estava selecionada antes (ex: CLIENTES)
 *
 * RETURN NIL
 *
 * A segunda dica é ideal  para casos em que é necessário alterar a ordem ou o registro de uma tabela.
 * SALVE a ordem e o registro da tabela antes de alterá-los, e depois RESTAURE-os.
 *
 * Exemplo:
 *
 * FUNCTION EXEMPLO()
 *
 * LOCAL nArea:=Select(), cOrdem_Produtos, nRegistro_Produtos
 *
 * SELECT PRODUTOS
 * cOrdem_Produtos   :=OrdSetFocus("NOME")  // Salva a ordem da tabela PRODUTOS (ex: CODIGO), e altera a ordem para NOME
 * nRegistro_Produtos:=RecNo()              // Salva o registro da tabela PRODUTOS (ex: 1)
 *
 * DBSeek("PRODUTO TESTE 3")                // Muda de registro (ex: 3)
 * Faz alguma coisa
 *
 * PRODUTOS->(OrdSetFocus(cOrdem_Produtos)) // Restaura a ordem anterior (ex: CODIGO)
 * PRODUTOS->(DBGoTo(nRegistro_Produtos))   // Restaura o registro anterior (ex: 1)
 *
 * Select(nArea) // Restaura a tabela que estava selecionada antes (ex: CLIENTES)
 *
 * RETURN NIL
 *
 * Ao salvar e restaurar esses status, você evitará bugs que podem acontecer ao voltar para a função pai.
 * Um exemplo bem comum no Autosys, são nas telas que exibem listas (ex: cadastro de clientes, produtos, etc).
 *
 * Ao acessar uma funcionalidade dentro dessas telas, e voltar para a lista, se o "Salvar e restaurar" não for feito corretamente, pode acontecer:
 * - Um erro, porque o sistema tentará acessar campos de uma tabela que não está selecionada mais.
 * - A ordem será alterada (ex: estava por ordem alfabética, e não está mais)
 * - O registro não é mais o mesmo (ex: você estava no produto 1, e aí foi pro último)
 */
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN NIL