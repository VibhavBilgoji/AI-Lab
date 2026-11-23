has_symptom(amit, fatigue).
has_symptom(amit, pale_skin).
has_symptom(amit, breathlessness).

has_symptom(rahul, night_blindness).
has_symptom(rahul, dry_eyes).

has_symptom(john, bleeding_gums).
has_symptom(john, easy_bruising).

has_symptom(priya, bone_pain).
has_symptom(priya, muscle_weakness).

deficiency(X, iron) :-
    has_symptom(X, fatigue),
    has_symptom(X, pale_skin),
    has_symptom(X, breathlessness).

deficiency(X, vitamin_a) :-
    has_symptom(X, night_blindness),
    has_symptom(X, dry_eyes).

deficiency(X, vitamin_c) :-
    has_symptom(X, bleeding_gums),
    has_symptom(X, easy_bruising).

deficiency(X, vitamin_d) :-
    has_symptom(X, bone_pain),
    has_symptom(X, muscle_weakness).

start :-
    write('Enter patient name (amit/rahul/john/priya): '),
    read(Name),
    ( deficiency(Name, Nutrient) ->
        write('Possible nutritional deficiency: '),
        write(Nutrient), nl
    ;
        write('No matching deficiency found.'), nl
    ).
