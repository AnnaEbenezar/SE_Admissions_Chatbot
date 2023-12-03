% main.pl
:- consult('process_input.pl').
:- consult('intent_rule.pl').

chat :-
    write('Welcome to SE chatbot'), nl,
    repeat,
    read_line_to_string(user_input, UserInput),
    process_user_input(UserInput, Verb, Noun),
    rule(Verb, Noun, Return),
    %do some conversation rule
    write(Return), nl.


