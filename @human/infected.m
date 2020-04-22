function [agt, new]=infected(agt,cn)

cvill=agt.current_village;

age=agt.age;                %get current agent age
pos=agt.pos;         %current position

new=infected_human(cvill, age, pos);