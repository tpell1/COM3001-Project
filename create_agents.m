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
  
n_of_agents=nh+ni+nc;
locs=populate_villages(n_of_agents); %get location of agents in villages

locations=locs(:, 2); %change to get only coords dimension of object
villages=locs(:, 1);  %get list of villages for each agent

locat=zeros(length(locs),2);

for i=1:length(locs)
   locat(i, :)=locations{i};
end
MESSAGES.pos=locat;

%generate all non_infected human agents and record their positions in ENV_MAT_R
for h=1:nh
    pos=locat(h, :);
    vill=villages{h};
    
    agent{h}=human(vill,pos);
end

%generate all infected human agents and record their positions in ENV_MAT_F
for i=nh+1:ni+nh
    pos=locat(h, :);
    vill=villages{i};
    %create infected human agents with random ages between 0 and 20 days

    agent{i}=infected_human(vill,pos);
end

for c=nh+ni+1:nh+ni+nc
    pos=locat(h, :);
    vill=villages{c};
    %create human carrier agents with random ages between 0 and 20 days

    agent{i}=infected_human_carrier(vill,pos);
end