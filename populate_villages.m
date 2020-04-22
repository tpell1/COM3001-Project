function locs = populate_villages(n_of_agents)

global PARAM ENV_DATA

locs = cell(n_of_agents, 2);

for i=1:n_of_agents
    j=mod(i, PARAM.N_OF_VILLAGES)+1;

    % modify previous location code: (bm_size-1)*rand(nr,2)+1;
    % to get a random location within village j
    % need to sort out array syntax ********
    
    radius = ENV_DATA.villages{j,2};
    
    x = ENV_DATA.villages{j,1}(1)+(randi(radius));
    y = ENV_DATA.villages{j,1}(2)+(randi(radius));
    
    locs(i, :)={j, [x,y]};
end