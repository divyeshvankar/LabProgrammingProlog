# NAME :  VANKAR DIVYESH KUMAR
# ROLL NUMBER :  210101108

### I have define node as node(data, left node, right node). for leaf node left and right node is nil.

## How to run the programm ?

~
  swipl bst_check.pl

  ?- is_bst(node(2,node(1,nil,nil),node(1,nil,nil))).
  <!-- This query return true as it is valid BST -->
  ?- is_bst(node(2.5,node(1.7,nil,nil),node(-3.5,nil,nil))).
  <!-- This query return false as it is not valid BST -->
~


### This is work for decimal and negative number too.
### Considered case of leaf node, single node, only left tree.
## Code has also helper function to which checking is_subtree depending on smaller and greater.
