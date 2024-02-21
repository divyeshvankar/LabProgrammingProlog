group([], [], []).
group(Elements, [Size|Sizes], [Group|Groups]) :-
    length(Group, Size),
    append(Group, Rest, Elements),
    group(Rest, Sizes, Groups).

group(Elements, [_|Sizes], Groups) :-
    group(Elements, Sizes, Groups).

group(Elements, Sizes, Groups) :-
    permutation(Elements, Permuted),
    group(Permuted, Sizes, Groups).
