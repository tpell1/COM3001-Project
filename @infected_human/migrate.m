function [agt,cn] = migrate(agt, cn)

%determine whether agent should migrate to another village

global PARAM IT_STATS N_IT

if rand<PARAM.I_MIGRATE_FREQ
    agt.current_village=randi([1, PARAM.N_OF_VILLAGES]); %determine new village randomly
    IT_STATS.mig(N_IT+1)=IT_STATS.mig(N_IT+1)+1;
end


