function [agt,klld]=die(agt,cn)

%death function for class RABBIT
%agt=rabbit object
%cn - current agent number
%klld=1 if agent dies, =0 otherwise

%rabbits die if their food level reaches zero or they are older than max_age

global PARAM IT_STATS N_IT MESSAGES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both foxes and rabbits
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration

klld=0;
mortality=agt.fatality;            %get current agent food level
rnd=rand;

if mortality>rnd             %if food level < threshold and age > max age then agent dies
    IT_STATS.died_i(N_IT+1)=IT_STATS.died_i(N_IT+1)+1;  %update statistics
    MESSAGES.dead(cn)=1;                %update message list
    klld=1;
end