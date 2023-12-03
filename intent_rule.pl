
%identify intent rule, we priorities the rule from top to bottom
%rule 1: if there are wh-question in the text user input, then find the nearest noun and generate the intent
%rule 2: if there no wh-question, we going to detect the verb, and the nearest noun the that verb and generate intent
%rule 3: check whether word after nearest noun is preposition, if so, we will find the nearest noun again, and replace noun in intent to that noun

%rule 1 (+ 3)
rule_intent(Terms, Intent, GroupIntent) :-
    write('Rule1'), nl,
    member(question(Q), Terms),
    find_nearest_noun(Terms, NearestNoun, question(Q)),
    check_noun(Terms, NearestNoun, ReplacedNoun),
    Intent = [ask(Q), ReplacedNoun], 
    get_group(ReplacedNoun, GroupIntent). 

%rule 2(+3)
rule_intent(Terms, Intent, GroupIntent) :- 
    write('Rule2'), nl,
    member(verb(V), Terms),
    find_nearest_noun(Terms, NearestNoun, verb(V)),
    check_noun(Terms, NearestNoun, ReplacedNoun),
    Intent = [ask(V), ReplacedNoun],  
    get_group(ReplacedNoun, GroupIntent).

rule_intent(_, _, _) :-
    write('base'), nl.


get_group(ReplacedNoun, GroupIntent) :-
    get_inside_parentheses(ReplacedNoun, NounNew),
    synonym_map(V, VerbMap),
    synonym_map(NounNew, NounMap),
    intent_rule([ask(VerbMap), noun(NounMap)], GroupIntent).


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
    
%group intent
intent_rule([ask(what), noun(se)], acquire_what(se)).
intent_rule([ask(why), noun(se)], acquire_why(se)).
intent_rule(_, noun(jobs), acquire_jobs(se)).
intent_rule([ask(where), noun(kmitl)], acquire_location(kmitl)).

intent_rule([_, noun(admission)], acquire_process(admission)).
intent_rule([ask(apply), _], acquire_process(admission)).
intent_rule([ask(valid), _], acquire_validity(test_name)).

intent_rule([_, noun(syllabus)], acquire_what(syllabus)).
intent_rule([ask(study), _], acquire_what(syllabus)).
intent_rule([_, noun(track)], acquire_subject(all_track)).
intent_rule([_, noun(ai)], acquire_subject(ai)).
intent_rule([_, noun(iot)], acquire_subject(iot)).
intent_rule([_, noun(metaverse)], acquire_subject(metaverse)).

synonym_map(software, se).
synonym_map(program, se).
synonym_map(engineering, se).

synonym_map(university, kmitl).
synonym_map(uni, kmitl).

synonym_map(career, jobs).
synonym_map(work, jobs).
synonym_map(occupation, jobs).

synonym_map(enrollment, admission).
synonym_map(application, admission).
synonym_map(acceptance, admission).
synonym_map(entrance, admission).
synonym_map(entry, admission).

synonym_map(score, tests).
synonym_map(stardardized, tests).

synonym_map(curriculum, syllabus).
synonym_map(lecture, syllabus).
synonym_map(class, syllabus).
synonym_map(subjects, syllabus).
synonym_map(subject, syllabus).

synonym_map(know, what).
synonym_map(provide, what).
synonym_map(tell, what).

synonym_map(X, X).