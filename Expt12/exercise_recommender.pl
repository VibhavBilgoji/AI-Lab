has_goal(amit, weight_loss).
has_goal(rahul, weight_loss).
has_goal(john, muscle_gain).
has_goal(priya, flexibility).

capability(amit, high_stamina).
capability(rahul, beginner).
capability(john, physically_fit).
capability(priya, joint_pain).

exercise(X, running_and_hiit) :-
    has_goal(X, weight_loss),
    capability(X, high_stamina).

exercise(X, brisk_walking) :-
    has_goal(X, weight_loss),
    capability(X, beginner).

exercise(X, weight_training) :-
    has_goal(X, muscle_gain),
    capability(X, physically_fit).

exercise(X, gentle_yoga_and_stretching) :-
    has_goal(X, flexibility),
    capability(X, joint_pain).

start :-
    write('Enter user name (amit/rahul/john/priya): '),
    read(Name),
    ( exercise(Name, Exercise) ->
        write('Recommended exercise: '),
        write(Exercise), nl
    ;
        write('No matching exercise recommendation found.'), nl
    ).
