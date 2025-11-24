:- dynamic q/0.
p.
q.
r :- p,q.


:- dynamic d/0.
d.
b.
a :- b, c.
c :- d.


gold23 :- glitter23.
glitter23.
nowumpus11.
nopit11.
safe11 :- nowumpus11, nopit11.
safe12 :- nobreeze11, nostench11.
safe21 :- nobreeze11, nostench11.
