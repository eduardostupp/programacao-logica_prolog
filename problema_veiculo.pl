% Base de conhecimento de problemas e soluções para veículos
% Cada problema é definido com base em sintomas específicos relatados pelo usuário.

% Regras para identificar problemas comuns
problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear, pedal_freio_macio.
problema(vazamento_oleo) :- mancha_no_chao, baixo_nivel_oleo.
problema(correia_solta) :- barulho_agudo, dificuldade_partida.
problema(velas_desgastadas) :- motor_falha, consumo_combustivel_alto.

% Regra geral para problemas graves
problema(grave) :- motor_fumaca; falha_total_freios.

% Regras para interação com o usuário
% Perguntar ao usuário sobre os sintomas e deduzir o problema
diagnosticar :-
    write('Bem-vindo ao sistema de diagnóstico de veículos.'), nl,
    write('Por favor, responda "sim." ou "nao." às perguntas a seguir.'), nl,
    perguntar(motor_nao_liga),
    perguntar(luzes_fracas),
    perguntar(barulho_ao_frear),
    perguntar(pedal_freio_macio),
    perguntar(mancha_no_chao),
    perguntar(baixo_nivel_oleo),
    perguntar(barulho_agudo),
    perguntar(dificuldade_partida),
    perguntar(motor_falha),
    perguntar(consumo_combustivel_alto),
    perguntar(motor_fumaca),
    perguntar(falha_total_freios),
    % Verificar qual problema corresponde aos sintomas
    (problema(Problema) ->
        fornecer_solucao(Problema);
        write('Não foi possível determinar o problema. Consulte um mecânico.'), nl).

% Fornecer soluções específicas para cada problema
fornecer_solucao(bateria_fraca) :-
    write('Recomendação: Verifique a bateria e os cabos de conexão.'), nl.
fornecer_solucao(freio_desgastado) :-
    write('Recomendação: Inspecione o sistema de freios. Pode ser necessário trocar as pastilhas.'), nl.
fornecer_solucao(vazamento_oleo) :-
    write('Recomendação: Verifique o nível de óleo e procure por vazamentos visíveis.'), nl.
fornecer_solucao(correia_solta) :-
    write('Recomendação: Ajuste ou substitua a correia do motor.'), nl.
fornecer_solucao(velas_desgastadas) :-
    write('Recomendação: Substitua as velas de ignição.'), nl.
fornecer_solucao(grave) :-
    write('Problema grave detectado! Leve o veículo a um mecânico imediatamente.'), nl.

% Perguntar ao usuário sobre um sintoma específico
% O predicado dynamic permite atualizar o banco de dados dinamicamente
:- dynamic(motor_nao_liga/0).
:- dynamic(luzes_fracas/0).
:- dynamic(barulho_ao_frear/0).
:- dynamic(pedal_freio_macio/0).
:- dynamic(mancha_no_chao/0).
:- dynamic(baixo_nivel_oleo/0).
:- dynamic(barulho_agudo/0).
:- dynamic(dificuldade_partida/0).
:- dynamic(motor_falha/0).
:- dynamic(consumo_combustivel_alto/0).
:- dynamic(motor_fumaca/0).
:- dynamic(falha_total_freios/0).

perguntar(Sintoma) :-
    format('O veículo apresenta ~w? (sim/nao): ', [Sintoma]),
    read(Resposta),
    (Resposta == sim -> assert(Sintoma); true).

% Limpar os sintomas ao final do diagnóstico
limpar :-
    retractall(motor_nao_liga),
    retractall(luzes_fracas),
    retractall(barulho_ao_frear),
    retractall(pedal_freio_macio),
    retractall(mancha_no_chao),
    retractall(baixo_nivel_oleo),
    retractall(barulho_agudo),
    retractall(dificuldade_partida),
    retractall(motor_falha),
    retractall(consumo_combustivel_alto),
    retractall(motor_fumaca),
    retractall(falha_total_freios).

% Início do sistema
% Para iniciar o diagnóstico, basta chamar o predicado "diagnosticar."
