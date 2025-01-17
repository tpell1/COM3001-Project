function model(size,nh,ni,nc,nsteps,fmode,outImages)

%Adapted from ECOLAB by Dawn Walker

%This model simulates the spread of a disease between villages.

%model(size,nh,ni,nc,nsteps)
%size = size of model environmnet in km (sugested value for plotting
%purposes =50)
%nh - initial number of healthy human agents
%ni - initial number of infected human agents
%nc - initial number of asymptomatic infected human agents
%nsteps - number of iterations required

%definition of global variables:
%N_IT - current iteration number
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc). iniitialised in initialise_results.m
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)

    %clear any global variables/ close figures from previous simulations
    clear global
    close all

    global N_IT IT_STATS ENV_DATA CONTROL_DATA
    
    % optional arguments
    % fast mode - plots data more efficiently
    % outImages - Output images of data
    if nargin == 5
        fmode=true;
        outImages=false;
    elseif nargin == 6
        outImages=false;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %MODEL INITIALISATION
    create_control;                     %sets up the parameters to control fmode (speed up the code during experimental testing
    create_params;                      %sets the parameters for this simulation
    create_environment(size);           %creates environment data structure, given an environment size
    random_selection(1);                %randomises random number sequence (NOT agent order). If input=0, then simulation should be identical to previous for same initial values
    [agent]=create_agents(nh,ni,nc);       %create nr rabbit and nf fox agents and places them in a cell array called 'agents'
    create_messages(nh,ni,nc,agent);       %sets up the initial message lists
    initialise_results(nh,ni,nc,nsteps);   %initilaises structure for storing results
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %MODEL EXECUTION
    for n_it=1:nsteps                   %the main execution loop
        N_IT=n_it;
        [agent,n]=agnt_solve(agent);     %the function which calls the rules

        plot_results(agent,nsteps,fmode,outImages); %updates results figures and structures
        %mov(n_it)=getframe(fig3);
        if n<=0                          %if no more agents, then stop simulation
            break
            disp('General convergence criteria satisfied - no agents left alive! > ')
        end
        if fmode == true                                       % if fastmode is used ...
           for test_l=1 : 5                                    % this checks the total number agents and adjusts the CONTROL_DATA.fmode_display_every variable accoringly to help prevent extreme slowdown
               if n > CONTROL_DATA.fmode_control(1,test_l)     % CONTROL_DATA.fmode_control contains an array of thresholds for agent numbers and associated fmode_display_every values
                   CONTROL_DATA.fmode_display_every = CONTROL_DATA.fmode_control(2,test_l);
               end
           end
            if IT_STATS.tot_h(n_it) == 0             %fastmode convergence - all healthy humans died or are infected
                disp('Fast mode convergence criteria satisfied - no healthy humans alive! > ')
                break
            end  
            if IT_STATS.tot_i(n_it) == 0             %fastmode convergence - all infected humans have died, now humans can't be infected
                disp('Fast mode convergence criteria satisfied - no infected humans left alive ! > ')
                break
            end
        end
    end
eval(['save results_nr_' num2str(nh) '_nf_' num2str(ni) '.mat IT_STATS ENV_DATA' ]);
clear global
