/* Estruturas de repetição
Estrutura de repetição (ou loops) são estruturas que repetem uma mesma sequência
de código um determinado número de vezes.

O número de vezes com que essa sequência é repetida pode ser fixa ou pode ser
variável (baseada em uma condição de saída).

Para visualizar as funções de exemplo, descontamentar as linhas que as chamam.
Descomente uma função por vez.
*/

* =====================================================================================*
*                                           DO WHILE                                   *
*
* DO WHILE ( <condição de permanência> )
*     //O programa ficará aqui enquanto
*       a condição inicial for satisfeita
*    <condição para iterar o laço>
* ENDDO

* =====================================================================================*
*                                            FOR                                       *
*
* <nContador>      // contador usado para controlar o número de iterações do loop.

* <nValorInicial>  // valor numérico usado para inicializar <nContador>
*                     quando a instrução FOR é executada pela primeira vez.

* <nValorFinal>    // valor numérico que controla o término do loop.

* <nIncremento>    // valor usado para incrementar o <nContador> a cada iteração.
*                     Se não for especificado, o padrão é 1.

* [EXIT]           // força uma saída antecipada do laço

* [LOOP]           // “desloca” a sequência para o início do loop.
*                     Ele ignora todos os comandos seguintes, mas não evita o incremento
*                     da variável de controle de laço.


* FOR nContador:= nValorInicial TO nValorFinal nIncremento
*    //bloco de instruções que será executado um
*      número específico de vezes.
*    [EXIT]
*
*    //bloco de instruções que será executado um
*      número específico de vezes.
*    [LOOP]
* NEXT


* ==============================================================================*
*                                    FOR EACH                                   *

* Usado para percorrer strings, arrays e hashs

* <elemento>               //elemento que ira receber uma posição do objeto que
*                            estiver percorrendo.
* <array>|<hash>|<string>  //estrutura que será percorrida


* FOR EACH <elemento> IN <array>|<hash>|<string>
*     //bloco de instruções que será executado um
*       número específico de vezes.
* NEXT


 FUNCTION ESTRUTURAS_REPETICAO()

 LIMPAR_TELA()

 @ 01,00 SAY Replicate("-",119)
 @ 02,00 SAY PadC("Estruturas de repeticao",119)
 @ 03,00 SAY Replicate("-",119)
 *
 * @ 05,01 SAY 'DO WHILE'
 * @ 06,01 SAY DO_WHILE()
 *
 * @ 05,01 SAY 'FOR'
 * @ 06,01 SAY FOR()
 *
 * @ 05,01 SAY 'FOR EACH'
 * @ 06,01 SAY FOR_EACH()


 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF
 *

 RETURN NIL

*----------------------------------------------*
 FUNCTION DO_WHILE()

 LOCAL nContador, aProdutos:={"PRODUTO A","PRODUTO B","PRODUTO C","PRODUTO D","PRODUTO E"}

 nContador:= 1
 ? "Inicio do loop - valor inicial do contador: "+Alltrim(Str(nContador))
 ? ''
 ? "Permanecer no loop ate que o contador seja menor ou igual a 5"
 ?''

 DO WHILE (nContador <= 5) // Condição de permanência

    // O programa ficará aqui enquanto nContador for menor ou igual a 5
    ? "Produto com contador valendo: "+Alltrim(Str(nContador))+" = "+valtoprg(aProdutos[nContador])

    //incrementa valores
    nContador++

 ENDDO

 ? "Fim do loop - valor final do contador: "+Alltrim(Str(nContador))

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF

 RETURN NIL

*----------------------------------------------*
 FUNCTION FOR()

 LOCAL nContador

 FOR nContador:= 1 TO 10
     ? Str(nContador)
 NEXT

 ? " "
 ? "Apos o FOR o valor do nContador e: " ,AllTrim(Str(nContador))

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF

 RETURN NIL

*----------------------------------------------*
 FUNCTION FOR_EACH()

 LOCAL aProdutos:={"PRODUTO A","PRODUTO B","PRODUTO C","PRODUTO D","PRODUTO E"}
 LOCAL cProduto, cCaracter

 FOR EACH cProduto IN aProdutos
     ? cProduto
 NEXT

 PAUSAR_TELA()
 *
 IF LastKey()==27
    MAIN()
 ENDIF

 RETURN NIL