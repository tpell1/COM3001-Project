# COM3001-Project
## About model
In real life, parasites are spread by close proximity, usually social, encounters between infected hosts and an uninfected population.  The way in which these parasites spread changes based on the sociability of the hosts and the terrain under which the transmissions occur. We can study emergent behaviours in this relationship by simulating agent based models.
The spread of a virus can be modelled using an ABM. By studying a host’s natural behaviour and replicating this behaviour in a simulation, it is possible to forecast the spread of the virus, and study any emergent behaviours that come of the simulation. 

### Parameters
D_MORTALITY=30;      %how deadly pathogen is . 
MORTALITY=0.005;      %how likely a healthy agent is to die on each iteration . 
IMMUNE_STRENGTH=0;    %How likely an infected agent is to be cured (out of 100).  
N_OF_VILLAGES=1;       %Number of villages  
SOCIABILITY=5;         %Sociability . 
P_OF_CARRIER=0.3;     %How likely a newly infected agent will be asymptomatic . 
D_SOCIAL_F=0.1;        %how much pathogen infects sociability . 
D_CONTAGIOUS=0.05;      %how contagious pathogen is . 
H_MIGRATE_FREQ=0.1;   %how often a normal human changes village . 
I_MIGRATE_FREQ=0.05;   %how often an infected human changes .  

## Usage of model
### Basic usage
Use the model with all optional parameters using their default value.
* `model(size,nh,ni,nc,nsteps)`
  * `size` - the size of the environment which will be used in the tests
  * `nh` - The amount of healthy agents
  * `ni` - The number of infected agents
  * `nc` - The number of asymptomatic infected agents (carriers)
  * `nsteps` - The number of iterations to be used in the test
#### Fast mode
Is either `1` or `0`, it speeds up the simulation by reducing the amount of plotting as the size of the model increases.
It can be set when starting the model by giving an extra argument: `model(size,nh,ni,nc,nsteps,fmode)`
#### Output images
This determines whether the model outputs images of the experiment results, if on the simulation is much smaller.
It can be set by giving an extra argument as well as fast mode: `model(size,nh,ni,nc,nsteps,fmode,outImages)`