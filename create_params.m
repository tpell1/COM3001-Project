function create_params

%set up breeding, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.H_SPD=5;              %speed of movement - units per itn (human)
    PARAM.IH_SPD=1;             %speed of movement - units per itn (infected_human)
    PARAM.D_MORTALITY=30;      %how deadly pathogen is
    PARAM.MORTALITY=0.002;
    PARAM.BR_AGE=30;
    PARAM.N_OF_VILLAGES=4;       %Number of villages
    PARAM.SOCIABILITY=5;         %Sociability
    PARAM.D_SOCIAL_F=0.33;        %how much pathogen infects sociability
    PARAM.D_CONTAGIOUS=0.08;      %how contagious pathogen is
    PARAM.H_MIGRATE_FREQ=0.1;   %how often a normal human changes village
    PARAM.I_MIGRATE_FREQ=0.05;   %how often an infected human changes village
    
    