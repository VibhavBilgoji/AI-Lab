% ============================================================
% Experiment 11 - Task 4
% To identify possible eye conditions based on reported symptoms.
% ============================================================

% Reported eye symptoms
reports_eye_symptom('Sparsh', redness).
reports_eye_symptom('Sparsh', itching).
reports_eye_symptom('Sparsh', discharge).

reports_eye_symptom('Walsh', dryness).
reports_eye_symptom('Walsh', gritty_sensation).
reports_eye_symptom('Walsh', blurred_vision).

reports_eye_symptom('Shubham', blurred_distant_vision).
reports_eye_symptom('Shubham', squinting).
reports_eye_symptom('Shubham', eye_strain).

reports_eye_symptom('Vibhav', cloudy_vision).
reports_eye_symptom('Vibhav', halos_around_lights).

reports_eye_symptom('Vibhu', severe_eye_pain).
reports_eye_symptom('Vibhu', headache).
reports_eye_symptom('Vibhu', halos_around_lights).

% Supporting fact
is_above_60('Vibhav').

% Eye condition identification rules
eye_condition(X, conjunctivitis) :-
    reports_eye_symptom(X, redness),
    reports_eye_symptom(X, itching),
    reports_eye_symptom(X, discharge).

eye_condition(X, dry_eye_syndrome) :-
    reports_eye_symptom(X, dryness),
    reports_eye_symptom(X, gritty_sensation).

eye_condition(X, myopia) :-
    reports_eye_symptom(X, blurred_distant_vision),
    reports_eye_symptom(X, squinting).

eye_condition(X, cataract) :-
    reports_eye_symptom(X, cloudy_vision),
    reports_eye_symptom(X, halos_around_lights),
    is_above_60(X).

eye_condition(X, glaucoma) :-
    reports_eye_symptom(X, severe_eye_pain),
    reports_eye_symptom(X, headache),
    reports_eye_symptom(X, halos_around_lights).

% Derived rules
needs_urgent_care(X) :-
    eye_condition(X, glaucoma).

should_see_eye_specialist(X) :-
    eye_condition(X, _).

% Sample queries:
% ?- eye_condition('Sparsh', C).             % what does 'Sparsh' have
% ?- eye_condition(X, myopia).           % who shows myopia symptoms
% ?- eye_condition(X, C).                % conditions for every patient
% ?- needs_urgent_care(X).               % emergencies
% ?- should_see_eye_specialist(X).
