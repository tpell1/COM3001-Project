function [agt,klld]=die(agt,cn)
%death function, uses agents fatality property and a random number
%generator to determine if it should die.
%fatality is determined in the constructor and is a function of disease
%fatality and agent_mortality

global IT_STATS N_IT MESSAGES

klld=0;
mortality=agt.fatality;            
rnd=rand;

if mortality>rnd             
    IT_STATS.died_i(N_IT+1)=IT_STATS.died_i(N_IT+1)+1;  %update statistics
    IT_STATS.tot_h(N_IT+1)=IT_STATS.tot_h(N_IT+1)+1;

    MESSAGES.dead(cn)=1;                %update message list
    klld=1;
end