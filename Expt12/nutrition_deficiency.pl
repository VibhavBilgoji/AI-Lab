:- dynamic known/3.
:- dynamic main_problem/2.

ask(X, Symptom) :-
    known(X, Symptom, Ans), !,
    Ans == yes.
ask(X, Symptom) :-
    write('Does '), write(X), write(' have '), write(Symptom), write('? (yes/no): '),
    read(Ans),
    assertz(known(X, Symptom, Ans)),
    Ans == yes.

has_symptom(X, Symptom) :- ask(X, Symptom).

deficiency(X, iron) :-
    main_problem(X, fatigue),
    has_symptom(X, pale_skin),
    has_symptom(X, breathlessness),
    has_symptom(X, cold_hands_and_feet).

deficiency(X, vitamin_a) :-
    main_problem(X, night_blindness),
    has_symptom(X, dry_eyes),
    has_symptom(X, dry_skin),
    has_symptom(X, frequent_infections).

deficiency(X, vitamin_c) :-
    main_problem(X, bleeding_gums),
    has_symptom(X, easy_bruising),
    has_symptom(X, slow_wound_healing),
    has_symptom(X, joint_swelling).

deficiency(X, vitamin_d) :-
    main_problem(X, bone_pain),
    has_symptom(X, muscle_weakness),
    has_symptom(X, frequent_backache),
    has_symptom(X, low_mood).

deficiency(X, vitamin_b12) :-
    main_problem(X, tingling_numbness),
    has_symptom(X, memory_loss),
    has_symptom(X, weakness),
    has_symptom(X, sore_tongue).

deficiency(X, calcium) :-
    main_problem(X, muscle_cramps),
    has_symptom(X, brittle_nails),
    has_symptom(X, tooth_decay),
    has_symptom(X, bone_fragility).

deficiency(X, zinc) :-
    main_problem(X, hair_loss),
    has_symptom(X, loss_of_appetite),
    has_symptom(X, impaired_taste),
    has_symptom(X, skin_lesions).

deficiency(X, iodine) :-
    main_problem(X, neck_swelling),
    has_symptom(X, weight_gain),
    has_symptom(X, dry_hair),
    has_symptom(X, cold_sensitivity).

deficiency(X, magnesium) :-
    main_problem(X, muscle_twitching),
    has_symptom(X, insomnia),
    has_symptom(X, irregular_heartbeat),
    has_symptom(X, nausea).

deficiency(X, potassium) :-
    main_problem(X, muscle_spasms),
    has_symptom(X, constipation),
    has_symptom(X, heart_palpitations),
    has_symptom(X, extreme_tiredness).

deficiency(X, folate) :-
    main_problem(X, mouth_ulcers),
    has_symptom(X, headache),
    has_symptom(X, irritability),
    has_symptom(X, shortness_of_breath).

deficiency(X, protein) :-
    main_problem(X, muscle_wasting),
    has_symptom(X, edema_swelling),
    has_symptom(X, thinning_hair),
    has_symptom(X, stunted_recovery).

write_clean(Atom) :-
    atomic_list_concat(Parts, '_', Atom),
    atomic_list_concat(Parts, ' ', Clean),
    write(Clean).

start :-
    retractall(known(_, _, _)),
    retractall(main_problem(_, _)),
    write('Enter patient name: '),
    read(Name),
    write('Available main problems: fatigue, night_blindness, bleeding_gums, bone_pain, tingling_numbness, muscle_cramps, hair_loss, neck_swelling, muscle_twitching, muscle_spasms, mouth_ulcers, muscle_wasting'), nl,
    write('Enter your main problem: '),
    read(Problem),
    assertz(main_problem(Name, Problem)),
    ( deficiency(Name, Nutrient) ->
        write('Possible nutritional deficiency for '), write(Name), write(': '),
        write_clean(Nutrient), nl
    ;
        write('No matching deficiency found for '), write(Name), write('.'), nl
    ).
