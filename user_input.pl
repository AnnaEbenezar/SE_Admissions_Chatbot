process_user_input(UserInput, Verb, Noun) :-
    downcase_atom(UserInput, LowerUserInput),
    remove_punctuation(LowerUserInput, CleanedInput),
    tokenize_sentence(CleanedInput, TokenizedInput),
    extract_verb(TokenizedInput, Verb),
    extract_noun(TokenizedInput, Noun).


remove_punctuation(Input, Cleaned) :-
    atom_string(Input, InputString),
    string_chars(InputString, CharList),
    exclude(is_punctuation, CharList, CleanedChars),
    string_chars(CleanedString, CleanedChars),
    atom_string(Cleaned, CleanedString).

tokenize_sentence(Input, TokenList) :-
    atomic_list_concat(TokenList, ' ', Input).

is_punctuation(Char) :-
    member(Char, ['.', ',', '!', '?', ';', ':', '-', '"', '\'']).
is_verb(Word) :-
    member(Word, ['know', 'apply', 'study', 'work', 'specialized', 'provide', 'enroll', 'tell', 'learn']).
is_noun(Word) :-
    member(Word, ['software', 'admission', 'requirement', 'curriculum', 'syllabus', 'track', 'program', 'exchange', 'dual', 'degree']).

extract_verb([], '').  
extract_verb([Token | Rest], Verb) :-
    (is_verb(Token) ->
        Verb = Token
    ;
        extract_verb(Rest, Verb)
    ).

extract_noun([], ''). 
extract_noun([Token | Rest], Noun) :-
    ((is_noun(Token)) ->
        Noun = Token
    ;
        extract_noun(Rest, Noun)
    ).



