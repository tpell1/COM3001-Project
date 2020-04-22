function [agt,cn] = migrate_human(agt, cn)

global PARAM

if rand>PARAM.H_MIGRATE_FREQ
    agt.current_village=randi([1, PARAM.N_OF_VILLAGES]);
end


