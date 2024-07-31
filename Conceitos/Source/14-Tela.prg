/*Interface em modo texto*/

 FUNCTION TELA()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Funcoes da interface Harbour",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Tela"
 *
 * ===================================================================================*
 *                                     @...BOX e @...TO                               *
 *
 * Desenham uma estrutura retangular na tela.
 *
 * @...BOX  - permite determinar qual conjunto de caracteres você irá usar na moldura.
 *            A ordem para informar os caracteres deve começar pelo caractere do
 *            canto superior esquerdo e terminar no caractere do lado esquerdo.
 * Sintaxe
 *   @ <nLinTopo>, <nColTopo>, <nLinBase>, <nColBase> BOX <cCaixa>
 *
 * Exemplo:
 * @ 06, 01, 05, 50 BOX "*"
 *
 *
 * @...TO  - é mais simples do que o @...BOX, porque ele já pressupõe quais
 *           caracteres você usará para fazer o contorno do retângulo.
 * Sintaxe
 *   @ <nLinTopo>, <nColTopo> TO <nLinBase>, <nColBase>
 *
 *   @ <nLinTopo>, <nColTopo> TO <nLinBase>, <nColBase> [DOUBLE]
 *
 * Exemplo:
 * @ 06, 01 TO 10, 50
 *
 * @ 12, 01 TO 22, 50 DOUBLE
 *
 * ===================================================================================*
 *                                     @CLEAR e CLS                                   *
 *
 * Tanto o @CLEAR quanto o CLS servem para limpar um conteúdo na tela.
 *
 * @CLEAR  - limpar a região delimitada pelas coordenadas informadas.
 * CLS     - limpa a tela toda, por isso ele não tem o @
 *
 * Sintaxe
 *   @ <nLinTopo>, <nColTopo> CLEAR [TO <nLinBase>, <nColBase>]
 *
 * ===================================================================================*
 *                                     @PROMPT e MENU TO                              *
 *
 * Eles funcionam em conjunto e são usados para criar um menu simples na tela.
 *
 * Exemplo
 * PROMPT_MENUTO()
 *
 * ===================================================================================*
 *                                     @SAY, GET e READ
 *
 * O comando @...SAY...GET é usado para criar formulários de entradas de dados.
 * Ele exige que a variável que receberá o valor da entrada de dados seja definida
 * previamente, e não basta somente declarar a variável, você deve atribuir-lhe
 * um valor inicial.

 * O comando @...SAY...GET possui também uma variável oculta que não aparece no comando,
 * mas que é necessária para seu funcionamento, é a variável "GetList".
 *
 * O GetList é um array que vai armazenar os GET’s informados no formulário.
 * Portanto, sempre que for usar o comando @...GET ou @...SAY...GET declare o vetor
 * GetList com escopo local: LOCAL GetList:= {}
 *
 * Exemplo
 * SAY_GET()
 *
 * Complementos do comando:
 *
 * READ   - Cria um estado de espera, até que o valor do GET seja capturado e permite
 *          a navegação entre as opções do formulário.
 *
 * SPACE()- Como vimos, eu sempre preciso inicializar a variável que será usada no GET.
 *          Quando essa variável for do tipo caractere, é preciso inicializá-la
 *          com o tamanho máximo que ela irá ocupar. Para isso, usamos a função
 *          SPACE() que retorna uma string do tamanho informado como argumento na função.
 *          Por exemplo: SPACE(50) retorna uma string com cinquenta espaços.
 *
 * VALID  - São validações que você pode utilizar ao fazer a captura de GET.
 *          O VALID sempre retorna um valor lógico (.T., .F.)
 *          Quando estamos preenchendo um campo que possui a cláusula VALID, só sairemos dele
 *          se o valor informado satisfazer a validação correspondente.
 *
 * WHEN   - A cláusula WHEN possui um comportamento semelhante a cláusula VALID.
 *          A diferença é que a validação feita por WHEN é executada sempre que o usuário
 *          tentar entrar no campo.
 *
 * Exemplo
 * SAY_GET_2()
 *
 * =============================================================================================*
 *                                     PICT
 *
 * O comando @...GET possui uma série de “máscaras” que permitem formatar a entrada de dados
 * de acordo com sua especificação.
 *
 * PICT "!”     = converte apenas um caractere para maiúscula e omite os demais da edição.
 *                O símbolo “!” limita a quantidade de caracteres de acordo com
 *                a quantidade de símbolos digitados.
 *
 * PICT "!!!!!” = Converte então 5 caracteres para letra maiúscula
 *
 * PICT “!@”    = Esse pict usa o tamanho máximo da variável e aplica o símbolo “!” a todos os
 *                caracteres, não importa quantos sejam.
 *
 * Exemplo 1
 * PICT_1()
 *
 * PICT ”9”     = Restringe a entrada de somente números
 *
 * PICT "@E"    = Inverte automaticamente a posição de pontos e vírgulas durante a exibição da variável
 *                dentro do GET. Ou seja, você pode digitar uma vírgula para separar decimais,
 *                mas a variável receberá automaticamente o simbolo “ponto” que é o separador correto.
 * Exemplo 2
 * PICT_2()
 *
 * ===============================================================================================================================*
 *                                     DBEdit()
 *
 * A função DbEdit() é usada para exibir dados armazenados de um arquivo DBF na forma GRID.
 *
 * Sintaxe:
 * DbEdit( [<nTop>]           , ;    // <nTop> e <nLeft> indicam as coordenadas para o canto superior esquerdo da tela.
 *         [<nLeft>]          , ;
 *
 *         [<nBottom>]        , ;    // Indica a coordenada da linha inferior da tela (altura).
 *
 *         [<nRight>]         , ;    // Indica a coordenada da coluna direita da tela (largura).
 *
 *         [<aColumns>]       , ;    // Vetor contendo o nome dos campos da tabela que serão exibidos na tela.
 *                                      Se esse parâmetro não for especificado, serão exibidos todos os campos da tabela atual.
 *
 *         [<bcUserFunc>]     , ;    // Envia o nome de uma função definida pelo usuário que é executada quando uma tecla não reconhecível
 *                                      é pressionada ou quando não há nenhuma tecla pendente no buffer do teclado.
 *                                      Não coloque parênteses ou argumentos.
 *
 *         [<xSayPictures>]   , ;    // Define a formatação dos elementos apresentados, pode ser um vetor ou uma string.
 *                                      Se for um vetor, o seu conteúdo deve ser as máscaras de formatação de cada coluna.
 *                                      Se for uma string, a mesma formatação será aplicada a todas as colunas.
 *                                      Se não for especificado, a formatação de dados adequada de cada dado será aplicada automaticamente.
 *
 *         [<xColumnHeaders>] , ;    // Define os cabeçalhos exibidos para cada coluna.
 *                                      Se não for informado, os cabeçalhos receberão os nomes dos campos da tabela que serão retornados.
 *
 *         [<xHeadingSep>     , ;    // Usado para desenhar linhas horizontais que separam os títulos das colunas da área de exibição de dados.
 *
 *         [<xColumnSep>      , ;    // Define os separadores dos cabeçalhos das colunas. Também pode ser um vetor ou uma string.
 *                                      Se for um vetor, o seu conteúdo deve ser os separadores dos cabeçalhos de cada coluna.
 *                                      Se for uma string, o mesmo separador será usado para todas as colunas.
 *
 *         [<xFootingSep>     , ;    // Utilizado como <xHeadingSep> para a exibição de uma linha horizontal separando a área de rodapé
 *                                      das colunas da área de dados.
 *
 *         [<xColumnFootings> , ;    // Usado como <xColumnHeaders> para a exibição dos rodapés das colunas.

 *         [<xColumnPreBlock> , ;    // Usado para pré-validar a entrada de dados na célula atual da tela.

 *         [<xColumnPostBlock>)      // Usado da mesma forma que <aColumnPreBlock>, mas é usado para pós-validação.
 *
 * Exemplo
   DB_EDIT()
 *
 * =============================================================================================*

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*---------------------------------------------*
 FUNCTION PROMPT_MENUTO()

 LOCAL nOpcao

 // Cria uma caixa com @...TO
 @ 06, 06 TO 10, 19 DOUBLE

 //Inicia o menu
 @ 07,07 PROMPT " Cadastro "
 @ 08,07 PROMPT " Relatorios "
 @ 09,07 PROMPT " Utilitarios"

 //Seleciono a opção
 MENU TO nOpcao

 //Analiso o valor de nOpcao
 DO CASE
    CASE nOpcao == 1
      @ 10,01 SAY "Voce selecionou cadastro"
    CASE nOpcao == 2
      @ 10,01 SAY "Voce selecionou relatorios"
    CASE nOpcao == 3
      @ 10,01 SAY "Voce selecionou utilitarios"
    OTHERWISE
      @ 10,01 SAY "Nenhuma das alternativas"
 ENDCASE

RETURN NIL

*--------------------------------------------------*
 FUNCTION SAY_GET()

 LOCAL nValor1 := 0
 LOCAL nValor2 := 0
 LOCAL GetList := {}

 @ 06,05 SAY "Informe o valor da parcela 1 : " GET nValor1
 @ 08,05 SAY "Informe o valor da parcela 2 : " GET nValor2

 READ

 RETURN NIL

*----------------------------------------------------*
 FUNCTION SAY_GET_2()

 LOCAL cNome:= SPACE(20)
 LOCAL cTipo:= SPACE(1)
 LOCAL cCPF := SPACE(11)
 LOCAL cCNPJ:= SPACE(15)
 LOCAL GetList := {}

 @ 06,05 SAY "Informe o nome : " GET cNome

 @ 08,05 SAY "Informe o tipo (F ou J): " GET cTipo VALID UPPER(cTipo) $"FJ"

 @ 10,05 SAY "Informe o CPF          : " GET cCPF  WHEN UPPER(cTipo) == "F"
 @ 12,05 SAY "Informe o CNPJ         : " GET cCNPJ WHEN UPPER(cTipo) == "J"

 READ

 @ 14,05 SAY cNome
 IF UPPER(cTipo) == "F"
    @ 15,05 SAY "CPF : " + cCPF
  ELSE
    @ 15,05 SAY "CNPJ: " + cCNPJ
 ENDIF

RETURN NIL

*------------------------------------------------*
 FUNCTION PICT_1()

 LOCAL cNome  := SPACE(20), cNome2:= SPACE(20), cNome3:= SPACE(20)
 LOCAL nIdade :=0, nIdade2:=0, nIdade3:= 0
 LOCAL GetList:= {}

 @ 07,05 SAY "Informe o nome : " GET cNome PICT "!"
 @ 08,05 SAY "Idade : " GET nIdade

 @ 10,00 SAY Replicate("-",70)

 @ 12,05 SAY "Informe o nome : " GET cNome2 PICT "!!!!!"
 @ 13,05 SAY "Idade : " GET nIdade2

 @ 15,00 SAY Replicate("-",70)

 @ 17,05 SAY "Informe o nome : " GET cNome3 PICT "!@"
 @ 18,05 SAY "Idade : " GET nIdade3

 READ

 RETURN NIL
*------------------------------------------------*

 FUNCTION PICT_2()

 LOCAL cCEP  := SPACE(10)
 LOCAL nIdade:= 0
 LOCAL GetList := {}

 @ 06,05 SAY "Informe o CEP " GET cCEP PICTURE "99999-999"
 @ 08,05 SAY "Idade : " GET nIdade PICTURE "999"

 READ

 @ 09,05 SAY cCEP+ Str(nIdade)

 RETURN NIL
*-------------------------------------------------*

 FUNCTION DB_EDIT()

 LOCAL aCampos, aTitulos

 LIMPAR_TELA()

 @ 01, 00 SAY PadC(" CADASTRO DE PRODUTOS ",80)
 @ 01, 00 SAY Date()
 @ 02, 00 SAY Replicate("-",80)
 @ 23, 00 SAY Replicate("-",80)

 SELECT 0
 USE DBF\PRODUTOS

 SELECT PRODUTOS
 OrdSetFocus("NOME")
 DBGoTop()

 aTitulos:={"Codigo","Nome","Preco","Inativo"}
 aCampos :={"CODIGO", "NOME", "PRECO","INATIVO"}

 //DBEdit sem parâmetros
 *DBEdit()

 //Definição do tamanho do DbEdit
* DBEdit(03, 00, 22, 80, aCampos,,,aTitulos)  //(posLinhaInicial, posColunaInicial, alturaGrid, larguraGrid....)

 //DBEdit quase completo
 *DBEdit(03, 00, 22, 80, aCampos, , ,aTitulos,'#','*','$','@')

 RETURN NIL