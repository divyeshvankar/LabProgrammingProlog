group([], [], []).
group(Elements, [Size|Sizes], [Group|Groups]) :-
    length(Group, Size),
    append(Group, Rest, Elements),
    group(Rest, Sizes, Groups).

group(Elements, [_|Sizes], Groups) :-
    group(Elements, Sizes, Groups).

group(Elements, Sizes, Groups) :-
    permutation(Elements, Permuted),
    group_permuted(Permuted, Sizes, Groups).

group_permuted([], [], []).
group_permuted(Permuted, [Size|Sizes], [Group|Groups]) :-
    length(Group, Size),
    append(Group, Rest, Permuted),
    group_permuted(Rest, Sizes, Groups).
