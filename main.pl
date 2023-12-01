% main.pl

:- consult('user_input.pl').
:- consult('rule_base.pl').
:- consult('rule_interpreter.pl').
:- consult('admissions_chatbot.pl').

main :-
    write('Welcome to the Admissions Chatbot!'), nl,
    chatbot_loop.

chatbot_loop :-
    repeat,
    write('> '),
    read_line_to_string(user_input),
    process_user_input(user_input),
    user_input(end), !.
