dances(lily).
search_for_food(tom).
lovesCricket(jack).
isClosed(school).

happy(lily) :- dances(lily).
hungry(tom) :- search_for_food(tom).
friends(jack, bili) :- lovesCricket(jack), lovesCricket(bili).
goToPlay(ryan) :- isClosed(school), free(ryan).
