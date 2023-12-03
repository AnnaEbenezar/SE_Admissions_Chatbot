process_user_input(UserInput, Terms) :-
    downcase_atom(UserInput, LowerUserInput),
    remove_punctuation(LowerUserInput, CleanedInput),
    tokenize_sentence(CleanedInput, TokenizedInput),
    extract_terms(TokenizedInput, Terms).

remove_punctuation(Input, Cleaned) :-
    atom_string(Input, InputString),
    string_chars(InputString, CharList),
    exclude(is_punctuation, CharList, CleanedChars),
    string_chars(CleanedString, CleanedChars),
    atom_string(Cleaned, CleanedString).

is_punctuation(Char) :-
    member(Char, ['.', ',', '!', '?', ';', ':', '-', '"', '\'']).

tokenize_sentence(Input, TokenList) :-
    atomic_list_concat(TokenList, ' ', Input).

extract_terms([], []).
extract_terms([Token | Rest], [Term | RestTerms]) :-
    (is_question(Token) ->
        Term = question(Token)
    ;
    is_article(Token) ->
        Term = article(Token)
    ;
    is_subject(Token) ->
        Term = subject(Token)
    ;
    is_verb(Token) ->
        Term = verb(Token)
    ;
    is_noun(Token) ->
        Term = noun(Token)
    ;
    is_preposition(Token) ->
        Term = preposition(Token)
    ;
    Term = unknown(Token)
    ),
    extract_terms(Rest, RestTerms).


is_subject(Token) :-
    subject(Token).
is_verb(Token) :-
    verb(Token).
is_noun(Token) :-
    noun(Token).
is_question(Token) :-
    question(Token).
is_article(Token) :-
    article(Token).
is_preposition(Token):-
    preposition(Token).

question('what').
question('where').
question('when').
question('why').
question('how').
question('who').
question('whose').

subject('i').
subject('you').
subject('we').
subject('they').
subject('he').
subject('she').
subject('it').
subject('student').
subject('lecturer').

article('a').
article('an').
article('the').

preposition('to').
preposition('from').
preposition('in').
preposition('on').
preposition('with').
preposition('of').
preposition('about').
preposition('related').

conjunction('and').
conjunction('or').
conjunction('but').

determiner('this').
determiner('that').
determiner('these').
determiner('those').

verb('know').
verb('knows').
verb('apply').
verb('applied').
verb('studied').
verb('study').
verb('work').
verb('specialize').
verb('specialized').
verb('provides').
verb('enroll').
verb('tell').
verb('prepare').
verb('register').
verb('want').
verb('provide').
verb('would').
verb('like').
verb('valid').

noun('software').
noun('engineering').
noun('se').
noun('admission').
noun('requirement').
noun('curriculum').
noun('syllabus').
noun('track').
noun('program').
noun('exchange').
noun('degree').
noun('documents').
noun('registration').
noun('application').
noun('enrollment').
noun('career').
noun('jobs').
noun('details').
noun('information').
noun('info').
noun('process').
noun('procedure').
noun('ai').
noun('iot').
noun('metaverse').
noun('sat').
noun('act').
noun('ib').
noun('ged').
noun('ielts').
noun('toefl').
noun('eng').
noun('tests').
noun('test').
noun('english').