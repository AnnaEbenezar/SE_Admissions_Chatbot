%[ask(what), noun(se)] -> what is software engineering
%[ask(where), noun(kmitl)] -> a location
%[ask(why), noun(se)] -> why enroll in software engineering
%[ask(what), noun(jobs)] -> jobs after graduation
------
%[ask(what), noun(admission)] -> generate all documents
%[ask(what), noun(tests)] -> all the accepted test

%[ask(score), noun(ielts)].... (all the test) -> tell mimimum score
%[ask(what), noun(syllabus)] -> generate all the require subject
%[ask(what), noun(track)] -> generate subject for all tracks
%[ask(what), noun(ai)] -> generate subject for ai
%[ask(what), noun(iot)] -> generate subject for iot
%[ask(what), noun(metaverse)] -> generate subject for metaverse

%[ask(unknown), noun(unknown)] -> we don't have info, i'm not the question


precess_intent(Intent, Return) :-
    



% Facts 
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
admission_test('ielts', 'IELTS', 'International English Language Testing System', '6', _).
admission_test('toefl', 'TOEFL', 'Test of English as a Foreign Language', '550', _).
admission_test('kmitl tep', 'KMITL TEP', 'KMITL Test of English Proficiency', 'B2', _).
admission_test('ged', 'GED', 'General Educational Development', 'pass', _).

admission_doc('Application form').
admission_doc('Photocopy of national id card or passport').
admission_doc('Academic records documents').
admission_doc('English Proficiency').
admission_doc('Reccommendation letters').
admission_doc('Personal Statement').
admission_doc('Portfolio').