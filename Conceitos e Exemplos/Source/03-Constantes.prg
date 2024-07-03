/*CONSTANTES:
  São valores que não se alteram durante a execução do programa.
  Devem ser declaradas fora do MAIN() ou no inicio do bloco de execução.
  Por boa prática costumam ser declaradas em letras MAIÚCULAS.

  Sintaxe:
   #define NOME_CONSTANTE "Valor da constante"
*/

 #define VERDE    "G"
 #define BRANCO   "W"
 #define VERMELHO "R"
 #define BALNK    "X"

 #define PRODUTO "ARROZ"
 #define PRECO1  17.90
 #define PRECO2  19.00

 FUNCTION CONSTANTES()

 ? "--------------------------------------------"
 ? "                   Constantes               "
 ? "--------------------------------------------"
 // Alterar a cor do texto
 SET COLOR TO VERDE
 ? "Texto definido como verde"
 SET COLOR TO VERMELHO
 ? "Texto definido como vermelho"
 SET COLOR TO BRANCO
 ? "Texto definido como branco"
 ? "--------------------------------------------"
 ? "PRODUTO: " + PRODUTO
 ? "A VISTA: " + AllTrim(Str(PRECO1))
 ? "A VISTA: " + Str(PRECO1)
 ? "A PRAZO: " + AllTrim(Str(PRECO2))
 ? "------------------------------------------"

 RETURN NIL