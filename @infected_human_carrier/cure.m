function cellarray=cure(agt,cn)

%eating function for class FOX
%agt=fox object
%cn - current agent number
%infected = 1 if infects new agent
%nagnt - new agent object (to replace healthy human)

%SUMMARY OF INFECTON RULE
%Infected gets all current healthy humans in village
%Probability of each healthy human becoming infected
% = contagiousness*sociability + 2*healthy_human_sociability
%If product > rand, healthy human is infected


%GLOBAL VARIABLES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   

global  IT_STATS N_IT MESSAGES
   
cvill=agt.current_village;          %current agent village
p_of_cure=agt.p_of_cure;

if p_of_cure>randi(100)
  cured=1
  MESSAGES.rem(cn)=1;
  if MESSAGES.village(cn)==[]
      IT_STATS.tot_cured
  end
  nagents=[MESSAGES.village(cn), MESSAGES.age(cn), MESSAGES.pos(cn,:)];
  IT_STATS.infected(N_IT+1)=IT_STATS.infected(N_IT+1)-1;
  IT_STATS.tot_cured(N_IT+1)=IT_STATS.tot_cured(N_IT+1)+1;
else
    cured=0;
end

cellarray = {agt,cured,nagents};



   