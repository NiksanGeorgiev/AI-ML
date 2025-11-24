% Exercise 1 %
p.
q.
r.
s.

a :- b, c.
b :- p, q.
c :- r, s.

% 1. The list of attoms is a, b, c, p, q, r, s
% 2. Prolog performed a depth-first search
% If it had used breadth-first search, it would have went a, b, c first, then p, q, r, s


% Exercise 2 %
% Part I
person(alisha).
person(frank).
person(eve).
person(alex).

corona_symptom(cold).
corona_symptom(cough).
corona_symptom(trouble_breathing).
corona_symptom(fever).
corona_symptom(nosmell).

has_corona(frank).

has_symptom(alisha, cold).
has_symptom(alex,stomach_ache).

housemate(frank, eve).

stay_home(Person) :- person(Person), has_corona(Person).
% 1. Check if a person has a corona symptom and tell them to stay home
stay_home(Person) :- person(Person), corona_symptom(Symptom), has_symptom(Person, Symptom).

% 2. Check if a person's housemate has corona and tell them to stay home
% Checks for both possitibiliets of housemate relationship are needed
stay_home(Person) :- person(Person), housemate(Housemate, Person), has_corona(Housemate).

stay_home(Person) :- person(Person), housemate(Person, Housemate), has_corona(Housemate).

% Part II
person(mary).
person(john).
person(tabitha).

public_building(store).
public_building(museum).
public_building(municipality).
public_building(station).

activity(working).
activity(commuting).
activity(shopping).
activity(cycling).
activity(theatre).
activity(dance).

visit(store, shopping).
visit(station, commuting).

contact_profession(physiotherapy).
contact_profession(pedicure).

profession(mary, physiotherapy).
profession(john, pedicure).
profession(tabitha, scientist).

personal_mask_exception(john).
activity_mask_exception(theatre).
activity_mask_exception(dance).

% 3. Wear a mask for activity should be true for any activity but the ones with exception
% NOTE: We did look up online how to perform an negation in Prolog because otherwise we felt that we would need ot input all activities and people that don't require a mask manually
wear_mask(Activity) :- activity(Activity), \+ activity_mask_exception(Activity).
wear_mask(Activity, Person) :- wear_mask(Activity), person(Person), visit(Building, Activity), public_building(Building), \+ personal_mask_exception(Person).

% 4. Check if a person's profession is a contact profession to see if they need to wear a mask.
wear_mask(working, Person) :- person(Person), profession(Person, Profession), contact_profession(Profession), \+ personal_mask_exception(Person).

% 5. Exceptions for not wearing a mask using an OR condition
no_mask(Activity, Person) :- activity(Activity), person(Person), activity_mask_exception(Activity).
no_mask(Activity, Person) :- activity(Activity), person(Person), personal_mask_exception(Person).

% 6. If we want to address the specific conflict mentioned in the exercise description, we can add the personal_mask_exception to the wear_mask rule for activities if we know for a fact personal_mask_exception is valid for any activity. 
% If we want to address all possible conflicts, then we would want fully work out all possible cases for wear_mask for example. Given the nature of the two statements, it is expected that one is equal to the negation of the other, so by ensuring wear_mask covers all cases, we can simply use negation to determine no_mask.
