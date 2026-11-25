:- dynamic known/3.
:- dynamic main_problem/2.

ask(X, Symptom) :-
    known(X, Symptom, Ans), !,
    Ans == yes.
ask(X, Symptom) :-
    write('Does '), write(X), write(' have '), write(Symptom), write('? (yes/no): '),
    read(Ans),
    assertz(known(X, Symptom, Ans)),
    Ans == yes.

has_symptom(X, Symptom) :- ask(X, Symptom).

eye_condition(X, conjunctivitis) :-
    main_problem(X, redness),
    has_symptom(X, itching),
    has_symptom(X, discharge),
    has_symptom(X, watery_eyes).

eye_condition(X, dry_eye_syndrome) :-
    main_problem(X, dryness),
    has_symptom(X, gritty_sensation),
    has_symptom(X, blurred_vision),
    has_symptom(X, burning_sensation).

eye_condition(X, myopia) :-
    main_problem(X, blurry_distance),
    has_symptom(X, squinting),
    has_symptom(X, eye_strain),
    has_symptom(X, distant_headache).

eye_condition(X, glaucoma) :-
    main_problem(X, severe_pain),
    has_symptom(X, headache),
    has_symptom(X, halos_around_lights),
    has_symptom(X, tunnel_vision).

eye_condition(X, cataract) :-
    main_problem(X, cloudy_vision),
    has_symptom(X, faded_colors),
    has_symptom(X, glare_sensitivity),
    has_symptom(X, poor_night_vision).

eye_condition(X, hyperopia) :-
    main_problem(X, blurry_near_vision),
    has_symptom(X, reading_fatigue),
    has_symptom(X, achy_eyes),
    has_symptom(X, brow_ache).

eye_condition(X, astigmatism) :-
    main_problem(X, distorted_vision),
    has_symptom(X, double_vision),
    has_symptom(X, night_glare),
    has_symptom(X, frequent_squinting).

eye_condition(X, presbyopia) :-
    main_problem(X, trouble_reading_small_print),
    has_symptom(X, holding_book_far),
    has_symptom(X, eyestrain_after_reading),
    has_symptom(X, need_brighter_light).

eye_condition(X, blepharitis) :-
    main_problem(X, swollen_eyelids),
    has_symptom(X, crusty_eyelashes),
    has_symptom(X, flaky_eyelid_skin),
    has_symptom(X, light_sensitivity).

eye_condition(X, stye) :-
    main_problem(X, eyelid_lump),
    has_symptom(X, localized_tenderness),
    has_symptom(X, eyelid_redness),
    has_symptom(X, tearing).

eye_condition(X, macular_degeneration) :-
    main_problem(X, central_blurriness),
    has_symptom(X, straight_lines_wavy),
    has_symptom(X, dark_central_spot),
    has_symptom(X, difficulty_recognizing_faces).

eye_condition(X, retinal_detachment) :-
    main_problem(X, sudden_floaters),
    has_symptom(X, flashes_of_light),
    has_symptom(X, shadow_in_vision),
    has_symptom(X, sudden_vision_drop).

write_clean(Atom) :-
    atomic_list_concat(Parts, '_', Atom),
    atomic_list_concat(Parts, ' ', Clean),
    write(Clean).

start :-
    retractall(known(_, _, _)),
    retractall(main_problem(_, _)),
    write('Enter patient name: '),
    read(Name),
    write('Available main eye problems: redness, dryness, blurry_distance, severe_pain, cloudy_vision, blurry_near_vision, distorted_vision, trouble_reading_small_print, swollen_eyelids, eyelid_lump, central_blurriness, sudden_floaters'), nl,
    write('Enter your main eye problem: '),
    read(Problem),
    assertz(main_problem(Name, Problem)),
    ( eye_condition(Name, Condition) ->
        write('Possible eye condition for '), write(Name), write(': '),
        write_clean(Condition), nl
    ;
        write('No matching eye condition found for '), write(Name), write('.'), nl
    ).
