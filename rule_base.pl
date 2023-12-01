% rule_base.pl

% Define rules for various intents
rule(inquire_requirements, [user_asks(What), admission_requirements(Requirements)]) :-
    % ...

rule(check_application_status, [user_asks(What), application_status(Status)]) :-
    % ...
