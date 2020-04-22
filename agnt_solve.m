function [nagent, nn] = agnt_solve(agent)

n = length(agent);
n_new = 0;
prev_n = n;

%execute existing agent update loop
for cn=1:n
    %==== TODO:: UPDATE AGENT LOOP ======>>
    curr=agent{cn};
    if isa(curr,'infected_human')|isa(curr, 'infected_human_carrier')
        [curr,killd]=die(curr,cn);
        if killd==0
            [curr,infected,nagents]=infect(curr,cn);
            agent{cn}=curr;
            for i=1:infected
                n_new=n_new+1;
                agent{n+n_new}=nagents(i);
            end
        end
    elseif isa(curr,'human')
        die(curr,cn);
    end
    agent{cn}=curr;
end

temp_n=n+n_new; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.

