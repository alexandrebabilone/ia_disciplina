sup(tadeu, paulo).
sup(paulo, ana).
sup(ana, abel).

nafrente(X,Z) :-
    sup(X,Y), sup(Y,Z).

ultimo(X) :-
    sup(_,X), not(sup(X, _)).

vencedor(X) :-
    sup(X,_), not(sup(_, X)).


ancestral(X,Z) :-
    sup(X,Z).

ancestral(X,Z) :-
    sup(X,Y), ancestral(Y,Z).


Lista[X|Y] = [luana_lessa, tadeu_torres, bruna_barros, miguel_moraes, paulo_pereira, davi_dantas, simone_saraiva, joana_jensen, helena_jensen, kaio_kiefer].



