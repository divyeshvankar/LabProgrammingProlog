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

%
% ?- group([a,b,c,d,e],[1,1,3],G).
% G = [[a], [b], [c, d, e]] ;
% G = [[a], [b], [c, d, e]] ;
% G = [[a], [b], [c, d, e]] ;
% G = [[a], [b], [c, e, d]] ;
% G = [[a], [b], [d, c, e]] ;
% G = [[a], [b], [d, e, c]] ;
% G = [[a], [b], [e, c, d]] ;
% G = [[a], [b], [e, d, c]] ;
% G = [[a], [b], [c, d, e]] ;
% G = [[a], [b], [c, e, d]] ;
% G = [[a], [b], [d, c, e]] ;
% G = [[a], [b], [d, e, c]] ;
% G = [[a], [b], [e, c, d]] ;
% G = [[a], [b], [e, d, c]] ;
% G = [[a], [c], [b, d, e]] ;
% G = [[a], [c], [b, e, d]] ;
% G = [[a], [c], [d, b, e]] ;
% G = [[a], [c], [d, e, b]] ;
% G = [[a], [c], [e, b, d]] ;
% G = [[a], [c], [e, d, b]] ;
% G = [[a], [d], [b, c, e]] ;
% G = [[a], [d], [b, e, c]] ;
% G = [[a], [d], [c, b, e]] ;
% G = [[a], [d], [c, e, b]] ;
% G = [[a], [d], [e, b, c]] ;
% G = [[a], [d], [e, c, b]] ;
% G = [[a], [e], [b, c, d]] ;
% G = [[a], [e], [b, d, c]] ;
% G = [[a], [e], [c, b, d]] ;
% G = [[a], [e], [c, d, b]] ;
% G = [[a], [e], [d, b, c]] ;
% G = [[a], [e], [d, c, b]] ;
% G = [[a], [b], [c, d, e]] ;
% G = [[a], [b], [c, e, d]] ;
% G = [[a], [b], [d, c, e]] ;
% G = [[a], [b], [d, e, c]] ;
% G = [[a], [b], [e, c, d]] ;
% G = [[a], [b], [e, d, c]] ;
% G = [[a], [c], [b, d, e]] ;
% G = [[a], [c], [b, e, d]] ;
% G = [[a], [c], [d, b, e]] ;
% G = [[a], [c], [d, e, b]] ;
% G = [[a], [c], [e, b, d]] ;
% G = [[a], [c], [e, d, b]] ;
% G = [[a], [d], [b, c, e]] ;
% G = [[a], [d], [b, e, c]] ;
% G = [[a], [d], [c, b, e]] ;
% G = [[a], [d], [c, e, b]] ;
% G = [[a], [d], [e, b, c]] ;
% G = [[a], [d], [e, c, b]] ;
% G = [[a], [e], [b, c, d]] ;
% G = [[a], [e], [b, d, c]] ;
% G = [[a], [e], [c, b, d]] ;
% G = [[a], [e], [c, d, b]] ;
% G = [[a], [e], [d, b, c]] ;
% G = [[a], [e], [d, c, b]] ;
% G = [[b], [a], [c, d, e]] ;
% G = [[b], [a], [c, e, d]] ;
% G = [[b], [a], [d, c, e]] ;
% G = [[b], [a], [d, e, c]] ;
% G = [[b], [a], [e, c, d]] ;
% G = [[b], [a], [e, d, c]] ;
% G = [[b], [c], [a, d, e]] ;
% G = [[b], [c], [a, e, d]] ;
% G = [[b], [c], [d, a, e]] ;
% G = [[b], [c], [d, e, a]] ;
% G = [[b], [c], [e, a, d]] ;
% G = [[b], [c], [e, d, a]] ;
% G = [[b], [d], [a, c, e]] ;
% G = [[b], [d], [a, e, c]] ;
% G = [[b], [d], [c, a, e]] ;
% G = [[b], [d], [c, e, a]] ;
% G = [[b], [d], [e, a, c]] ;
% G = [[b], [d], [e, c, a]] ;
% G = [[b], [e], [a, c, d]] ;
% G = [[b], [e], [a, d, c]] ;
% G = [[b], [e], [c, a, d]] ;
% G = [[b], [e], [c, d, a]] ;
% G = [[b], [e], [d, a, c]] ;
% G = [[b], [e], [d, c, a]] ;
% G = [[c], [a], [b, d, e]] ;
% G = [[c], [a], [b, e, d]] ;
% G = [[c], [a], [d, b, e]] ;
% G = [[c], [a], [d, e, b]] ;
% G = [[c], [a], [e, b, d]] ;
% G = [[c], [a], [e, d, b]] ;
% G = [[c], [b], [a, d, e]] ;
% G = [[c], [b], [a, e, d]] ;
% G = [[c], [b], [d, a, e]] ;
% G = [[c], [b], [d, e, a]] ;
% G = [[c], [b], [e, a, d]] ;
% G = [[c], [b], [e, d, a]] ;
% G = [[c], [d], [a, b, e]] ;
% G = [[c], [d], [a, e, b]] ;
% G = [[c], [d], [b, a, e]] ;
% G = [[c], [d], [b, e, a]] ;
% G = [[c], [d], [e, a, b]] ;
% G = [[c], [d], [e, b, a]] ;
% G = [[c], [e], [a, b, d]] ;
% G = [[c], [e], [a, d, b]] ;
% G = [[c], [e], [b, a, d]] ;
% G = [[c], [e], [b, d, a]] ;
% G = [[c], [e], [d, a, b]] ;
% G = [[c], [e], [d, b, a]] ;
% G = [[d], [a], [b, c, e]] ;
% G = [[d], [a], [b, e, c]] ;
% G = [[d], [a], [c, b, e]] ;
% G = [[d], [a], [c, e, b]] ;
% G = [[d], [a], [e, b, c]] ;
% G = [[d], [a], [e, c, b]] ;
% G = [[d], [b], [a, c, e]] ;
% G = [[d], [b], [a, e, c]] ;
% G = [[d], [b], [c, a, e]] ;
% G = [[d], [b], [c, e, a]] ;
% G = [[d], [b], [e, a, c]] ;
% G = [[d], [b], [e, c, a]] ;
% G = [[d], [c], [a, b, e]] ;
% G = [[d], [c], [a, e, b]] ;
% G = [[d], [c], [b, a, e]] ;
% G = [[d], [c], [b, e, a]] ;
% G = [[d], [c], [e, a, b]] ;
% G = [[d], [c], [e, b, a]] ;
% G = [[d], [e], [a, b, c]] ;
% G = [[d], [e], [a, c, b]] ;
% G = [[d], [e], [b, a, c]] ;
% G = [[d], [e], [b, c, a]] ;
% G = [[d], [e], [c, a, b]] ;
% G = [[d], [e], [c, b, a]] ;
% G = [[e], [a], [b, c, d]] ;
% G = [[e], [a], [b, d, c]] ;
% G = [[e], [a], [c, b, d]] ;
% G = [[e], [a], [c, d, b]] ;
% G = [[e], [a], [d, b, c]] ;
% G = [[e], [a], [d, c, b]] ;
% G = [[e], [b], [a, c, d]] ;
% G = [[e], [b], [a, d, c]] ;
% G = [[e], [b], [c, a, d]] ;
% G = [[e], [b], [c, d, a]] ;
% G = [[e], [b], [d, a, c]] ;
% G = [[e], [b], [d, c, a]] ;
% G = [[e], [c], [a, b, d]] ;
% G = [[e], [c], [a, d, b]] ;
% G = [[e], [c], [b, a, d]] ;
% G = [[e], [c], [b, d, a]] ;
% G = [[e], [c], [d, a, b]] ;
% G = [[e], [c], [d, b, a]] ;
% G = [[e], [d], [a, b, c]] ;
% G = [[e], [d], [a, c, b]] ;
% G = [[e], [d], [b, a, c]] ;
% G = [[e], [d], [b, c, a]] ;
% G = [[e], [d], [c, a, b]] ;
% G = [[e], [d], [c, b, a]] ;
% false.
%