function create_messages(nh,ni,nc,agent)

%function that populates the global data structure representing
%message information

%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=healthy human, 2=infected human, 3=human carrier, 0=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGES.dead - n x1 array containing ones for agents that have died
   %    MESSAGES.village - list of every agents current village
   %    MESSAGES.sociability - list of every agents sociability
   %    MESSAGES.rem - list of whether each agent is currently infected
   %    in the current iteration
   
 global MESSAGES
 
 for an=1:length(agent)
     if isa(agent{an},'human')
        MESSAGES.atype(an)=1;
        MESSAGES.pos(an,:)=get(agent{an},'pos');
        MESSAGES.village(an)=get(agent{an},'current_village');
        MESSAGES.sociability(an)=get(agent{an},'sociability');
        MESSAGES.dead(an)=0;
        MESSAGES.rem(an)=0;
        MESSAGES.age(an)=get(agent{an},'age');
     elseif isa(agent{an},'infected_human')
        MESSAGES.atype(an)=2;
        MESSAGES.pos(an,:)=get(agent{an},'pos');
        MESSAGES.village(an)=get(agent{an},'current_village');
        MESSAGES.sociability(an)=get(agent{an},'sociability');
        MESSAGES.dead(an)=0;
        MESSAGES.rem(an)=0;
        MESSAGES.age(an)=get(agent{an},'age');
     elseif isa(agent{an},'carrier_human')
        MESSAGES.atype(an)=3; 
        MESSAGES.pos(an,:)=get(agent{an},'pos');
        MESSAGES.village(an)=get(agent{an},'current_village');
        MESSAGES.sociability(an)=get(agent{an},'sociability');
        MESSAGES.dead(an)=0;
        MESSAGES.rem(an)=0;
        MESSAGES.age(an)=get(agent{an},'age');
     else
        MESSAGES.atype(an)=0;
        MESSAGES.pos(an,:)=[-1 -1];
        MESSAGES.dead(an)=0;
        MESSAGES.rem(an)=0;
     end
     
 end
     
