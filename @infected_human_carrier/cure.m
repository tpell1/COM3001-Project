function cellarray=cure(agt,cn)

%cure function for infected agents
%agt - current agent
%cn - current agent number
%cellarray = {agt, cured, nagent}
%agt - current agent
%infected - how many agents were infected
%nagent - array of new agent details (agnt_solve uses these to create
%new objects)

%SUMMARY OF cure RULE
%probability of cure and random number determines if agent is to be cured
global  IT_STATS N_IT MESSAGES
   
p_of_cure=agt.p_of_cure;

if p_of_cure>randi(100)
  cured=1
  MESSAGES.rem(cn)=1;
  nagents=[MESSAGES.village(cn), MESSAGES.age(cn), MESSAGES.pos(cn,:)];
  IT_STATS.infected(N_IT+1)=IT_STATS.infected(N_IT+1)-1;
  IT_STATS.tot_cured(N_IT+1)=IT_STATS.tot_cured(N_IT+1)+1;
else
    cured=0;
end

cellarray = {agt,cured,nagents};



   
