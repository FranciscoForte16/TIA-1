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

pergunta4(User):- nl, write(' Quantos adultos sao? '),nl, nl,
write('"a." - 0'),nl,
write('"b." - 1'),nl,
write('"c." - 2'),nl,
write('"d." - mais de 2'),nl,nl,
write('A sua opcao: '),read(Adulto),(
(Adulto == a), assert(fact(nenhum_adulto)),pergunta5(User);
(Adulto == b), assert(fact(um_adulto)),pergunta5(User);
(Adulto == c), assert(fact(dois_adultos)),pergunta5(User);
(Adulto == d), assert(fact(mais_de_dois_adultos)),pergunta5(User)).

pergunta5(User):-nl, write(' Quantas criancas sao? '),nl, nl,
write('"a." - 0'),nl,
write('"b." - 1'),nl,
write('"c." - 2'),nl,
write('"d." - mais de 2'),nl,nl,
write('A sua opcao: '),read(Crianca),(
(Crianca == a), assert(fact(nenhuma_crianca)),pergunta6(User);
(Crianca == b), assert(fact(uma_crianca)),pergunta6(User);
(Crianca == c), assert(fact(duas_criancas)),pergunta6(User);
(Crianca == d), assert(fact(mais_de_duas_criancas)),pergunta6(User)).

pergunta6(User):-nl, write(' Tem animais de estimacao? '),nl, nl,
write('"a." - Sim'),nl,
write('"b." - Nao'),nl, nl,
write('A sua opcao: '),read(Animais),(
(Animais == a), assert(fact(tem_animal)),pergunta8(User);
(Animais == b), assert(fact(nao_tem_animal)),pergunta8(User)).

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


pergunta8(User):-nl, write(' Quantas camas necessita? '),nl, nl,
write('"a." - 0'),nl,
write('"b." - 1'),nl, nl,
write('"c." - 2'), nl, nl,
write('"d." - 3'), nl, nl,
write('"e." - Mais de 3'), nl, nl,
write('A sua opcao: '),read(Camas),(
(Camas == a), assert(fact(nenhuma_cama)),final(User);
(Camas == b), assert(fact(uma_cama)),final(User);
(Camas == c), assert(fact(duas_camas)),final(User);
(Camas == d), assert(fact(tres_camas)),final(User);
(Camas == e), assert(fact(mais_de_3_camas)),final(User)).

final(User):- nl, demo, nl, write('Obrigado pelas suas escolhas, '), write(User).

result(P):- nl, findall(Y,(fact(P),solucao(Y,_,_,_,_,_,_,_,LP), member(P,LP)),L), write('Resultado:'), write(L).
