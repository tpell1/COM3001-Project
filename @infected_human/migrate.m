function [agt,cn] = migrate(agt, cn)

global PARAM

if rand>PARAM.I_MIGRATE_FREQ
    agt.current_village=randi([1, PARAM.N_OF_VILLAGES]);
end


