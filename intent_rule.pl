:- consult('process_input.pl').

%identify intent rule, we priorities the rule from top to bottom
%rule 1: if there are wh-question in the text user input, then find the nearest noun and generate the intent
%rule 2: if there no wh-question, we going to detect the verb, and the nearest noun the that verb and generate intent
%rule 3: check whether word after nearest noun is preposition, if so, we will find the nearest noun again, and replace noun in intent to that noun

%rule 1 (+ 3)
rule(Terms, Intent) :-
    member(question(Q), Terms),
    find_nearest_noun(Terms, NearestNoun, question(Q)),
    check_noun(Terms, NearestNoun, ReplacedNoun),
    Intent = [ask(Q), ReplacedNoun], !.

%rule 2 (+ 3)
rule(Terms, Intent) :-
    member(verb(V), Terms),
    find_nearest_noun(Terms, NearestNoun, verb(V)),
    check_noun(Terms, NearestNoun, ReplacedNoun),
    Intent = [ask(V), ReplacedNoun], !.
%base case
rule(_, [ask(unknown), noun(unknown)]).

%helper function
find_nearest_noun(Terms, noun(Noun), X) :-
    append(_, [X | Rest], Terms),  
    find_nearest_noun_from_target(Rest, Noun).
        
find_nearest_noun_from_target([noun(Noun) | _], Noun).
find_nearest_noun_from_target([_ | Rest], Noun) :-
    find_nearest_noun_from_target(Rest, Noun).

check_noun(Terms, Noun, ReplacedNoun) :-
    append(_, [Noun | Rest], Terms),
    Rest = [FollowingWord | _],
    (get_inside_parentheses(FollowingWord, Inside)),
    (preposition(Inside)),
    find_nearest_noun(Rest, ReplacedNoun, FollowingWord);
    ReplacedNoun = Noun.

get_inside_parentheses(Term, Inside) :-
    Term =.. [Functor, Inside],
    Inside \= (_, _). 