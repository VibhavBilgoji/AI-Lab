dances(lili).
search_for_food(tom).
loves_cricket(jack).
loves_cricket(bili).
is_closed(school).
free(ryan).

happy(lili) :- dances(lili).
hungry(tom) :- search_for_food(tom).
friends(jack, bili) :- loves_cricket(jack), loves_cricket(bili).
go_to_play(ryan) :- is_closed(school), free(ryan).
