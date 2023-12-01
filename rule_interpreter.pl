% rule_interpreter.pl

prove(true).

prove(A or B) :- !, (prove(A) ; prove(B)).
prove(A and B) :- !, prove(A), prove(B).

% Add other predicates for rule interpretation
