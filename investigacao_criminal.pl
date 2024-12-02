% Base de conhecimento de evidências, testemunhos e teorias
% Cada suspeito ou teoria está associado a evidências específicas.

% Regras para identificar suspeitos
suspeito(jose) :-
    impressao_digital(lugar_crime), motivo(financeiro).

suspeito(maria) :-
    testemunha(vista_proximo), motivo(revenge).

suspeito(carlos) :-
    impressao_digital(objeto_crime), alibi(falha).

% Regras para formar teorias
teoria(crime_passional) :-
    testemunha(visto_discutindo), relacao(intima).

teoria(roubo_planejado) :-
    motivo(financeiro), impressao_digital(lugar_crime).

teoria(crime_acidental) :-
    ausencia_motivo, testemunha(descricao_incompleta).

% Interação com o usuário para coletar evidências
analisar_crime :-
    write('Bem-vindo ao sistema de análise de investigação criminal.'), nl,
    write('Por favor, responda "sim." ou "nao." às perguntas a seguir.'), nl,
    perguntar_evidencias,
    perguntar_testemunhos,
    % Determinar suspeitos com base nas evidências
    (suspeito(Suspeito) ->
        format('Suspeito identificado: ~w~n', [Suspeito]);
        write('Nenhum suspeito específico identificado com base nas evidências.'), nl),
    % Determinar teorias com base nas evidências e testemunhos
    (teoria(Teoria) ->
        format('Teoria sugerida: ~w~n', [Teoria]);
        write('Nenhuma teoria clara pôde ser formada. Reúna mais evidências.'), nl).

% Perguntas sobre evidências
perguntar_evidencias :-
    write('Impressões digitais foram encontradas no local do crime? '), read(Resposta1),
    (Resposta1 == sim -> assert(impressao_digital(lugar_crime)); true),
    write('Impressões digitais foram encontradas no objeto usado no crime? '), read(Resposta2),
    (Resposta2 == sim -> assert(impressao_digital(objeto_crime)); true),
    write('O motivo financeiro está presente? '), read(Resposta3),
    (Resposta3 == sim -> assert(motivo(financeiro)); true),
    write('O motivo é relacionado a vingança? '), read(Resposta4),
    (Resposta4 == sim -> assert(motivo(revenge)); true),
    write('Não há motivo aparente? '), read(Resposta5),
    (Resposta5 == sim -> assert(ausencia_motivo); true).

% Perguntas sobre testemunhos
perguntar_testemunhos :-
    write('Há uma testemunha que viu alguém discutindo no local do crime? '), read(Resposta1),
    (Resposta1 == sim -> assert(testemunha(visto_discutindo)); true),
    write('Há uma testemunha que viu alguém próximo ao local? '), read(Resposta2),
    (Resposta2 == sim -> assert(testemunha(vista_proximo)); true),
    write('A descrição da testemunha é incompleta? '), read(Resposta3),
    (Resposta3 == sim -> assert(testemunha(descricao_incompleta)); true),
    write('Há evidências de uma relação íntima entre o suspeito e a vítima? '), read(Resposta4),
    (Resposta4 == sim -> assert(relacao(intima)); true),
    write('O álibi do suspeito é inconsistente ou falho? '), read(Resposta5),
    (Resposta5 == sim -> assert(alibi(falha)); true).

% Limpar os fatos após análise
:- dynamic impressao_digital/1.
:- dynamic motivo/1.
:- dynamic ausencia_motivo/0.
:- dynamic testemunha/1.
:- dynamic relacao/1.
:- dynamic alibi/1.

limpar_fatos :-
    retractall(impressao_digital(_)),
    retractall(motivo(_)),
    retractall(ausencia_motivo),
    retractall(testemunha(_)),
    retractall(relacao(_)),
    retractall(alibi(_)).

% Início do sistema
% Para iniciar a análise de um caso, chame "analisar_crime."
