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
    split_list(Permuted, Size, Group, Rest),
    group_permuted(Rest, Sizes, Groups).

split_list(List, 0, [], List).
split_list([X|Xs], N, [X|Ys], Zs) :-
    N > 0,
    N1 is N - 1,
    split_list(Xs, N1, Ys, Zs).

