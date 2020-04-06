function [nagent, nn] = agnt_solve(agent)

n = length(agent);
n_new = 0;
prev_n = n;

%execute existing agent update loop
for cn=1:n
    %==== TODO:: UPDATE AGENT LOOP ======>>
end

temp_n=n+n_new; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.

