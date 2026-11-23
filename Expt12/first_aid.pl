has_injury(amit, cut).
has_injury(rahul, burn).
has_injury(john, fracture).
has_injury(priya, sprain).

has_symptom(amit, bleeding).
has_symptom(rahul, blisters).
has_symptom(john, swelling).
has_symptom(priya, joint_pain).

first_aid(X, wash_wound_apply_antiseptic_and_bandage) :-
    has_injury(X, cut),
    has_symptom(X, bleeding).

first_aid(X, cool_with_cold_water_and_cover_loosely) :-
    has_injury(X, burn),
    has_symptom(X, blisters).

first_aid(X, immobilize_limb_and_seek_medical_help) :-
    has_injury(X, fracture),
    has_symptom(X, swelling).

first_aid(X, rest_ice_compression_and_elevation) :-
    has_injury(X, sprain),
    has_symptom(X, joint_pain).

start :-
    write('Enter patient name (amit/rahul/john/priya): '),
    read(Name),
    ( first_aid(Name, Measure) ->
        write('Recommended first-aid measure: '),
        write(Measure), nl
    ;
        write('No matching first-aid measure found.'), nl
    ).
