father(sudip, piyush).
father(sudip, raj).

mother(mary,piyush).
mother(mary,raj).

male(piyush).
male(raj).

brother(X,Y):- father(Z,X), father(Z,Y),mother(V,X), mother(V,Y), male(X), male(Y), dif(X,Y).
