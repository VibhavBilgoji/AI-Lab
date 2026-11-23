% ============================================================
% Experiment 11 - Task 2
% To identify possible nutritional deficiencies based on symptoms.
% ============================================================

% Reported symptoms
has_deficiency_symptom('Manthan', fatigue).
has_deficiency_symptom('Manthan', pale_skin).
has_deficiency_symptom('Manthan', breathlessness).

has_deficiency_symptom('Walsh', night_blindness).
has_deficiency_symptom('Walsh', dry_eyes).

has_deficiency_symptom('Shubham', bleeding_gums).
has_deficiency_symptom('Shubham', easy_bruising).

has_deficiency_symptom('Vibhav', bone_pain).
has_deficiency_symptom('Vibhav', muscle_weakness).

has_deficiency_symptom('Omkar', muscle_cramps).
has_deficiency_symptom('Omkar', numbness_in_hands).

has_deficiency_symptom('Vibhu', hair_loss).
has_deficiency_symptom('Vibhu', loss_of_taste).

% Deficiency identification rules
deficiency(X, iron) :-
    has_deficiency_symptom(X, fatigue),
    has_deficiency_symptom(X, pale_skin),
    has_deficiency_symptom(X, breathlessness).

deficiency(X, vitamin_a) :-
    has_deficiency_symptom(X, night_blindness),
    has_deficiency_symptom(X, dry_eyes).

deficiency(X, vitamin_c) :-
    has_deficiency_symptom(X, bleeding_gums),
    has_deficiency_symptom(X, easy_bruising).

deficiency(X, vitamin_d) :-
    has_deficiency_symptom(X, bone_pain),
    has_deficiency_symptom(X, muscle_weakness).

deficiency(X, calcium) :-
    has_deficiency_symptom(X, muscle_cramps),
    has_deficiency_symptom(X, numbness_in_hands).

deficiency(X, zinc) :-
    has_deficiency_symptom(X, hair_loss),
    has_deficiency_symptom(X, loss_of_taste).

% Food sources of each nutrient
food_for(iron, spinach).
food_for(iron, lentils).
food_for(vitamin_a, carrots).
food_for(vitamin_a, papaya).
food_for(vitamin_c, citrus_fruits).
food_for(vitamin_c, amla).
food_for(vitamin_d, morning_sunlight).
food_for(vitamin_d, fortified_milk).
food_for(calcium, milk).
food_for(calcium, ragi).
food_for(zinc, nuts).
food_for(zinc, whole_grains).

% Derived rule: what the patient should eat
diet_advice(X, Food) :-
    deficiency(X, Nutrient),
    food_for(Nutrient, Food).

% Sample queries:
% ?- deficiency('Manthan', N).                % what is 'Manthan' deficient in
% ?- deficiency(X, vitamin_c).           % who shows vitamin C deficiency
% ?- diet_advice('Vibhav', F).              % foods for 'Vibhav''s deficiency
% ?- deficiency(X, N).                   % every patient with a deficiency
