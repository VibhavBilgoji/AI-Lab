% Extracted from "Patient symptoms.pdf" (reference program for Experiment 11)
% To identify possible diseases based on symptoms.

% Patient symptoms
has_symptom('Sparsh', fever).
has_symptom('Sparsh', cough).
has_symptom('Sparsh', body_pain).

has_symptom('Walsh', sneezing).
has_symptom('Walsh', runny_nose).
has_symptom('Walsh', cough).

has_symptom('Shubham', vomiting).
has_symptom('Shubham', stomach_pain).
has_symptom('Shubham', diarrhea).

% Diagnosis rules
disease(X, flu) :-
    has_symptom(X, fever),
    has_symptom(X, cough),
    has_symptom(X, body_pain).

disease(X, common_cold) :-
    has_symptom(X, sneezing),
    has_symptom(X, runny_nose),
    has_symptom(X, cough).

disease(X, food_poisoning) :-
    has_symptom(X, vomiting),
    has_symptom(X, stomach_pain),
    has_symptom(X, diarrhea).

% Sample queries:
% ?- disease('Sparsh', D).
% ?- disease(X, food_poisoning).
