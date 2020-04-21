# COM3001-Project
## TODO
### CREATE_ scripts
#### create_environment
~~Contains `ENV_DATA.villages` variable which should call `create_villages(n)` to create an array of villages using `PARAM.N_OF_VILLAGES` as the size of array and then random distribution of village coords and radi.~~ Implemented (for complete implementation: finish create_villages, create_agents, populate_villages).
#### create_villages
Currently returns a hardcoded list of four villages, must be changed to create an n sized array of randomly distributed villages.
#### create_agents
~~Currently spawns agents in a random distribution throughout whole environment, modify this so that it places agents randomly within villages, using radi of village to calculate how many agents can live in a village at a time~~ Implemented? (needs testing)
#### populate_villages
~~Will use number of agents and params to return an n size array of `[location,village_number]` which the `create_agent` function will be able to use to give agents a position value and a number of the village it is in.~~ Implemented (~~Implementation may be correct but array syntax must be corrected~~, fixed using cell array).
#### create_messages
~~Needs adapting from ecolab version, convert `nr` and `nf` to our agent types for example. Add a village message as well to enable agents to interact with other agents in same village.~~ Village message implemented, others may be required.
### Constructors
~~Make it so no params are required/minimal params~~ Implemented
### Methods
#### Infect (For infected agents only)
Use the contagiousness & sociability params to infect agents that the agent socialised with in same village. **(Started)** *Needs testing and must add part of code on healthy humans behalf to turn a healthy human agent to an infected human agent.*
#### Die
~~Use fatality and age to calculate whether agent should die~~ (implemented) ~~fatality should also be modified by disease mortality if user is infected~~ (Implemented by PARAM Creation)
#### Migrate
Use migration_freq param to determine how many users should migrate to different villages
