function [agt, new]=breed(agt,cn)

%breeding function for class RABBIT
%agt=rabbit object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT BR_AGE
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both foxes and rabbits
   
age=agt.age;                %get current agent age
pos=agt.pos;                %current position

rng(0)
no_of_children=randi([1 4]) %get random number to see how many
                            %children the agent will have

if age==BR_AGE  %if age is equal to breeding age then breed
    for n=1:no_of_children
        new = [new human()] %TODO=ADD HUMAN CONSTRUCTOR
    end
    agt.age=age+1;
    IT_STATS.div_r(N_IT+1)=IT_STATS.div_r(N_IT+1)+1;             %update statistics
else                            
    agt.age=age+1;                          %not able to breed, so increment age by 1
    new=[];
end