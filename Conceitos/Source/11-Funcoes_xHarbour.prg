/*
 Lista com as funções que mais usamos do xHarbour. Verifique o manual para mais detalhes.
*/

#INCLUDE "WINUSER.CH" // Necessário para usar as flags na função MessageBox().

*--------------------------*
 FUNCTION FUNCOES_XHARBOUR()

 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Funcoes uteis do xHarbour",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Funcoes_xHarbour"
 *
 * =============================================================================
 *                                     AllTrim()
 *
 * Remove os espacos em branco ao redor de uma string. Exemplo:
 *
 * AllTrim("     Sommus Sistemas     ") // resultado: "Sommus Sistemas"
 *
 * =============================================================================
 *                                       At()
 *
 * Procura uma letra ou palavra em uma string, e retorna sua posicao. Exemplo:
 *
 * At("i","Sommus Sistemas")        // resultado: 9
 * At("Sistemas","Sommus Sistemas") // resultado: 8
 *
 * =============================================================================
 *                                   Replicate()
 * Replica um caractere n vezes. Exemplo:
 *
 * Replicate("-",5) // resultado: "-----"
 *
 * =============================================================================
 *                             PadC() | PadL() | PadR()
 *
 * Retorna a string preenchida com o caractere informado. Essas funções são muito utilizadas para alinhamento. Exemplo:
 *
 * PadC("Sommus Sistemas",50,"_") // resultado: "_________________Sommus Sistemas__________________"
 * PadL("Sommus Sistemas",20,"_") // resultado: "_____Sommus Sistemas"
 * PadR("Sommus Sistemas",30,"_") // resultado: "Sommus Sistemas_______________"
 *
 * PadC adiciona o caractere a esquerda e a direita, de forma que a string fique no centro.
 * PadL adiciona o caractere a esquerda, de forma que a string fique a direita.
 * PadR adiciona o caractere a direita, de forma que a string fique a esquerda.
 *
 * Obs: Se o caractere nao for informado, por DEFAULT será o espaco em branco. Exemplo:
 * PadC("Sommus Sistemas",50) // resultado: "                 Sommus Sistemas                  "
 *
 *
 * =============================================================================
 *                                     Space()
 *
 * Retorna espaços em branco n vezes. Muito usada quando se quer exibi-los sem poluir o código. Exemplo:
 *
 * Space(1)  // resultado: " "
 * Space(20) // resultado: "                    "
 *
 * =============================================================================
 *                                   StrTran()
 *
 * Substitui um caractere ou string, por outro(a). Exemplo:
 *
 * StrTran("Sommus Sistemas","s","S")           // resultado: "SommuS SiStemaS"
 * StrTran("Sommus Sistemas","Sommus", "Teste") // resultado: "Teste Sistemas"
 * StrTran("Sommus Sistemas","Sistemas")        // resultado: "Sommus "
 *
 * =============================================================================
 *                                  SubStr()
 *
 * Corta uma string. Exemplo:
 *
 * SubStr("Sommus Sistemas",1,6) // resultado: "Sommus"
 * SubStr("Sommus Sistemas",2,6) // resultado: "ommus "
 * SubStr("Sommus Sistemas",1,1) // resultado: "S"
 *
 * Obs: O segundo parâmetro é a posição onde o corte será iniciado. O terceiro parâmetro são quantos caracteres serão cortados.
 *
 * =============================================================================
 *                                   Len()
 *
 * Retorna o tamanho de uma string, array ou hash. Exemplo:
 *
 * Len("Teste")                              // resultado: 5
 * Len({1,2,3})                              // resultado: 3
 * Len({ "Nome" => "Fulano", "Idade" => 10}) // resultado: 2
 *
 * =============================================================================
 *                                  Empty()
 *
 * Retorna se o valor passado está vazio. Exemplo:
 *
 * Empty(NIL)      // resultado: .T.
 * Empty(0)        // resultado: .T.
 * Empty(.F.)      // resultado: .T.
 * Empty(CtoD("")) // resultado: .T.
 * Empty("")       // resultado: .T.
 * Empty("     ")  // resultado: .T.
 * Empty({})       // resultado: .T.
 * Empty({=>})     // resultado: .T.
 *
 * Empty(1)                      // resultado: .F.
 * Empty(.T.)                    // resultado: .F.
 * Empty(CtoD("08/07/2024"))     // resultado: .F.
 * Empty("A")                    // resultado: .F.
 * Empty({1,2,3})                // resultado: .F.
 * Empty({ "A" => 1, "B" => 2 }) // resultado: .F.
 *
 * =============================================================================
 *                                  Round()
 *
 * Arredonda decimais. Exemplo:
 *
 * Round(1234.5678,0) // resultado: 1235
 * Round(1234.5678,1) // resultado: 1234.6
 * Round(1234.5678,2) // resultado: 1234.57
 * Round(1234.5678,3) // resultado: 1234.568
 *
 * =============================================================================
 *                                  Date()
 *
 * Retorna a data atual. Exemplo:
 *
 * Date() // resultado: 08/07/2024
 *
 * =============================================================================
 *                                DateTime()
 *
 * Retorna a data e hora atual. Exemplo:
 *
 * DateTime() // resultado: {ˆ 08/07/2024 10:59:59.00}
 *
 * =============================================================================
 *                                  Time()
 *
 * Retorna a hora atual. Exemplo:
 *
 * Time() // resultado: "10:59:59"
 *
 * =============================================================================
 *                              CToD() e SToD()
 *
 * Converte texto em data. Exemplo:
 *
 * CToD("01/02/2024") // resultado: 01/02/2024
 * StoD("20240201")   // resultado: 01/02/2024
 *
 * =============================================================================
 *                             DToC() e DToS()
 *
 * Converte data em texto. Exemplo:
 *
 * DToC(Date()) // resultado: "08/07/2024"
 * DToS(Date()) // resultado: "20240708"
 *
 * =============================================================================
 *                                 LToC()
 *
 * Converte lógico em texto. Exemplo:
 *
 * LToC(.T.) // resultado: "T"
 *
 * =============================================================================
 *                                 Val()
 *
 * Converte texto em número. Exemplo:
 *
 * Val("1") // resultado: 1
 *
 * =============================================================================
 *                                 Str()
 *
 * Converte número em texto. Exemplo:
 *
 * Str(1) // resultado: "         1"
 *
 * =============================================================================
 *                               StrZero()
 *
 * Converte número em texto, com zeros a esquerda.
 *
 * StrZero(1,5)  // resultado: "00001"
 * StrZero(10,3) // resultado: "010"
 *
 * =============================================================================
 *                               ValToPrg()
 *
 * A função ValToPrg() aceita um valor de qualquer tipo e retorna uma string contendo o código PRG.
 * Geralmente usamos em debug, quando queremos exibir o conteúdo de uma variável em uma mensagem.
 /*
   MessageBox(,ValToPrg("xHarbour"))             // resultado: "xHarbour"
   *
   MessageBox(,ValToPrg(1.2345))                 // resultado: "         1.2345"
   *
   MessageBox(,ValToPrg(Date()))                 // resultado: "SToD('20240708')"
   *
   MessageBox(,ValToPrg(.T.))                    // resultado: ".T."
   *
   MessageBox(,ValToPrg({1,2,3}))                // resultado: "M->__ValToPrg_Array := Array(3)
                                                 //                M->__ValToPrg_Array[1] :=          1
                                                 //                M->__ValToPrg_Array[2] :=          2
                                                 //                M->__ValToPrg_Array[3] :=          3"
   *
   MessageBox(,ValToPrg({{1,2},{3,4}}))          // resultado: "M->__ValToPrg_Array := Array(2)
                                                 //                M->__ValToPrg_Array[1] := Array(2)
                                                 //                   M->__ValToPrg_Array[1][1] :=          1
                                                 //                   M->__ValToPrg_Array[1][2] :=          2
                                                 //                M->__ValToPrg_Array[2] := Array(2)
                                                 //                   M->__ValToPrg_Array[2][1] :=          3
                                                 //                   M->__ValToPrg_Array[2][2] :=          4"
   *
   MessageBox(,ValToPrg({ "A" => 1, "B" => 2 })) // resultado: { "A" =>  1, "B" =>  2 }
   *
   MessageBox(,ValToPrg(NIL))                    // resultado: NIL
 */
 * =============================================================================
 *                              MessageBox()
 *
 * Essa é uma funçao do windows, usada para exibir uma mensagem, que vai no segundo parâmetro:
 *
 * MessageBox(,"Olá")
 *
 * Para deixar a mensagem mais bonitinha, você pode informar um título no terceiro parâmetro, e flags no quarto:
 *
 * MessageBox(,"Olá","Título da mensagem",MB_YESNO+MB_ICONINFORMATION)
 *
 * No exemplo acima, há uma combinação de duas flags:
 *
 * MB_YESNO           = Exibe os botões "Sim" e "Não"
 * MB_ICONINFORMATION = Exibe um ícone à esquerda do texto da mensagem
 *
 * Para usar as constantes acima, é necessário fazer o #include "WINUSER.CH" no início do prg.
 * Veja mais flags na documentação da Microsoft: https://learn.microsoft.com/pt-br/windows/win32/api/winuser/nf-winuser-messagebox
 *
 * Obs: para exibir dados que não são string, é necessário convertê-los. Caso contrário, a mensagem ficará em branco. Use ValToPrg() para isso.
 *
 * =============================================================================
 *                               Lastkey()
 *
 * Retorna o código da última tecla pressionada. Exemplo:
 *
 * LastKey() // resultado: se o usuário apertar ESC, a função retorna 27.
 *
 * Obs: Tabela ASCII com os possíveis códigos: https://pt.wikipedia.org/wiki/ASCII
 *
 * =============================================================================
 *                                File()
 *
 * Verifica se o arquivo existe. Exemplo:
 *
 * File("teste.txt")    // resultado: Procura o arquivo na pasta raiz. Retorna .T. se existir, .F. se não
 * File("C:\teste.txt") // resultado: Procura o arquivo no diretório informado. Retorna .T. se existir, .F. se não
 *
 * =============================================================================
 *                              MemoRead()
 *
 * Retorna o conteúdo de um arquivo. Exemplo:
 *
 * MemoRead("teste.txt")           // resultado: "Todo o texto que estiver dentro do arquivo"
 * MemoRead("C:\Sommus\teste.txt") // resultado: "Todo o texto que estiver dentro do arquivo"
 *
 * Se você só precisa do conteúdo, utilize essa função.
 * Ela faz a leitura do arquivo, sem a necessidade de abrir e fechá-lo.
 * É mais prático usar MemoRead() do que FRead().
 *
 * =============================================================================
 *                               FCreate()
 *
 * Cria um arquivo. Exemplo:
 *
 * FCreate("teste.txt")           // resultado: Cria o arquivo na pasta raiz. Retorna o ID do arquivo (ex: 1).
 * FCreate("C:\Sommus\teste.txt") // resultado: Cria o arquivo no diretório informado. Retorna o ID do arquivo (ex: 2).
 *
 * É uma boa prática verificar se o arquivo não existe, antes de criá-lo. Use a função File() para isso.
 * Além disso, é comum salvar o retorno de FCreate() em uma variável, para poder manipular o arquivo depois (ex: FWrite(), FClose()):
 /*
   IF !File("teste.txt")
      nArquivo:=FCreate("teste.txt")
   ENDIF
 */
 *
 * =============================================================================
 *                                FOpen()
 *
 * Abre um arquivo existente. Exemplo:
 *
 * FOpen("teste.txt")           // resultado: Abre o arquivo na pasta raiz. Retorna o ID do arquivo (ex: 1).
 * FOpen("C:\Sommus\teste.txt") // resultado: Abre o arquivo no diretório informado. Retorna o ID do arquivo (ex: 2).
 *
 * Assim como em FCreate(), é comum salvar o ID do arquivo em uma variável, para manipular o arquivo em seguida.
 * Lembre-se de verificar se o arquivo existe antes de abri-lo. Caso contrário, o retorno de FOpen() será -1 (significa que a abertura deu erro).
 /*
   IF File("teste.txt")
      nArquivo:=FOpen("teste.txt")
   ENDIF
 */
 *
 * Por padrão, o arquivo será aberto em modo leitura. Se necessário escrever no arquivo, informe o segundo parâmetro (nMode), para abrir em modo escrita:
 *
 * nArquivo:=FOpen("teste.txt",1)
 *
 * A seguir, os possíveis valores para o parâmetro nMode (retirados do manual do xHarbour):
 *
 * 0  FO_READ       Modo leitura
 * 1  FO_WRITE      Modo escrita
 * 2  FO_READWRITE  Modo leitura e escrita
 *
 * Para usar as constantes (FO_READ, FO_WRITE ou FO_READWRITE) ao invés dos valores (0, 1 ou 2), faça o #include FILEIO.CH no início do prg.
 *
 * =============================================================================
 *                               FClose()
 *
 * Fecha o arquivo criado ou aberto anteriormente. Exemplo:
 /*
   nArquivo_Temporario:=FCreate("teste.tmp")
   nArquivo_Teste     :=FOpen("teste.txt")
   *
   FClose(nArquivo_Temporario)
   FClose(nArquivo_Teste)
 */
 * Sempre feche um arquivo depois que terminar de usá-lo.
 *
 * =============================================================================
 *                                 FWrite()
 *
 * Escreve no arquivo criado ou aberto anteriormente. Exemplo:
 /*
   nArquivo:=FCreate("teste_fwrite.txt")
   *
   FWrite(nArquivo,"Início")
   FWrite(nArquivo,"Fim")
   *
   FClose(nArquivo)
 */
 * No exemplo acima, FWrite() escreve no arquivo, a partir da posição atual.
 * Ao criar o arquivo, a posição atual será o início dele.
 * Depois de executar um FWrite(), a posição atual muda para o final da string que foi escrita.
 *
 * Por isso, o arquivo ficará assim:
 *
 * InícioFim
 *
 * Para pular a linha, coloque a quebra de linha no final da string:
 /*
   nArquivo:=FCreate("teste_fwrite.txt")
   *
   FWrite(nArquivo,"Início"+Chr(13)+Chr(10))
   FWrite(nArquivo,"Fim"+Chr(13)+Chr(10))
   *
   FClose(nArquivo)
 */
 * O arquivo ficará assim:
 *
 * Início
 * Fim
 *
 * Para escrever em um arquivo que já existe, abra-o em modo de escrita:
 *
 * nArquivo:=FOpen("teste_fwrite.txt", 1)
 *
 * Ao abrir o arquivo, a posição atual será o início dele.
 * Antes do FWrite(), altere a posição para o final do arquivo, com a função FSeek().
 * Isso vai evitar que o conteúdo já existente seja sobrescrito. Exemplo:
 /*
   nArquivo:=FOpen("teste_fwrite.txt", 1)
   *
   FSeek(nArquivo,0,2)
   *
   FWrite(nArquivo,"Mensagem"+Chr(13)+Chr(10))
   *
   FClose(nArquivo)
 */
 * =============================================================================
 *                Dica - File() + FCreate() + FOpen()
 *
 * Você pode usar File() para decidir se vai criar o arquivo, ou abri-lo. Exemplo:
 /*
   IF !File("teste.txt")
      nArquivo:=FCreate("teste.txt")
    ELSE
      nArquivo:=FOpen("teste.txt")
      FSeek(nArquivo,0,2)
   ENDIF
   *
   FWrite(nArquivo,"Mensagem"+Chr(13)+Chr(10))
   *
   FClose(nArquivo)
 */
 * =============================================================================
 *                                FError()
 *
 * As funções vistas acima: FCreate(), FOpen(), FClose() e FWrite(), não dão erro.
 * Para saber se a ação foi executada com sucesso ou não, utilize a função FError().
 *
 * Essa função retorna 0 em caso de sucesso, e um código de erro caso contrário.
 * Para ver a lista de possíveis códigos, consulte a função no manual do xHarbour.
 *
 * Exemplo:
 /*
   nArquivo:=FOpen("teste.txt")
   *
   IF FError()>0
      MessageBox(,"Erro ao abrir o arquivo. Código: "+Str(FError()))
   ENDIF
   *
   FWrite(nArquivo,"Mensagem")
   *
   IF FError()>0
      MessageBox(,"Erro ao escrever no arquivo. Código: "+Str(FError()))
   ENDIF
   *
   FClose(nArquivo)
   *
   IF FError()>0
      MessageBox(,"Erro ao fechar o arquivo. Código: "+Str(FError()))
   ENDIF
 */
 * No exemplo acima, ocorrerá um erro de código 5 (acesso negado) no FWrite(), porque o arquivo foi aberto em modo leitura.
 *
 * =============================================================================
 *                                  Chr()
 *
 * Converte um número ASCII em caractere:
 *
 * Chr(65)  // resultado: "A"
 * Chr(322) // resultado: "B"
 *
 * Geralmente usamos quando queremos a quebra de linha CR + LF, que seria: Chr(13)+Chr(10)
 *
 * Obs: Tabela ASCII com os possíveis códigos: https://pt.wikipedia.org/wiki/ASCII
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