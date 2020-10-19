pway(a, b, 10).
pway(b, c, 15).
pway(d, c, 5).
pway(d, b, 10).



solve(Inicio, Inicio, [Inicio], 0) :- !.

solve(Inicio, Fim, [Inicio, Fim], C) :-
    (pway(Inicio, Fim, Custo),!;pway(Fim, Inicio, Custo)),
    C is Custo.

solve(Inicio, Fim, [Inicio|Caminho], C) :-
    pway(Inicio, X, Custo),
    solve(X, Fim, Caminho, CustoAux),
    C is Custo + CustoAux.
