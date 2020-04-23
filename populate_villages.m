function locs = populate_villages(n_of_agents)
% Assign every agent to a village
% n_of_agents - Number of agents
% locs - CellArray {j, [x,y]}
%   j - village number
%   [x,y] - village coords

global PARAM ENV_DATA

locs = cell(n_of_agents, 2);

for i=1:n_of_agents
    j=mod(i, PARAM.N_OF_VILLAGES)+1;
    
    radius = ENV_DATA.villages{j,2};
    
    x = ENV_DATA.villages{j,1}(1)+(randi(radius));
    y = ENV_DATA.villages{j,1}(2)+(randi(radius));
    
    locs(i, :)={j, [x,y]};
end