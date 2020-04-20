# COM3001-Project
## TODO
### CREATE_ scripts
#### CREATE_ENVIRONMENT
Contains `ENV_DATA.villages` variable which should call `create_villages(n)` to create an array of villages using `PARAM.N_OF_VILLAGES` as the size of array and then random distribution of village coords and radi.
#### create_villages
Currently returns a hardcoded list of four villages, must be changed to create an n sized array of randomly distributed villages.
#### create_agents
Currently spawns agents in a random distribution throughout whole environment, modify this so that it places agents randomly within villages, using radi of village to calculate how many agents can live in a village at a time
### Constructors
~~Make it so no params are required/minimal params~~ Implemented
### Methods
#### Infect (For infected agents only)
Use the contagiousness param to infect agents that the agent socialised with in same village
#### Socialise
Use sociability variable to determine how many users agent socialises with
#### Die
~~Use fatality and age to calculate whether agent should die~~ (implemented) ~~fatality should also be modified by disease mortality if user is infected~~ (Implemented by PARAM Creation)
#### Migrate
Use migration_freq param to determine how many users should migrate to different villages
