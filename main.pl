% main.pl
:- consult('process_input.pl').
:- consult('intent_rule.pl').
:- consult('process_question.pl').

chat :-
    write('Welcome to SE chatbot'), nl,
    chat_loop.

chat_loop :-
    write('How can I assist you today?'), nl,
    read_line_to_string(user_input, UserInput),
    process(UserInput),
    (UserInput \= 'bye' -> chat_loop; write('Goodbye'), nl).

process(Statement) :-
    process_user_input(Statement, Terms),
    rule_intent(Terms, Intent, Group),
    rule_response(Group, Return),
    print_list(Return), nl.

print_list([]).
print_list([H|T]) :-
    write('- '), write(H), nl,
    print_list(T).