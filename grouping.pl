group(_, [], []).
group(Items, [Size|Sizes], [Group|Groups]) :-
    length(Group, Size),
    append(Group, Rest, Items),
    group(Rest, Sizes, Groups).

group_all(Items, Sizes, Groups) :-
    findall(Group, group(Items, Sizes, Group), Groups).

?- group_all([a,b,c,d,e],[1,1,3],G).
