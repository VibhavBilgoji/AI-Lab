:- dynamic known/3.
:- dynamic has_injury/2.

ask(X, _, Key) :-
    known(X, Key, Ans), !,
    Ans == yes.
ask(X, Label, Key) :-
    write('Does '), write(X), write(' have '), write(Label), write('? (yes/no): '),
    read(Ans),
    assertz(known(X, Key, Ans)),
    Ans == yes.

has_symptom(X, Symptom) :- ask(X, Symptom, symptom(Symptom)).
severity(X, Level) :- ask(X, severity(Level), severity(Level)).
patient_state(X, State) :- ask(X, state(State), state(State)).

first_aid(X, wash_wound_apply_antiseptic_and_bandage) :-
    has_injury(X, cut),
    has_symptom(X, bleeding),
    severity(X, minor),
    patient_state(X, conscious).

first_aid(X, apply_firm_pressure_and_call_emergency) :-
    has_injury(X, deep_cut),
    has_symptom(X, heavy_bleeding),
    severity(X, severe),
    patient_state(X, dizzy).

first_aid(X, cool_with_cold_water_and_cover_loosely) :-
    has_injury(X, burn),
    has_symptom(X, blisters),
    severity(X, moderate),
    patient_state(X, conscious).

first_aid(X, immobilize_limb_and_seek_medical_help) :-
    has_injury(X, fracture),
    has_symptom(X, swelling),
    severity(X, severe),
    patient_state(X, unable_to_move_limb).

first_aid(X, rest_ice_compression_and_elevation) :-
    has_injury(X, sprain),
    has_symptom(X, joint_pain),
    severity(X, mild),
    patient_state(X, conscious).

first_aid(X, lean_forward_and_pinch_soft_part_of_nose) :-
    has_injury(X, nosebleed),
    has_symptom(X, nasal_bleeding),
    severity(X, mild),
    patient_state(X, breathing_normally).

first_aid(X, perform_heimlich_maneuver_immediately) :-
    has_injury(X, choking),
    has_symptom(X, airway_blocked),
    severity(X, critical),
    patient_state(X, unable_to_speak).

first_aid(X, move_to_shade_loosen_clothes_and_hydrate) :-
    has_injury(X, heat_exhaustion),
    has_symptom(X, heavy_sweating),
    severity(X, moderate),
    patient_state(X, weak_and_nauseous).

first_aid(X, remove_stinger_wash_and_apply_ice_pack) :-
    has_injury(X, insect_sting),
    has_symptom(X, localized_swelling),
    severity(X, mild),
    patient_state(X, no_breathing_difficulty).

first_aid(X, place_in_recovery_position_and_monitor) :-
    has_injury(X, fainting),
    has_symptom(X, sudden_dizziness),
    severity(X, moderate),
    patient_state(X, briefly_unconscious).

first_aid(X, flush_eye_with_clean_water_for_15_minutes) :-
    has_injury(X, chemical_eye_splash),
    has_symptom(X, burning_eyes),
    severity(X, severe),
    patient_state(X, conscious).

first_aid(X, warm_gradually_with_blankets_and_dry_clothes) :-
    has_injury(X, hypothermia),
    has_symptom(X, intense_shivering),
    severity(X, moderate),
    patient_state(X, cold_skin).

write_clean(Atom) :-
    atomic_list_concat(Parts, '_', Atom),
    atomic_list_concat(Parts, ' ', Clean),
    write(Clean).

start :-
    retractall(known(_, _, _)),
    retractall(has_injury(_, _)),
    write('Enter patient name: '),
    read(Name),
    write('Available injuries: cut, deep_cut, burn, fracture, sprain, nosebleed, choking, heat_exhaustion, insect_sting, fainting, chemical_eye_splash, hypothermia'), nl,
    write('Enter the injury/problem: '),
    read(Injury),
    assertz(has_injury(Name, Injury)),
    ( first_aid(Name, Measure) ->
        write('Recommended first-aid measure for '), write(Name), write(': '),
        write_clean(Measure), nl
    ;
        write('No matching first-aid measure found for '), write(Name), write('.'), nl
    ).
