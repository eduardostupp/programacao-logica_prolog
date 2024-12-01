% Base de conhecimento de treinos e exercícios
% Cada treino está associado a objetivos, experiência e disponibilidade de tempo.

% Regras de recomendação de treinos
treino(hipertrofia, 'Treino de hipertrofia: 4 séries de 8-12 repetições para cada grupo muscular, incluindo supino, agachamento e remada.') :-
    objetivo(ganhar_massa), experiencia(intermediario; avancado).

treino(perda_de_peso, 'Treino de perda de peso: Circuito com 3 séries de 15 repetições, incluindo burpees, polichinelos, e abdominais, com descanso curto.') :-
    objetivo(emagrecer), disponibilidade(tempo_limitado).

treino(condicionamento, 'Treino de condicionamento físico: 30 minutos de HIIT, alternando corrida e exercícios como salto no caixote.') :-
    objetivo(melhorar_condicionamento), experiencia(iniciante; intermediario).

treino(forca, 'Treino de força: 5 séries de 5 repetições, focando em exercícios compostos como levantamento terra, agachamento e supino.') :-
    objetivo(ganhar_forca), experiencia(avancado).

% Perguntas para coletar preferências do usuário
recomendar_treino :-
    write('Bem-vindo ao sistema de recomendação de treinos de academia!'), nl,
    write('Responda "sim." ou "nao." às perguntas a seguir para receber um plano personalizado.'), nl,
    perguntar_objetivo,
    perguntar_experiencia,
    perguntar_disponibilidade,
    % Determinar o treino baseado nas respostas
    (treino(Tipo, Descricao) ->
        format('Recomendação: ~w~nDescrição: ~w~n', [Tipo, Descricao]);
        write('Não foi possível encontrar um treino adequado com base nas suas respostas. Consulte um profissional.'), nl).

% Perguntas sobre o objetivo
perguntar_objetivo :-
    write('Seu objetivo é ganhar massa muscular? '), read(Resposta1),
    (Resposta1 == sim -> assert(objetivo(ganhar_massa)); true),
    write('Seu objetivo é emagrecer? '), read(Resposta2),
    (Resposta2 == sim -> assert(objetivo(emagrecer)); true),
    write('Seu objetivo é melhorar o condicionamento físico? '), read(Resposta3),
    (Resposta3 == sim -> assert(objetivo(melhorar_condicionamento)); true),
    write('Seu objetivo é ganhar força? '), read(Resposta4),
    (Resposta4 == sim -> assert(objetivo(ganhar_forca)); true).

% Perguntas sobre experiência na academia
perguntar_experiencia :-
    write('Você é iniciante na academia? '), read(Resposta1),
    (Resposta1 == sim -> assert(experiencia(iniciante)); true),
    write('Você tem experiência intermediária? '), read(Resposta2),
    (Resposta2 == sim -> assert(experiencia(intermediario)); true),
    write('Você é avançado na academia? '), read(Resposta3),
    (Resposta3 == sim -> assert(experiencia(avancado)); true).

% Perguntas sobre disponibilidade de tempo
perguntar_disponibilidade :-
    write('Você tem tempo limitado para treinar? '), read(Resposta1),
    (Resposta1 == sim -> assert(disponibilidade(tempo_limitado)); true),
    write('Você tem tempo suficiente para treinos mais longos? '), read(Resposta2),
    (Resposta2 == sim -> assert(disponibilidade(tempo_suficiente)); true).

% Limpar as preferências do usuário após a recomendação
:- dynamic objetivo/1.
:- dynamic experiencia/1.
:- dynamic disponibilidade/1.

limpar_preferencias :-
    retractall(objetivo(_)),
    retractall(experiencia(_)),
    retractall(disponibilidade(_)).

% Início do sistema
% Para iniciar o sistema de recomendação, chame "recomendar_treino."
