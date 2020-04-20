function locs = populate_villages(n_of_agents)

GLOBAL PARAM ENV_DATA

locs = zeros(1,n_of_agents);

for i=1:n_of_agents
    j=mod(i, PARAM.N_OF_VILLAGES);
    
    % modify previous location code: (bm_size-1)*rand(nr,2)+1;
    % to get a random location within village j
    % need to sort out array syntax ********
    
    x = ENV_DATA.villages[i][0][0]+(ENV_DATA.villages[i][1]*randi(1);
    y = ENV_DATA.villages[i][0][1]+(ENV_DATA.villages[i][1]*randi(1);
    locs[i]=[j, [x],[y]]];
end