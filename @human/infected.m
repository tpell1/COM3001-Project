function [agt, new]=infected(agt,cn)

csoc=agt.sociability;
cfat=agt.fatality;
crepr=agt.reproduction;
cmig=agt.migration;
cspd=agt.speed;
cvill=agt.current_village;

age=agt.age;                %get current agent age
pos=agt.pos;         %current position

new=infected_human(cvill);