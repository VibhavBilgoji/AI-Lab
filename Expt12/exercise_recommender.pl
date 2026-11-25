:- dynamic known/3.
:- dynamic has_goal/2.

ask(X, _, Key) :-
    known(X, Key, Ans), !,
    Ans == yes.
ask(X, Label, Key) :-
    write('Does '), write(X), write(' have '), write(Label), write('? (yes/no): '),
    read(Ans),
    assertz(known(X, Key, Ans)),
    Ans == yes.

capability(X, Cap) :- ask(X, capability(Cap), capability(Cap)).
age_group(X, Age) :- ask(X, age_group(Age), age_group(Age)).
equipment(X, Equip) :- ask(X, equipment(Equip), equipment(Equip)).

exercise(X, running_and_hiit) :-
    has_goal(X, weight_loss),
    capability(X, high_stamina),
    age_group(X, young_adult),
    equipment(X, none).

exercise(X, brisk_walking) :-
    has_goal(X, weight_loss),
    capability(X, beginner),
    age_group(X, adult),
    equipment(X, none).

exercise(X, weight_training) :-
    has_goal(X, muscle_gain),
    capability(X, physically_fit),
    age_group(X, young_adult),
    equipment(X, dumbbells).

exercise(X, gentle_yoga_and_stretching) :-
    has_goal(X, flexibility),
    capability(X, joint_pain),
    age_group(X, senior),
    equipment(X, mat).

exercise(X, swimming_laps) :-
    has_goal(X, endurance),
    capability(X, moderate_stamina),
    age_group(X, adult),
    equipment(X, pool).

exercise(X, stationary_cycling) :-
    has_goal(X, cardio_health),
    capability(X, beginner),
    age_group(X, senior),
    equipment(X, bicycle).

exercise(X, pilates_core_workout) :-
    has_goal(X, posture_improvement),
    capability(X, moderate_stamina),
    age_group(X, adult),
    equipment(X, mat).

exercise(X, jump_rope_intervals) :-
    has_goal(X, agility),
    capability(X, high_stamina),
    age_group(X, teen),
    equipment(X, jump_rope).

exercise(X, resistance_band_toning) :-
    has_goal(X, muscle_toning),
    capability(X, beginner),
    age_group(X, adult),
    equipment(X, resistance_band).

exercise(X, bodyweight_calisthenics) :-
    has_goal(X, strength),
    capability(X, physically_fit),
    age_group(X, teen),
    equipment(X, none).

exercise(X, tai_chi_balance_flow) :-
    has_goal(X, balance),
    capability(X, limited_mobility),
    age_group(X, senior),
    equipment(X, none).

exercise(X, incline_treadmill_walk) :-
    has_goal(X, fat_burn),
    capability(X, moderate_stamina),
    age_group(X, young_adult),
    equipment(X, treadmill).

write_clean(Atom) :-
    atomic_list_concat(Parts, '_', Atom),
    atomic_list_concat(Parts, ' ', Clean),
    write(Clean).

start :-
    retractall(known(_, _, _)),
    retractall(has_goal(_, _)),
    write('Enter user name: '),
    read(Name),
    write('Available fitness goals: weight_loss, muscle_gain, flexibility, endurance, cardio_health, posture_improvement, agility, muscle_toning, strength, balance, fat_burn'), nl,
    write('Enter your fitness goal/problem: '),
    read(Goal),
    assertz(has_goal(Name, Goal)),
    ( exercise(Name, Exercise) ->
        write('Recommended exercise for '), write(Name), write(': '),
        write_clean(Exercise), nl
    ;
        write('No matching exercise recommendation found for '), write(Name), write('.'), nl
    ).
