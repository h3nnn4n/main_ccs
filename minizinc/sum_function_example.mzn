/* EXERCICIO 3.1
Dado um vetor bi-dimensional, crie uma funcao que calcule e retorne a soma de todos
elementos desta matriz. Ao fazer esta funcao, faca uma que imprima os valores da
matriz. Teste-a na secao do output do Minizinc;

FEITO A PARTIR DO TRABALHO DO MOHAMED

*/

%include "globals.mzn";

int: Lin = 4;
int: Col = 10;

array[1 .. Lin, 1 .. Col] of int: G;

G = [|1,2,3,4,5,6,7,8,9,10,
     |1,2,3,4,5,6,7,8,9,10,
     |1,2,3,4,5,6,7,8,9,10,
     |1,2,3,4,5,6,7,8,9,10
     |];

var int : final_result;

function var int: matrix_sum(array[1.. Lin , 1 .. Col] of  int: matrix) = 
    let{
      var int : temp;
      array[1..Lin] of var int: partial_line;
      constraint
      forall( i in 1..Lin )
       (partial_line[i] =  sum(j in 1 .. Col) (matrix[i,j])
       )
       %/\
       %show(partial_line)  %%% QUERIA IMPRIMIR DENTRO DA FUNCAO  
       /\
      temp = sum(partial_line);
    } in temp   %%% AQUI O RETORNO DA FUNCAO 
;

constraint
   final_result = matrix_sum(G);

solve satisfy;

output [
    "\n Final Result of this SUM: "++show( final_result)++"\n"
];

