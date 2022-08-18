%"Imaginary Friends",

adventure(circus).
adventure(rock_band).
adventure(spaceship).
adventure(train).


child(joanne).
child(lou).
child(ralph).
child(winnie).


friend(grizzly_Bear).
friend(moose).
friend(seal).
friend(zebra).


solve :-
    friend(JoanneFriend), friend(LouFriend), friend(RalphFriend),
    friend(WinnieFriend),
    all_different([JoanneFriend, LouFriend, RalphFriend, WinnieFriend]),
    
    adventure(JoanneAdventure), adventure(LouAdventure), adventure(RalphAdventure), adventure(WinnieAdventure),
    all_different([JoanneAdventure, LouAdventure, RalphAdventure, WinnieAdventure]),
    
         
    Stories = [story(joanne, JoanneFriend, JoanneAdventure),
               story(lou, LouFriend, LouAdventure),
               story(ralph, RalphFriend, RalphAdventure),
               story(winnie, WinnieFriend, WinnieAdventure) ],
              
              
    % 1. The seal (who isn't from Joanne or Lou) did neither space nor train.
       \+ member(story(joanne, seal, _), Stories),
       \+ member(story(lou, seal, _), Stories),
       \+ member(story(_, seal, train), Stories),
       \+ member(story(_, seal, spaceship), Stories),
    
    % 2. Joanne's imaginary friend isn't a bear and went to a circus.
    \+ member(story(joanne, grizzly_Bear, _), Stories),
       member(story(joanne, _, circus), Stories),
    
    % 3. Winnie's imaginary frind is a zebra.
       member(story(winnie, zebra, _), Stories),
    
    % 4. The grizzly bear didn't board the spaceship.
    \+ member(story(_, grizzly_Bear, spaceship), Stories),
    
    tell(joanne, JoanneFriend, JoanneAdventure),
    tell(lou, LouFriend, LouAdventure),
    tell(ralph, RalphFriend, RalphAdventure),
    tell(winnie, WinnieFriend, WinnieAdventure).
    
tell(Author, ImaginaryFriend, Adventure) :- write('The child named '), write(Author), write(' was friends with a '), write(ImaginaryFriend),
    write(' and went on an adventure to a '), write(Adventure), write('.'), nl.
    
% If the head of the list is in the tail, fail.
all_different([Head|Tail]) :- member(Head, Tail), !, fail.
% Otherwise, check the tail of the list.
all_different([_|Tail]) :- all_different(Tail).
% If there's only one thing in the list, it's fine.
all_different([_]).