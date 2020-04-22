function initialise_results(nh,ni,nc,nsteps)

 global  IT_STATS ENV_DATA 
 
%set up data structure to record statistics for each model iteration
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc)
%ENV_DATA - data structure representing the environment 
 
 IT_STATS=struct('div_i',[zeros(1,nsteps+1);],...            %no. of infections per iteration
                'div_c',[zeros(1,nsteps+1)],...
                'died_h',[zeros(1,nsteps+1)],...			%no. agents dying per iteration
                'died_i',[zeros(1,nsteps+1)],...
                'died_c',[zeros(1,nsteps+1)],....
                'infected',[zeros(1,nsteps+1)],...              %no. rabbits eaten per iteration
                'mig',[zeros(1,nsteps+1)],...                %no. agents migrating per iteration
                'tot',[zeros(1,nsteps+1)],...				%total no. agents in model per iteration
                'tot_h',[zeros(1,nsteps+1)],...             % total no. healthy humans
                'tot_i',[zeros(1,nsteps+1)],...             % total no. infected humans
                'tot_c',[zeros(1,nsteps+1)],...               % total no. carriers
                'tot_cured',[zeros(1,nsteps+1)]);
 IT_STATS.tot(1)=nh+ni+nc;
 IT_STATS.tot_h(1)=nh;
 IT_STATS.tot_i(1)=ni;
 IT_STATS.tot_c(1)=nc;
