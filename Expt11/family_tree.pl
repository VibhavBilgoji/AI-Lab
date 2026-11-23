female(pam).
female(liz).
female(pat).
female(ann).
male(jim).
male(bob).
male(tom).
male(peter).

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(bob, peter).
parent(peter, jim).

child(X, Y) :-
    parent(Y, X).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    dif(X, Y).

grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).

grandmother(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    female(X).

ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
