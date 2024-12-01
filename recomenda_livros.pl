% Base de conhecimento de livros
% Cada livro está associado a um gênero e interesses específicos.

% Livros e suas categorias
recomendar('1984', 'Um clássico de George Orwell que explora temas de política, controle e liberdade.') :-
    genero(ficcao), interesse(politica).

recomendar('Sapiens', 'Uma visão fascinante da história da humanidade por Yuval Noah Harari.') :-
    genero(historia), interesse(ciencia).

recomendar('A Mente Organizada', 'Um guia para organizar sua mente e melhorar sua produtividade.') :-
    genero(autoajuda), interesse(produtividade).

recomendar('O Universo em uma Casca de Noz', 'Stephen Hawking explica conceitos complexos de física de forma acessível.') :-
    genero(ciencia), interesse(universo).

recomendar('O Senhor dos Anéis', 'Uma fantasia épica de J.R.R. Tolkien, explorando coragem, amizade e poder.') :-
    genero(fantasia), interesse(aventura).

recomendar('Dom Casmurro', 'Um clássico brasileiro de Machado de Assis que explora o ciúme e a dúvida.') :-
    genero(ficcao), interesse(literatura_brasileira).

% Interação com o usuário para coletar preferências
recomendar_livro :-
    write('Bem-vindo ao sistema de recomendação de livros!'), nl,
    write('Por favor, responda "sim." ou "nao." às perguntas a seguir.'), nl,
    perguntar_genero,
    perguntar_interesse,
    % Encontrar recomendações com base nas preferências do usuário
    (recomendar(Titulo, Sinopse) ->
        format('Recomendação: ~w~nSinopse: ~w~n', [Titulo, Sinopse]);
        write('Desculpe, não encontramos livros baseados em suas preferências.'), nl).

% Perguntar sobre gêneros preferidos
perguntar_genero :-
    write('Você gosta de ficção? '), read(Resposta1),
    (Resposta1 == sim -> assert(genero(ficcao)); true),
    write('Você gosta de história? '), read(Resposta2),
    (Resposta2 == sim -> assert(genero(historia)); true),
    write('Você gosta de ciência? '), read(Resposta3),
    (Resposta3 == sim -> assert(genero(ciencia)); true),
    write('Você gosta de autoajuda? '), read(Resposta4),
    (Resposta4 == sim -> assert(genero(autoajuda)); true),
    write('Você gosta de fantasia? '), read(Resposta5),
    (Resposta5 == sim -> assert(genero(fantasia)); true).

% Perguntar sobre interesses específicos
perguntar_interesse :-
    write('Você se interessa por política? '), read(Resposta1),
    (Resposta1 == sim -> assert(interesse(politica)); true),
    write('Você se interessa por ciência? '), read(Resposta2),
    (Resposta2 == sim -> assert(interesse(ciencia)); true),
    write('Você se interessa por produtividade? '), read(Resposta3),
    (Resposta3 == sim -> assert(interesse(produtividade)); true),
    write('Você se interessa pelo universo? '), read(Resposta4),
    (Resposta4 == sim -> assert(interesse(universo)); true),
    write('Você se interessa por aventura? '), read(Resposta5),
    (Resposta5 == sim -> assert(interesse(aventura)); true),
    write('Você se interessa por literatura brasileira? '), read(Resposta6),
    (Resposta6 == sim -> assert(interesse(literatura_brasileira)); true).

% Limpar as preferências após o diagnóstico
:- dynamic genero/1.
:- dynamic interesse/1.

limpar_preferencias :-
    retractall(genero(_)),
    retractall(interesse(_)).

% Início do sistema
% Para iniciar o sistema de recomendação, chame "recomendar_livro."