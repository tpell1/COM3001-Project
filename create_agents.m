function [agent]=create_agents(nh,ni,nc)

 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%nr - number of humans
%ni - number of infected

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation
 
 global ENV_DATA MESSAGES PARAM 
  
bm_size=ENV_DATA.bm_size;
hloc=(bm_size-1)*rand(nh,2)+1;      %generate random initial positions for non-infected humans
iloc=(bm_size-1)*rand(ni,2)+1;      %generate random initial positions for infected humans
cloc=(bm_size-1)*rand(nc,2)+1;      %generate random initial positions for carrier humans

MESSAGES.pos=[hloc;iloc;cloc];

%generate all non_infected human agents and record their positions in ENV_MAT_R
for h=1:nh
    pos=hloc(h,:);
    %create human agents with random ages between 0 and 20 days

    agent{h}=human(sociability,age,fatality,reproduction,migration,current_village,speed,pos,immune);
end

%generate all infected human agents and record their positions in ENV_MAT_F
for i=nh+1:ni+nh
    pos=iloc(i-nh,:);
    %create infected human agents with random ages between 0 and 20 days

    agent{i}=infected_human(sociability,age,fatality,reproduction,migration,current_village,speed,pos,infected,contagiousness);
end

for c=nh+ni+1:nh+ni+nc
    pos=cloc(i-(nh+ni),:);
    %create human carrier agents with random ages between 0 and 20 days

    agent{c}=infected_human_carrier(sociability,age,fatality,reproduction,migration,current_village,speed,pos,infected,contagiousness);
end