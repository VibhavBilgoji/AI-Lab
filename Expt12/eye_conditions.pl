has_symptom(amit, redness).
has_symptom(amit, itching).
has_symptom(amit, discharge).

has_symptom(rahul, dryness).
has_symptom(rahul, gritty_sensation).
has_symptom(rahul, blurred_vision).

has_symptom(john, blurry_distance).
has_symptom(john, squinting).
has_symptom(john, eye_strain).

has_symptom(priya, severe_pain).
has_symptom(priya, headache).
has_symptom(priya, halos_around_lights).

eye_condition(X, conjunctivitis) :-
    has_symptom(X, redness),
    has_symptom(X, itching),
    has_symptom(X, discharge).

eye_condition(X, dry_eye_syndrome) :-
    has_symptom(X, dryness),
    has_symptom(X, gritty_sensation),
    has_symptom(X, blurred_vision).

eye_condition(X, myopia) :-
    has_symptom(X, blurry_distance),
    has_symptom(X, squinting),
    has_symptom(X, eye_strain).

eye_condition(X, glaucoma) :-
    has_symptom(X, severe_pain),
    has_symptom(X, headache),
    has_symptom(X, halos_around_lights).

start :-
    write('Enter patient name (amit/rahul/john/priya): '),
    read(Name),
    ( eye_condition(Name, Condition) ->
        write('Possible eye condition: '),
        write(Condition), nl
    ;
        write('No matching eye condition found.'), nl
    ).
