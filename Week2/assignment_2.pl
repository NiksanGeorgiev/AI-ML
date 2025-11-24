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
