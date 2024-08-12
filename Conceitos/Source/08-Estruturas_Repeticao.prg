/* Estruturas de repeti��o
Estrutura de repeti��o (ou loops) s�o estruturas que repetem uma mesma sequ�ncia
de c�digo um determinado n�mero de vezes.

O n�mero de vezes com que essa sequ�ncia � repetida pode ser fixa ou pode ser
vari�vel (baseada em uma condi��o de sa�da).

Para visualizar as fun��es de exemplo, descontamentar as linhas que as chamam.
Descomente uma fun��o por vez.
*/

* =====================================================================================*
*                                           DO WHILE                                   *
*
* DO WHILE ( <condi��o de perman�ncia> )
*     //O programa ficar� aqui enquanto
*       a condi��o inicial for satisfeita
*    <condi��o para iterar o la�o>
* ENDDO

* =====================================================================================*
*                                            FOR                                       *
*
* <nContador>      // contador usado para controlar o n�mero de itera��es do loop.

* <nValorInicial>  // valor num�rico usado para inicializar <nContador>
*                     quando a instru��o FOR � executada pela primeira vez.

* <nValorFinal>    // valor num�rico que controla o t�rmino do loop.

* <nIncremento>    // valor usado para incrementar o <nContador> a cada itera��o.
*                     Se n�o for especificado, o padr�o � 1.

* [EXIT]           // for�a uma sa�da antecipada do la�o

* [LOOP]           // �desloca� a sequ�ncia para o in�cio do loop.
*                     Ele ignora todos os comandos seguintes, mas n�o evita o incremento
*                     da vari�vel de controle de la�o.


* FOR nContador:= nValorInicial TO nValorFinal nIncremento
*    //bloco de instru��es que ser� executado um
*      n�mero espec�fico de vezes.
*    [EXIT]
*
*    //bloco de instru��es que ser� executado um
*      n�mero espec�fico de vezes.
*    [LOOP]
* NEXT


* ==============================================================================*
*                                    FOR EACH                                   *

* Usado para percorrer strings, arrays e hashs

* <elemento>               //elemento que ira receber uma posi��o do objeto que
*                            estiver percorrendo.
* <array>|<hash>|<string>  //estrutura que ser� percorrida


* FOR EACH <elemento> IN <array>|<hash>|<string>
*     //bloco de instru��es que ser� executado um
*       n�mero espec�fico de vezes.
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

 DO WHILE (nContador <= 5) // Condi��o de perman�ncia

    // O programa ficar� aqui enquanto nContador for menor ou igual a 5
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