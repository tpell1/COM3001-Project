function create_params

%set up breeding, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.D_MORTALITY=30;      %how deadly pathogen is
    PARAM.MORTALITY=0.002;      %how likely a healthy agent is to die on each iteration
    PARAM.IMMUNE_STRENGTH=0;    %How likely an infected agent is to be cured (out of 100)
    PARAM.N_OF_VILLAGES=1;       %Number of villages
    PARAM.SOCIABILITY=5;         %Sociability
    PARAM.P_OF_CARRIER=0.3;     %How likely a newly infected agent will be asymptomatic
    PARAM.D_SOCIAL_F=0.1;        %how much pathogen infects sociability
    PARAM.D_CONTAGIOUS=0.05;      %how contagious pathogen is
    PARAM.H_MIGRATE_FREQ=0.1;   %how often a normal human changes village
    PARAM.I_MIGRATE_FREQ=0.05;   %how often an infected human changes village
    
    