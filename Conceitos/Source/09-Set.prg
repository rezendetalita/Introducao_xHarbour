/*
 O comando SET modifica uma configuração da aplicação toda.
 Por isso, costumam ser colocando no ínicio do programa. Exemplo: no início da MAIN().
*/

*---------------------*
 FUNCTION COMANDO_SET()

 LIMPAR_TELA()
 *
 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("SET",119)
 @ 03,00 SAY Replicate("-",119)
 *
 @ 04,01 SAY "Verifique o prg Set"
 *
 * Sintaxe:
 *
 * Há uma infinidade de configurações. Abaixo estão as que mais usamos
 * Você pode conferir as demais no manual do xHarbour.
 *
 * =============================================================================
 *                          SET DELETE ON | OFF
 *
 * Determina se a aplicação conseguirá ver os registros marcados como deletados no DBF.
 *
 * SET DELETE ON  // resultado: os registros marcados ficam visíveis
 * SET DELETE OFF // resultado: os registros marcados não ficam visíveis
 *
 * =============================================================================
 *                          SET EXACT ON | OFF
 *
 * Determina o modo de comparação de strings. Exemplo:
 *
 * SET EXACT OFF
 * "AB"   = "ABCD" // resultado: .F.
 * "ABCD" = "AB"   // resultado: .T.
 * "AB"   = ""     // resultado: .T.
 * ""     = "AB"   // resultado: .F.
 * "AB"   = "AB  " // resultado: .F.

 * SET EXACT ON
 * "AB"   = "ABCD" // resultado: .F.
 * "ABCD" = "AB"   // resultado: .F.
 * "AB"   = ""     // resultado: .F.
 * ""     = "AB"   // resultado: .F.
 * "AB"   = "AB  " // resultado: .T.
 *
 * Os exemplos acima usaram o sinal de = para comparação, mostrando que o SET EXACT tem impacto nesse sinal.
 *
 * O sinal de == não é afetado pelo SET EXACT. Ele sempre compara a string exatamente como ela é.
 * Por isso, é mais indicado utilizar o sinal de ==, para evitar confusão.
 *
 * Geralmente, usa-se SET EXACT OFF no Autosys, antes de um DBSeek().
 * Apesar de o manual do xHarbour dizer que SET EXACT não possui efeito sob essa função.
 *
 * =============================================================================
 *                        SET EXCLUSIVE ON | OFF
 *
 * Determina se as tabelas DBF serão abertas exclusivamente (ON) ou não (OFF).
 * Esse tipo de abertura bloqueia o acesso à tabela por outras aplicações, e não é indicado.
 *
 * No entanto, às vezes pode ser necessário. Nesse caso, opte por bloquear apenas a tabela que vai ser usada: USE TABELA EXCLUSIVE
 * Veja mais detalhes no prg Banco_Dados_Dbf.
 *
 * =============================================================================
 *                          SET DATE BRITISH
 *
 * Determina o formato da data. Usamos o formato britânico. Exemplo:
 *
 * SET DATE AMERICAN
 * Date() // resultado: 12/31/2024
 *
 * SET DATE BRITISH
 * Date() // resultado: 31/12/2024
 *
 * =============================================================================
 *                           SET CENTURY ON | OFF
 *
 * Determina se o ano será exibido em 2 ou 4 dígitos. Exemplo:
 *
 * SET CENTURY ON
 * Date() // resultado: 31/12/24
 *
 * SET CENTURY OFF
 * Date() // resultado: 31/12/2024
 *
 * =============================================================================
 *                           SET EPOCH TO ano
 *
 * Determina a interpretação do ano, caso o ano tenha apenas dois dígitos.
 *
 * SET EPOCH TO 1900
 * CtoD("05/27/1903") // resultado: 05/27/1903
 * CtoD("05/27/55")   // resultado: 05/27/1955
 *
 * SET EPOCH TO 1950
 * CtoD("05/27/1910") // resultado: 05/27/1910
 * CtoD("05/27/69")   // resultado: 05/27/1969
 * CtoD("05/27/06")   // resultado: 05/27/2006
 *
 *
 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *
 RETURN NIL