:- use_module(library(jpl)).

help :- write("To start the expert system please type 'start.' and press Enter key").

start :-
        sleep(0.4),
        write("## Welcome To Medical Diagnosis System ##"),nl,
        sleep(0.4),
        nl,

        gui2.




% Rules
%The symptoms that we have identified their verification
symptom(Patient,chills) :- verify(Patient," have a chills (y/n) ?").

symptom(Patient,vomiting) :- verify(Patient," have a vomiting (y/n) ?").

symptom(Patient,cough) :- verify(Patient," have a cough (y/n) ?").

symptom(Patient,high_fever) :- verify(Patient," have a high fever (y/n) ?").

symptom(Patient,sweating) :- verify(Patient," have a sweating (y/n) ?").

symptom(Patient,fast_heart_rate) :- verify(Patient," have a fast heart rate (y/n) ?").

symptom(Patient,depression) :- verify(Patient," have a depression (y/n) ?").

symptom(Patient,mucoid_sputum) :- verify(Patient," have a mucoid sputum (y/n) ?").

symptom(Patient,anxiety) :- verify(Patient," have a anxiety (y/n) ?").

symptom(Patient,fatigue) :- verify(Patient," have a fatigue (y/n) ?").

symptom(Patient,breathlessness) :- verify(Patient," have a breathlessness (y/n) ?").

symptom(Patient,sore_throat) :- verify(Patient," have a sore_throat (y/n) ?").

symptom(Patient,peripheral_edema) :- verify(Patient," have a peripheral edema (y/n) ?").

symptom(Patient,sharp_abdominal_pain) :- verify(Patient," have a sharp abdominal pain(y/n) ?").

symptom(Patient,headache) :- verify(Patient," have a headache (y/n) ?").

symptom(Patient,indigestion) :- verify(Patient," have a indigestion (y/n) ?").

symptom(Patient,continuous_sneezing) :- verify(Patient," have a continuous sneezing (y/n) ?").

symptom(Patient,body_ache) :- verify(Patient," have a body ache (y/n) ?").

%Rules
%Diagnosis of the disease according to the symptoms
hypothesis(Patient,flu) :-
        symptom(Patient,high_fever),
        symptom(Patient,headache),
        symptom(Patient,body_ache),
        symptom(Patient,chills),
        symptom(Patient,sore_throat),
        symptom(Patient,cough).


hypothesis(Patient,common_cold) :-
        symptom(Patient,continuous_sneezing),
        symptom(Patient,chills),
        symptom(Patient,fatigue),
        symptom(Patient,cough),
        symptom(Patient,headache),
        symptom(Patient,sore_throat).

hypothesis(Patient,diabetes) :-
        symptom(Patient,body_ache),
        symptom(Patient,fatigue),
        symptom(Patient,headache),
        symptom(Patient,chills),
        symptom(Patient,sore_throat),
        symptom(Patient,cough).


hypothesis(Patient,tuberculosis) :-
        symptom(Patient,chills),
        symptom(Patient,vomiting),
        symptom(Patient,cough),
        symptom(Patient,high_fever),
	symptom(Patient,sweating),
	symptom(Patient,loss_of_appetite).

hypothesis(Patient,heart_attack) :-
        symptom(Patient,vomiting),
        symptom(Patient,breathlessness),
        symptom(Patient,sweating),
        symptom(Patient,fast_heart_rate).

hypothesis(Patient,asthma) :-
        symptom(Patient,high_fever),
        symptom(Patient,mucoid_sputum),
        symptom(Patient,fatigue),
        symptom(Patient,breathlessness),
        symptom(Patient,cough).


hypothesis(Patient,cirrhosis) :-
        symptom(Patient,fatigue),
        symptom(Patient,peripheral_edema),
        symptom(Patient,breathlessness),
        symptom(Patient,sharp_abdominal_pain).



hypothesis(Patient,pneumonia) :-
        symptom(Patient,chills),
        symptom(Patient,cough),
        symptom(Patient,high_fever),
	symptom(Patient,fatigue).

hypothesis(Patient,panic_disorder) :-
        symptom(Patient,breathlessness),
        symptom(Patient,depression),
        symptom(Patient,anxiety).

hypothesis(Patient,migraine) :-
        symptom(Patient,headache),
        symptom(Patient,indigestion).




hypothesis(_,"disease. But I'm Sorry, I don't seem to be able to diagnose the disease").

%FACTS
%Description about the disease
description(flu, 'Flu is a contagious respiratory illness caused by influenza viruses that infect the nose, throat, and sometimes the lungs. It can cause mild to severe illness, and at times can lead to death. ') .
description(common_cold,'The common cold is a upper respiratory tract. It is usually harmless, although it might not feel that way. Many types of viruses can cause a common cold.').
description(diabetes,'Diabetes is a lifelong condition that causes a persons blood sugar level to become too high.').
description(tuberculosis,'Tuberculosis is a bacterial infection spread through inhaling tiny droplets from the coughs or sneezes of an infected person.').
description(heart_attack,'A heart attack is a serious medical emergency in which the supply of blood to the heart is suddenly blocked, usually by a blood clot.').
description(pneumonia,'Pneumonia is swelling (inflammation) of the tissue in one or both lungs. It is usually caused by a bacterial infection or a virus.').
description(migraine,'A migraine is usually a moderate or severe headache felt as a throbbing pain on 1 side of the head.').
description(panic_disorder,'Panic disorder is an anxiety disorder where you regularly have sudden attacks of panic or fear. It is a natural response to stressful or dangerous situations').
description(cirrhosis,'Cirrhosis is a condition in which your liver is scarred and permanently damaged. Scar tissue replaces healthy liver tissue and prevents your liver from working normally.').
description(asthma,'Asthma is a disease that affects your lungs. It is one of the most common long-term diseases of children, but adults can have asthma, too.').



%Facts
%Advices based on the disease

advice(flu,'Drink plenty of water to avoid dehydration, keep warm, rest and sleep').
advice(common_cold,'Gargle salt water to soothe a sore throat, keep warm, rest and sleep').
advice(diabetes,'Be more physically active, eat healthy plant foods, see your doctor').
advice(tuberculosis,'Wash your hands after coughing or sneezing, do not visit other people, see you doctor').
advice(heart_attack,'Call ambulance, chew or swallow asprin, keep calm').
advice(pneumonia,'Rest, take medication, see your doctor').
advice(migraine,'Find a quiet, dark place to relax, reduce stress, take medication').
advice(panic_disorder,'Take medications, recognize that you are having a panic attack,close your eyes and focus on your deep breathing. ').
advice(cirrhosis,'Do not drink alcohol, eat a low-sodium diet, avoid infections').
advice(asthma,'Know your triggers and avoid them, take your asthma medication, keep fit by exercising ').





response(Reply) :-
        read(Reply),
        write(Reply),nl.

%the question pattern we have defined
ask(Patient,Question) :-
	write(Patient),write(', do you'),write(Question),
	/*read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail),*/

	gui1(', do you',Patient,Question),
    nl.

:- dynamic yes/1,no/1.


%there is the verification part
verify(P,S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
%our diagnosis part

pt(Patient):-

		hypothesis(Patient,Disease),
                description(Disease,Desc),
                advice(Disease,Advice),

                gui3(Patient,', you probably have ',Disease,'.'),
                gui3(Patient,', ',Desc,'.'),
                gui3(Patient,', ',Advice,'.'),


                       write(Patient),write(', you probably have '),write(Disease),write('.'),undo,end.

end :-
		nl,
                nl,
		sleep(0.4),
                write("## Thank you for choosing me :) ##"),nl,
                sleep(0.4),
                nl.

%this is our interface section
gui1(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['EXPERT SYSTEM'], F),
	jpl_new('javax.swing.JLabel',['MEDÝCAL DÝAGNOSÝS SYSTEM'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [250,100], _),
	jpl_call(F, setSize, [800,400], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).

gui2 :-
	jpl_new('javax.swing.JFrame', ['EXPERT SYSTEM'], F),
	jpl_new('javax.swing.JLabel',['MEDICAL DIAGNOSIS SYSTEM'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
        jpl_call(LBL, setBounds, [200,200,200,200], _),

	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [250,100], _),
	jpl_call(F, setSize, [800,400], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hello ! What is your name ? '], N),
	jpl_call(F, dispose, [], _),

	(	N == @(null)
		->	write('you cancelled'),gui3('you cancelled. ','Thank you ','for choosing ','me.'),end,fail
		;	write("Hello ! What is your name ?  : "),write(N),nl,pt(N)
	).


gui3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['EXPERT SYSTEM'], F),
	jpl_new('javax.swing.JLabel',['MEDICAL DIAGNOSIS SYSTEM '],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),

	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [250,100], _),

	jpl_call(F, setSize, [800,400], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _),

	(	N == @(void)
		->	write('')
		;	write("")
	).


