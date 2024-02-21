group(_, [], []).
group(Elements, [Size|Sizes], [Group|Groups]) :-
    combination(Elements, Size, Group),
    subtract(Elements, Group, RestElements),
    group(RestElements, Sizes, Groups).

combination(_, 0, []).
combination([X|Xs], N, [X|Combination]) :-
    N > 0,
    N1 is N - 1,
    combination(Xs, N1, Combination).
combination([_|Xs], N, Combination) :-
    N > 0,
    combination(Xs, N, Combination).

all_different([]).
all_different([X|Xs]) :- \+ member(X, Xs), all_different(Xs).
