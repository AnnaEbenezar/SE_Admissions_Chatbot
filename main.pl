% main.pl
:- consult('process_input.pl').
:- consult('intent_rule.pl').
:- consult('process_question.pl').

chat :-
    write('Welcome to SE chatbot'), nl,
    repeat,
    read_line_to_string(user_input, UserInput),
    process_user_input(UserInput, Terms),
    rule_intent(Terms, Intent, Group),
    write(Intent),nl,
    write(Group),nl,
    rule_response(Group, Return),
    write(Return), nl.

