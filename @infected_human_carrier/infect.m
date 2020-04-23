function cellarray=infect(agt,cn)

%infect function for infected agents
%agt - current agent
%cn - current agent number
%cellarray = {agt, infected, nagents}
%agt - current agent
%infected - how many agents were infected
%nagents - cell array of new agent details (agnt_solve uses these to create
%new objects)

%SUMMARY OF INFECTON RULE
%Infected gets all current healthy humans in village
%Probability of each healthy human becoming infected
% = contagiousness*sociability + 2*healthy_human_sociability
%If product > rand, healthy human is infected

global  PARAM IT_STATS N_IT MESSAGES
   
cvill=agt.current_village;          %current agent village
infectiousness=0.0005*((agt.contagiousness)*agt.sociability);

infected=0;

typ=MESSAGES.atype;                                         %extract types of all agents
rem=MESSAGES.rem;
hvill=MESSAGES.village;   
hb=find(typ(1:length(hvill))==1&rem(1:length(hvill))==0&hvill==cvill);                                            %indices of all healthy humans
                        %extract villages of all healthy humans

nagents={};
j=0;
if ~isempty(hb)
    rnd=rand(length(hb));
   for i=1:length(hb)
       pi=infectiousness*MESSAGES.sociability(hb(i));
       if pi>rnd(i)
          j=j+1;
          infected=infected+1;
          MESSAGES.rem(hb(i))=1;
          if rnd(j)<PARAM.P_OF_CARRIER
              carrier=1;
              IT_STATS.div_c(N_IT+1)=IT_STATS.div_c(N_IT+1)+1;
          else
              carrier=0;
              IT_STATS.div_i(N_IT+1)=IT_STATS.div_i(N_IT+1)+1;
          end
          nagents{j}=[cvill, MESSAGES.age(hb(i)), MESSAGES.pos(hb(i),:),carrier];
       end
   end
end
IT_STATS.infected(N_IT+1)=IT_STATS.infected(N_IT+1)+infected;
cellarray = {agt,infected,nagents};



   
