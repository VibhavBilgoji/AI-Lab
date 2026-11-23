% ============================================================
% Experiment 11 - Task 1
% To recommend first-aid measures based on observed injuries.
% ============================================================

% Observed injuries
has_injury('Manthan', cut).
has_injury('Sparsh', bruise).

has_injury('Walsh', burn).

has_injury('Shubham', sprained_ankle).

has_injury('Vibhav', nosebleed).

has_injury('Rafaan', fracture).

has_injury('Omkar', choking).

has_injury('Vibhu', snake_bite).

% First-aid recommendation rules
first_aid(X, wash_with_running_water_and_apply_antiseptic) :-
    has_injury(X, cut).

first_aid(X, cover_with_a_clean_bandage) :-
    has_injury(X, cut).

first_aid(X, apply_ice_pack_wrapped_in_a_cloth) :-
    has_injury(X, bruise).

first_aid(X, cool_under_running_water_for_10_minutes) :-
    has_injury(X, burn).

first_aid(X, never_apply_toothpaste_or_ice_directly) :-
    has_injury(X, burn).

first_aid(X, rest_ice_compression_and_elevation) :-
    has_injury(X, sprained_ankle).

first_aid(X, sit_down_and_lean_slightly_forward) :-
    has_injury(X, nosebleed).

first_aid(X, pinch_the_soft_part_of_the_nose_for_10_minutes) :-
    has_injury(X, nosebleed).

first_aid(X, immobilise_the_limb_and_reach_a_hospital) :-
    has_injury(X, fracture).

first_aid(X, encourage_coughing_and_never_slap_the_back) :-
    has_injury(X, choking).

first_aid(X, keep_calm_and_keep_bitten_limb_below_heart_level) :-
    has_injury(X, snake_bite).

% Derived rule: injuries that must always be taken to a doctor
needs_doctor(X) :-
    has_injury(X, fracture).

needs_doctor(X) :-
    has_injury(X, snake_bite).

needs_doctor(X) :-
    has_injury(X, choking).

% Sample queries:
% ?- first_aid('Sparsh', M).                 % every measure for 'Sparsh'
% ?- first_aid('Manthan', M).                 % the cut injury
% ?- first_aid('Walsh', cool_under_running_water_for_10_minutes).
% ?- first_aid(X, M).                    % all injuries with their measures
% ?- needs_doctor(X).
