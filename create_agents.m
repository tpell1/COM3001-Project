function [agent]=create_agents(nh,ni,nc)

 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%nh - number of humans
%ni - number of infected
%nc - number of carriers

global ENV_DATA MESSAGES PARAM 
  
n_of_agents=nh+ni+nc;
locs=populate_villages(n_of_agents); %get location of agents in villages

locations=locs(:, 2); %change to get only coords dimension of object
villages=locs(:, 1);  %get list of villages for each agent

locat=zeros(length(locs),2);
agent=cell(n_of_agents);

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

    agent{i}=infected_human(vill,pos);
end

for c=nh+ni+1:nh+ni+nc
    pos=locat(h, :);
    vill=villages{c};

    agent{i}=infected_human_carrier(vill,pos);
end