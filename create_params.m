function create_params

%set up breeding, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.H_SPD=5;          %speed of movement - units per itn (human)
    PARAM.IH_SPD=1;         %speed of movement - units per itn (infected_human)
    PARAM.BR_AGE=20         %age of breeding in years
    PARAM.D_MORTALITY=0.05  %how deadly pathogen is
    PARAM.D_SOCIAL_F=0.4    %how much pathogen infects sociability
    PARAM.D_CONTAGIOUS=1/3  %how contagious pathogen is
    PARAM.F_MAXAGE=50;
    
    