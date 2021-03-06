/* Labirinto */

labirinto :- caminho(entrada,Solucao),
             reverse(Solucao,Sol_invertida), 
             write(Sol_invertida),
             write('\n').

caminho(Nodo_inicial, Solucao):-
             busca([[Nodo_inicial]], Solucao).

busca([[Nodo|Caminho]|_],[Nodo|Caminho]):-
          objetivo(Nodo).

busca([Nodo|Caminho],Solucao):-
          expandir(Nodo, Novos_caminhos),
          append(Caminho,Novos_caminhos, Novo_caminho),
          busca(Novo_caminho, Solucao).

expandir([Nodo|Caminho],Novos_caminhos) :-
             findall([Novo_nodo, Nodo|Caminho],
                     (conexao(Nodo, Novo_nodo),
                      not(member(Novo_nodo,[Nodo|Caminho]))),
                      Novos_caminhos), !.
expandir(_,[]).

conexao(A,B) :- liga(A,B).
conexao(A,B) :- liga(B,A).

/******************************
 * Conectividade do labirinto *
 ********************************/
liga(entrada,7).        
liga(1,7).              
liga(1,2).              
liga(2,3).              
liga(3,9).              
liga(9,15).             
liga(7,8).              
liga(8,9).              
liga(8,14).             
liga(14,20).            
liga(20,19).            
liga(20,21).            
liga(15,21).            
liga(21,22).            
liga(22,16).            
liga(16,10).            
liga(10,11).            
liga(11,12).            
liga(12,6).             
liga(6,5).              
liga(5,4).              
liga(18,12).            
liga(18,17).            
liga(17,23).            
liga(23,saida).         
liga(18, saida).        

objetivo(saida).


