function [nagent, nn] = agnt_solve(agent)

n = length(agent);
n_new = 0;
prev_n = n;

%execute existing agent update loop
for cn=1:n
    %==== TODO:: UPDATE AGENT LOOP ======>>
    curr=agent{cn};
    if isa(curr,'infected_human')%
        [curr,killd]=die(curr,cn);
        [curr,cn]=migrate(curr,cn);
        if killd==0
            res=infect(curr,cn);
            curr=res{1};
            infected=res{2};
            nagents=res{3};
            agent{cn}=curr;
            for i=1:infected
                n_new=n_new+1;
                nagent=nagents{i};
                agent{n+n_new}=infected_human(nagent(1),nagent(2),[nagent(3),nagent(4)]);
            end
        end
    elseif isa(curr,'human')
        migrate_human(curr,cn);
        die(curr,cn);
    elseif isa(curr, 'infected_human_carrier')
        [curr,killd]=die(curr,cn);
        [curr,cn]=migrate_carrier(curr,cn);
        if killd==0
            res=infect(curr,cn);
            curr=res{1};
            infected=res{2};
            nagents=res{3};
            agent{cn}=curr;
            for i=1:infected
                n_new=n_new+1;
                nagent=nagents{i};
                agent{n+n_new}=infected_human(nagent(1),nagent(2),[nagent(3),nagent(4)]);
            end
        end
    end
    agent{cn}=curr;
end

temp_n=n+n_new; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.

