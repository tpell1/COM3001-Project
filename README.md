# COM3001-Project
## About model
In real life, parasites are spread by close proximity, usually social, encounters between infected hosts and an uninfected population.  The way in which these parasites spread changes based on the sociability of the hosts and the terrain under which the transmissions occur. We can study emergent behaviours in this relationship by simulating agent based models.
The spread of a virus can be modelled using an ABM. By studying a host’s natural behaviour and replicating this behaviour in a simulation, it is possible to forecast the spread of the virus, and study any emergent behaviours that come of the simulation. 

## Usage of model
### Basic usage
* `model(size,nh,ni,nc,nsteps)`
  * `size` - the size of the environment which will be used in the tests
  * `nh` - The amount of healthy agents
  * `ni` - The number of infected agents
  * `nc` - The number of asymptomatic infected agents (carriers)
  * `nsteps` - The number of iterations to be used in the test
