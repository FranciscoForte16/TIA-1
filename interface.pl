:-dynamic(fact/1).
:-[backward, forward, bd, baseconhecimento].

%____________________Inicio_____________________
%
iniciar:-retractall(fact(_)),write('Bem vindo ao seu Alojamento de Sonho!'),nl,nl,pergunta1().

%_____________________Perguntas__________________
%
pergunta1():-write('Qual e o seu nome?'), nl,nl, read(User), inf(User).

inf(User):-nl, write(User), write(', de modo a ser mais facil encontrarmos o melhor alojamento para ti, escolhe a opcao mais conveniente a cada pergunta. '), nl, pergunta2(User).

pergunta2(User):-nl, write( 'Qual e o preco que procura?' ),nl, nl,
write('"a." - 0-100 euros por noite'), nl,
write('"b." - 100-300 euros por noite'), nl,
write('"c." - 300-500 euros por noite'), nl,
write('"d." - Mais de 500 euros por noite'), nl,
write('A sua opcao: '),read(Preco),(
(Preco == a), assert(fact(zero_cem_euros)), pergunta4(User);
(Preco == b), assert(fact(cem_trezentos_euros)), pergunta4(User);
(Preco == c), assert(fact(trezentos_quinhentos_euros)), pergunta4(User);
(Preco == d), assert(fact(mais_quinhentos_euros)), pergunta4(User)).

pergunta4(User):- nl, write(' Quantas pessoas sao? '),nl, nl,
write('"a." - 0'),nl,
write('"b." - 1'),nl,
write('"c." - 2'),nl,
write('"d." - mais de 2'),nl,nl,
write('A sua opcao: '),read(Adulto),(
(Adulto == a), assert(fact(nenhum_adulto)),pergunta5(User);
(Adulto == b), assert(fact(um_adulto)),pergunta5(User);
(Adulto == c), assert(fact(dois_adultos)),pergunta5(User);
(Adulto == d), assert(fact(mais_de_dois_adultos)),pergunta5(User)).

pergunta7(User):-nl, write(' Quantos quartos necessita? '),nl, nl,
write('"a." - 1'),nl,
write('"b." - 2'),nl, nl,
write('"c." - 3'),nl, nl,
write('"d." - 4'),nl, nl,
write('A sua opcao: '),read(Quartos),(
(Quartos == a), assert(fact(um_quarto)),pergunta9(User);
(Quartos == b), assert(fact(dois_quartos)),pergunta9(User);
(Quartos == c), assert(fact(tres_quartos)),pergunta9(User);
(Quartos == b), assert(fact(quatro_quartos)),pergunta9(User)).

final(User):- nl, demo, nl, write('Obrigado pelas suas escolhas, '), write(User).

result(P):- nl, findall(Y,(fact(P),solucao(Y,_,_,_,_,_,_,_,LP), member(P,LP)),L), write('Resultado:'), write(L).
