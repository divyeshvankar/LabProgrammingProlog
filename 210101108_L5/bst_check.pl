% Binary tree representation
% empty tree
binary_tree(nil).
% tree with a root value and left and right subtrees
binary_tree(node(Value, Left, Right)) :-
    binary_tree(Left),
    binary_tree(Right).

% is_bst/1 predicate
is_bst(Tree) :-
    is_bst(Tree, -inf, inf).

% Helper predicate for is_bst/1
is_bst(nil, _, _).
is_bst(node(Value, Left, Right), Min, Max) :-
    Value > Min,
    Value < Max,
    is_subtree_less(Left, Value),
    is_subtree_greater(Right, Value),
    is_bst(Left, Min, Value),
    is_bst(Right, Value, Max).

% is_subtree_less/2 predicate
is_subtree_less(nil, _).
is_subtree_less(node(Value, Left, Right), Max) :-
    Value < Max,
    is_subtree_less(Left, Max),
    is_subtree_less(Right, Max).

% is_subtree_greater/2 predicate
is_subtree_greater(nil, _).
is_subtree_greater(node(Value, Left, Right), Min) :-
    Value > Min,
    is_subtree_greater(Left, Min),
    is_subtree_greater(Right, Min).
