just_ate(lion, deer).
just_ate(deer, grass).
just_ate(grass, nutrients).

is_digesting(X, Y) :-
    just_ate(X, Y).
is_digesting(X, Y) :-
    just_ate(X, Z),
    is_digesting(Z, Y).
