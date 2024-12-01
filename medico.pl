% Base de conhecimento de sintomas e doenças
% Cada doença é definida com base em sintomas específicos

% Regras para identificar doenças
doenca(gripe) :- febre, tosse, cansaco.
doenca(infeccao_viral) :- febre, dor_de_garganta, dor_muscular.
doenca(enxaqueca) :- dor_de_cabeca, sensibilidade_a_luz, nauseas.
doenca(alergia) :- espirros, coceira, olhos_lacrimejando.

% Regra geral para alertar caso nenhum diagnóstico seja encontrado
doenca(desconhecida) :- \+ (febre; tosse; dor_de_cabeca; dor_de_garganta; dor_muscular; espirros; coceira; olhos_lacrimejando).

% Regras para interação com o usuário
% Perguntar ao usuário sobre os sintomas e deduzir um diagnóstico
diagnosticar :-
    write('Bem-vindo ao sistema de diagnóstico médico.'), nl,
    write('Por favor, responda "sim." ou "nao." às perguntas a seguir.'), nl,
    perguntar(febre),
    perguntar(tosse),
    perguntar(cansaco),
    perguntar(dor_de_cabeca),
    perguntar(dor_de_garganta),
    perguntar(dor_muscular),
    perguntar(sensibilidade_a_luz),
    perguntar(nauseas),
    perguntar(espirros),
    perguntar(coceira),
    perguntar(olhos_lacrimejando),
    % Verificar qual doença corresponde aos sintomas
    (doenca(Doenca) -> 
        write('Diagnóstico provável: '), write(Doenca), nl;
        write('Não foi possível determinar um diagnóstico. Consulte um médico.'), nl).

% Perguntar ao usuário sobre um sintoma específico
% O predicado dynamic permite atualizar o banco de dados dinamicamente
:- dynamic(febre/0).
:- dynamic(tosse/0).
:- dynamic(cansaco/0).
:- dynamic(dor_de_cabeca/0).
:- dynamic(dor_de_garganta/0).
:- dynamic(dor_muscular/0).
:- dynamic(sensibilidade_a_luz/0).
:- dynamic(nauseas/0).
:- dynamic(espirros/0).
:- dynamic(coceira/0).
:- dynamic(olhos_lacrimejando/0).

perguntar(Sintoma) :-
    format('Você está com ~w? ', [Sintoma]),
    read(Resposta),
    (Resposta == sim -> assert(Sintoma); true).

% Início do sistema
% Para iniciar o diagnóstico, basta chamar o predicado "diagnosticar."
