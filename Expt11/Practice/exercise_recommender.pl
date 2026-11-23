% ============================================================
% Experiment 11 - Task 3
% To recommend suitable exercises based on fitness goals
% and physical capabilities.
% ============================================================

% Fitness goals
has_goal('Manthan', weight_loss).
has_goal('Walsh', muscle_gain).
has_goal('Shubham', flexibility).
has_goal('Vibhav', endurance).
has_goal('Rafaan', weight_loss).
has_goal('Omkar', flexibility).
has_goal('Vibhu', endurance).

% Physical capabilities and limitations
is_fit('Manthan').
is_fit('Walsh').
is_fit('Vibhu').
is_beginner('Rafaan').
has_knee_pain('Vibhav').
is_senior('Omkar').

% Exercise recommendation rules (goal combined with capability)
exercise(X, jogging_or_hiit) :-
    has_goal(X, weight_loss),
    is_fit(X).

exercise(X, brisk_walking) :-
    has_goal(X, weight_loss),
    is_beginner(X).

exercise(X, swimming) :-
    has_goal(X, weight_loss),
    has_knee_pain(X).

exercise(X, weight_training) :-
    has_goal(X, muscle_gain),
    is_fit(X).

exercise(X, pushups_squats_and_plank) :-
    has_goal(X, muscle_gain),
    is_beginner(X).

exercise(X, yoga) :-
    has_goal(X, flexibility).

exercise(X, gentle_stretching) :-
    has_goal(X, flexibility),
    is_senior(X).

exercise(X, running) :-
    has_goal(X, endurance),
    is_fit(X).

exercise(X, cycling) :-
    has_goal(X, endurance),
    has_knee_pain(X).

% Derived rule: anyone with knee pain must avoid high-impact exercise
avoid_high_impact(X) :-
    has_knee_pain(X).

% Sample queries:
% ?- exercise('Manthan', E).                  % exercises for 'Manthan'
% ?- exercise(X, yoga).                  % who should do yoga
% ?- exercise(X, E).                     % recommendations for everyone
% ?- avoid_high_impact(X).