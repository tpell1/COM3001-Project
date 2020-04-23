function [nagent, nn] = agnt_solve(agent)

n = length(agent);
n_new = 0;
prev_n = n;

%execute existing agent update loop
for cn=1:n
    curr=agent{cn};
    if isa(curr,'infected_human') % if an infected_human
        [curr,killd]=die(curr,cn);  %check if dead before preceeding
        [curr,cn]=migrate(curr,cn); %migrate
        if killd==0
            rslt=cure(curr,cn);     %check if agent is cured
            curr=rslt{1};           
            cured=rslt{2};
            if cured==1             %if cured create a new healthy agent
                nagent=rslt{3};
                n_new=n_new+1;
                agent{n+n_new}=human(nagent(1),nagent(2),[nagent(3),nagent(4)]);
            else                    %else check to see if infects others
                res=infect(curr,cn);
                curr=res{1};
                infected=res{2};
                nagents=res{3};
                agent{cn}=curr;
                for i=1:infected
                    n_new=n_new+1;
                    nagent=nagents{i};
                    if nagent(5)==1     %if infected, created new agents
                        agent{n+n_new}=infected_human_carrier(nagent(1),nagent(2),[nagent(3),nagent(4)]);
                    else
                        agent{n+n_new}=infected_human(nagent(1),nagent(2),[nagent(3),nagent(4)]);
                    end
                end
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
                if nagent(5)==1
                    agent{n+n_new}=infected_human_carrier(nagent(1),nagent(2),[nagent(3),nagent(4)]);

                else
                    agent{n+n_new}=infected_human(nagent(1),nagent(2),[nagent(3),nagent(4)]);
                end
            end
        end
    end
    agent{cn}=curr;
end

temp_n=n+n_new; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.

