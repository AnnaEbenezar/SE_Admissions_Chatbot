:- discontiguous ask/1.
:- discontiguous rule_ai_subjects/2.
:- discontiguous subject/3.
:- discontiguous rule_response/2.
:- discontiguous acquire_subject/1.
:- discontiguous acquire_what/1.


rule_response(acquire_what(se), Return) :- findall(X, what_se(X), Return).

rule_response(acquire_why(se), Return) :- findall(X, reason(X), Return).

rule_response(acquire_location(kmitl), Return) :- findall(X, location(X) , Return).

rule_response(acquire_process(admission), Return) :- findall(X, admission_doc(X), Return).

rule_response(acquire_validity(test), Return) :- findall(X, admission_test(_, X, _, _, _), Return).

rule_response(acquire_jobs(se), Return) :- findall(X, career(X), Return).

rule_response(acquire_test(eng), Return) :- findall(X, english_test(_, X, _, _), Return).

rule_response(acquire_what(syllabus), Return) :- findall([X, Y], subject(X, Y, require), Return).

rule_response(acquire_subject(ai), Return) :- findall(X, subject(X, _, 'Artificial Intelligence'), Return).

rule_response(acquire_subject(iot), Return) :- findall(X, subject(X, _, 'Industrial IoT'), Return).

rule_response(acquire_subject(metaverse), Return) :- findall(X, subject(X, _, 'Metaverse'), Return).

rule_response(quit, Return) :- Return = ['Good bye'].

rule_response(unknown, Return) :- Return = ['Sorry, I don\'t understand you'].

% Facts 
%valid intent
acquire_what(se).
acquire_why(se).
acquire_location(kmitl).
acquire_process(admission).
acquire_validity(test).
acquire_jobs(se).
acquire_test(eng).
acquire_what(syllabus).
acquire_subject(ai).
acquire_subject(iot).
acquire_subject(metaverse).

what_se('Software engineering (SE) is an engineering discipline concerning all aspects of software production, including software analysis, design, development, testing, and deployment.').

reason('High Demand of Software Engineers').
reason('To apply ubiquitous software').
reason('To develop real-world software applications').
reason('To be efficient in software development').

subject('Introduction to Calculus', year(1, 1), require).
subject('Circuits and Electronics', year(1, 1), require).
subject('Elementary Systems Programming', year(1, 1), require).
subject('Computer Programming', year(1, 1), require).
subject('Intercultural Communication skills in English 1', year(1, 1), require).
subject('Introduction to Logic', year(1, 1), require).

subject('Differential Equation', year(1, 2), require).
subject('Discrete Mathematics', year(1, 2), require).
subject('Digital System Fundamentals', year(1, 2), require).
subject('Object-Oriented Programming', year(1, 2), require).
subject('General Education Course', year(1, 2), require).
subject('Intercultural Communication skills in English2', year(1, 2), require).

subject('Probability Models and Data Analysis', year(2, 1), require).
subject('Computer Architecture and ORgnaization', year(2, 1), require).
subject('Data Structures and Algorithms', year(2, 1), require).
subject('Web Programming', year(2, 1), require).
subject('Digital Citizen', year(2, 1), require).
subject('Language and Communication Course', year(2, 1), require).

subject('Linear Algebra', year(2, 2), require).
subject('Computer Networks', year(2, 2), require).
subject('Algorithm Design and Analysis', year(2, 2), require).
subject('Software Engineering Principles', year(2, 2), require).
subject('Database Systems', year(2, 2), require).
subject('Seminar in Software Engineering', year(2, 2), require).
subject('Philosophy of Science', year(2, 2), require).

subject('Operating Systems', year(3, 1), require).
subject('Theory of Computation', year(3, 1), require).
subject('Software Design and Architecture', year(3, 1), require).
subject('Artificial Intelligence', year(3, 1), require).
subject('Computer Graphics and Mixed Reality', year(3, 1), 'Metaverse').
subject('Web Service Development and Service-Oriented Architecture', year(3, 1), 'Metaverse').
subject('Web Service Development and Service-Oriented Architecture', year(3, 1), 'Industrial IoT').
subject('Real-Time Embedded System Design and Development', year(3, 1), 'Industrial IoT').
subject('AI Programming', year(3, 1), 'Artificial Intelligence').
subject('Machine Learning', year(3, 1), 'Artificial Intelligence').
subject('Data Science and Data Analytics', year(3, 1), 'Artificial Intelligence').

subject('Compiler Construction', year(3, 2), require).
subject('Software Development Process and Project Management', year(3, 2), require).
subject('User Experience and User Interface Design', year(3, 2), require).
subject('Distributed Computing', year(3, 2), 'Metaverse').
subject('Advanced Database Systems', year(3, 2), 'Metaverse').
subject('Industrial IoT Networks and Communications', year(3, 2), 'Industrial IoT').
subject('Cyber-Physical Systems and Industry 4.0', year(3, 2), 'Industrial IoT').
subject('Knowledge Representation and Reasoning', year(3, 2), 'Artificial Intelligence').
subject('Deep Learning', year(3, 2), 'Artificial Intelligence').
subject('Team Software Project', year(3, 2), require).

subject('Free Elective', year(4, 1), require).
subject('Information and Computer Security', year(4, 1), require).
suject('Major Elective', year(4, 1), require).
subject('Software Engineering Project 1', year(4, 1), require).

subject('Free Elective', year(4, 2), require).
subject('Software Verification and Validation', year(4, 2), require).
subject('Software Engineering Project 2', year(4, 2), require).
subject('Professional Skills and Issues', year(4, 2), require).

admission_test('sat', 'SAT', 'Scholastic Assessment Test', '1020', '600').
admission_test('act', 'ACT', 'American College Testing', '19', '23').
admission_test('ib', 'IB', 'International Baccalaureate', '29', '5').
admission_test('ged', 'GED', 'General Educational Development', 'pass', 'pass').

english_test('ielts', 'IELTS', 'International English Language Testing System', '6').
english_test('toefl', 'TOEFL', 'Test of English as a Foreign Language', '550').
english_test('kmitl tep', 'KMITL TEP', 'KMITL Test of English Proficiency', 'B2').

admission_doc('Application form').
admission_doc('Photocopy of national id card or passport').
admission_doc('Academic records documents').
admission_doc('English Proficiency').
admission_doc('Reccommendation letters').
admission_doc('Personal Statement').
admission_doc('Portfolio').

career('Software Engineers').
career('SOftware Developers').
career('Software Architects').
career('Analysts and Designers of IT systems').
career('Software Entrepreneurs').
career('IT Consultants').
career('Data Engineers').
career('or Further pursue at postgraduate or doctorate level').

location('1 Chalong Krung 1 Alley, Lat Krabang, Bangkok 10520, Thailand.').