function [nagent,nn]=update_messages(agent,prev_n,temp_n)

%copy all surviving and new agents in to a new agent list - dead agents
%will be empty structures

%agent - list of existing agents, including those that have died in the
%current iteration
%prev_n - previous number of agents at the start of this iteration
%temp_n - number of existing agents, including those that have died in the
%current iteration
%nagent - list of surviving agents and empty structures
%nn - number of surviving agents

%global variables
%N_IT current iteration no
%IT_STATS data structure for saving model statistics
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
%ENV_DATA - is a data structure containing information about the model
   %environment

global MESSAGES IT_STATS N_IT ENV_DATA

nagent=cell(1,temp_n);                  %initialise list for surviving agents
nn=0;                                   %tracks number of surviving agents
for cn=1:temp_n
    if get(agent{cn},'current_village')==[]|get(agent{cn},'current_village')==0
       MESSAGES 
    end
    if isempty(agent{cn})               %agent died in a previous iteration (not the current one)
        dead=1;
    elseif cn<=prev_n                   %agent is not new, therefore it might have died
        dead=MESSAGES.dead(cn);         %will be one for agents that have died, zero otherwise
        infected=MESSAGES.rem(cn);      %will be one for agents that are infected, zero otherwise
    else 
        dead=0;
    end
    if dead==0                          %if agent is not dead
        if infected==0
            nagent{cn}=agent{cn};           %copy object into the new list
            MESSAGES.pos(cn,:)=get(agent{cn},'pos');
            
            MESSAGES.village(cn)=get(agent{cn},'current_village');
            MESSAGES.sociability(cn)=get(agent{cn},'sociability');
            MESSAGES.rem(cn)=0;
            MESSAGES.dead(cn)=0;  
            MESSAGES.age(cn)=get(agent{cn},'age');
            if isa(agent{cn},'human')
                MESSAGES.atype(cn)=1;
                IT_STATS.tot_h(N_IT+1)=IT_STATS.tot_h(N_IT+1)+1;
            elseif isa(agent{cn},'infected_human')
                MESSAGES.atype(cn)=2;
                IT_STATS.tot_i(N_IT+1)=IT_STATS.tot_i(N_IT+1)+1;
            elseif isa(agent{cn},'infected_human_carrier')
                MESSAGES.atype(cn)=3;
                IT_STATS.tot_c(N_IT+1)=IT_STATS.tot_c(N_IT+1)+1;
            end
            nagent{cn}=agent{cn};           %copy object into the new list
            pos=get(agent{cn},'pos');
            MESSAGES.pos(cn,:)=pos;                    
            nn=nn+1;
        else
            % INFECTED CODE GOES HERE (remove infected healthy human from
            % list and add infected_human to list) Temporarily using death
            % procedure instead.
            
            MESSAGES.pos(cn,:)=[-1 -1];     %enter dummy position in list
            MESSAGES.atype(cn)=0;           %set type to dead
            MESSAGES.dead(cn)=0;            %clear death message
            MESSAGES.rem(cn)=0;
        end
    else                                %agent has died
        MESSAGES.pos(cn,:)=[-1 -1];     %enter dummy position in list
        MESSAGES.atype(cn)=0;           %set type to dead
        MESSAGES.dead(cn)=0;            %clear death message
    end
end
IT_STATS.tot(N_IT+1)=nn;                %update total agent number