% Fatos
% 1
superou(luana_lessa, tadeu_torres).
superou(bruna_barros, tadeu_torres).
superou(tadeu_torres, miguel_moraes).
% 2
superou(paulo_pereira, davi_dantas).
superou(paulo_pereira, luana_lessa).
% 3
superou(paulo_pereira, simone_saraiva).
superou(simone_saraiva, joana_jensen).
superou(simone_saraiva, helena_jensen).
% 4
superou(paulo_pereira, kaio_kiefer).
superou(miguel_moraes, kaio_kiefer).
superou(tadeu_torres, kaio_kiefer).
% 5
superou(bruna_barros, luana_lessa).
superou(davi_dantas, luana_lessa).
superou(luana_lessa, joana_jensen).
superou(luana_lessa, miguel_moraes).
% 6
superou(simone_saraiva, miguel_moraes).
superou(bruna_barros, miguel_moraes).
% 7
superou(bruna_barros, joana_jensen).
%superou(bruna_barros, miguel_moraes).
superou(bruna_barros, paulo_pereira).
% 8
superou(davi_dantas, kaio_kiefer).
superou(davi_dantas, tadeu_torres).
superou(simone_saraiva, davi_dantas).
% 9
superou(joana_jensen, kaio_kiefer).
superou(joana_jensen, tadeu_torres).
superou(joana_jensen, miguel_moraes).
superou(paulo_pereira, joana_jensen).
superou(davi_dantas, joana_jensen).
% 10
superou(helena_jensen, miguel_moraes).
superou(luana_lessa, helena_jensen).
superou(joana_jensen, helena_jensen).
superou(tadeu_torres, helena_jensen).



% Regras
esta_na_frente(X,Z) :-
    superou(X,Z).

esta_na_frente(X,Z) :-
    superou(X,Y), esta_na_frente(Y,Z).

ultimo(X) :-
    superou(_,X), not(superou(X, _)),!.

primeiro(X) :-
    superou(X,_), not(superou(_, X)),!.

numero_participantes(Quantidade) :-
    ultimo(Ultimo),
    setof(X, esta_na_frente(X, Ultimo), Lista),
    length(Lista,Q), Quantidade is Q+1.

aux_classifica(Pessoa, Posicao) :-
    numero_participantes(Quantidade),
    setof(X, esta_na_frente(Pessoa,X),Lista),
    length(Lista,Tamanho), Posicao is Quantidade - Tamanho.

classificacao(Pessoa, Posicao) :-
    aux_classifica(Pessoa, Posicao);
    ultimo(Pessoa), numero_participantes(Posicao).








