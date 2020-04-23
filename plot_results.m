function plot_results(agent,nsteps,fmode,outImages)

    %Plots 2d patch images of agents onto background 
    %%%%%%%%%%%
    %plot_results(agent,nr,nf)
    %%%%%%%%%%%
    %agent - current list of agent structures
    
    % Copied from ecolab by Dawn Walker

    global N_IT IT_STATS ENV_DATA MESSAGES CONTROL_DATA
    %declare variables that can be seen by all functions
    %N_IT is current iteration number
    %ENV_DATA - data structure representing the environment (initialised in
    %create_environment.m)
    %IT_STATS is data structure containing statistics on model at each
    %iteration (no. agents etc)
    %MESSAGES is a data structure containing information that agents need to
    %broadcast to each other

    %write results to the screen
    nh=IT_STATS.tot_h;
    ni=IT_STATS.tot_i;
    nid=zeros(length(N_IT));
    for i=1:N_IT
        nid(i)=sum(IT_STATS.died_i(1:i));
    end
    nc=IT_STATS.tot_c;
    disp(strcat('Iteration = ',num2str(N_IT)))
    disp(strcat('No. new infections = ',num2str(IT_STATS.div_i(N_IT+1))))
    disp(strcat('No. new carriers = ',num2str(IT_STATS.div_c(N_IT+1))))
    disp(strcat('No. agents migrating = ',num2str(IT_STATS.mig(N_IT+1))))
    disp(strcat('No. healthy humans dying = ',num2str(IT_STATS.died_h(N_IT+1))))
    disp(strcat('No. infected humans dying = ',num2str(IT_STATS.died_i(N_IT+1))))

    %plot line graphs of agent numbers and remaining food
    if (fmode==false) || (N_IT==nsteps) || ((fmode==true) && (rem(N_IT , CONTROL_DATA.fmode_display_every)==0))
        
        %Plotting takes time so fmode has been introduced to only plot every n=CONTROL_DATA.fmode_display_every iterations
        %This value increases with the number of agents (see ecolab.m L57-61) as plotting more agents takes longer. 
        %fmode can be turned off in the command line - see ecolab documentation

        col{1}='r-';                   %set up colours that will represent different cell types red for rabbits, blue for foxes
        col{2}='b-';

        n=nh(N_IT+1)+ni(N_IT+1)+nc(N_IT+1);             %current agent number
        f2=figure(2);
        set(f2,'Units','Normalized');
        set(f2,'Position',[0.5 0.5 0.45 0.4]);

        subplot(3,1,1),cla
        subplot(3,1,1),plot((1:N_IT+1),nh(1:N_IT+1),col{1});
        subplot(3,1,1),axis([0 nsteps 0 1.1*max(nh)]);
        subplot(3,1,2),cla
        subplot(3,1,2),plot((1:N_IT+1),ni(1:N_IT+1),col{2});
        subplot(3,1,2),axis([0 nsteps 0 1.1*(max(ni)+max(nc))]);
        subplot(3,1,3),cla
        subplot(3,1,3),plot((1:N_IT),nid,col{1});
        subplot(3,1,3),axis([0 nsteps 0 1.1*(max(ni)+max(nh)+max(nc))]);
        subplot(3,1,1),title('No. healthy humans');
        subplot(3,1,2),title('No. infected humans');
        subplot(3,1,3),title('No. infected deaths');
        drawnow

        %create plot of agent locations. 
        f3=figure(3);

        bm=ENV_DATA.bm_size;   
        typ=MESSAGES.atype;
        clf                             %clear previous plot
        set(f3,'Units','Normalized');
        set(f3,'Position',[0.05 0.05 0.66 0.66]);
        v=(1:bm);
        [X,Y]=meshgrid(v);
        Z=floor(10*ones(bm,bm));
        H=zeros(bm,bm);
        %Could add percentage of infected per village?
        
        hs=surf(Y,X,H,Z);               
        cm=colormap('gray');
        icm=flipud(cm);
        colormap(icm);
        set(hs,'SpecularExponent',1);       %sets up lighting
        set(hs,'SpecularStrength',0.1);
        hold on

        for cn=1:length(agent)                          %cycle through each agent in turn
            if typ(cn)>0                                %only plot live agents
                pos=get(agent{cn},'pos');               %extract current position    
                if isa(agent{cn},'human')              %choose plot colour depending on agent type
                    if length(pos)<2
                       pos 
                    end
                    ro=plot(pos(1),pos(2),'r*');
                else   
                    fo=plot(pos(1),pos(2),'b.'); 
                    set(fo,'MarkerSize',30);
                end
            end
        end

        h=findobj(gcf,'type','surface');			%Once all cells are plotted, set up perspective, lighting etc.
        set(h,'edgecolor','none');
        lighting flat
        h=findobj(gcf,'type','surface');
        set(h,'linewidth',0.1)
        set(h,'specularstrength',0.2)
        axis off
        axis equal
        set(gcf,'color',[1 1 1]);

        uicontrol('Style','pushbutton',...
                  'String','PAUSE',...
                  'Position',[20 20 60 20], ...
                  'Callback', 'global ENV_DATA; ENV_DATA.pause=true; display(ENV_DATA.pause); clear ENV_DATA;'); 

        while CONTROL_DATA.pause==true    % pause/resume functionality - allows pan and zoom during pause...
            pan on
            axis off
            title(['Iteration no.= ' num2str(N_IT) '.  No. agents = ' num2str(n)]);
            text(-2.6, 7.7, 'PAUSED', 'Color', 'r');
            drawnow
            uicontrol('Style','pushbutton',...
                      'String','ZOOM IN',...
                      'Position',[100 20 60 20],...
                      'Callback','if camva <= 1;return;else;camva(camva-1);end');
            uicontrol('Style','pushbutton',...
                      'String','ZOOM OUT',...
                      'Position',[180 20 60 20],...
                      'Callback','if camva >= 179;return;else;camva(camva+1);end');

            uicontrol('Style','pushbutton',...
                      'String','RESUME',...
                      'Position',[20 20 60 20], ...
                      'Callback', 'global ENV_DATA; ENV_DATA.pause=false; clear ENV_DATA;'); 
        end
        title(['Iteration no.= ' num2str(N_IT) '.  No. agents = ' num2str(n)]);
        axis off
        drawnow 
        if outImages==true  %this outputs images if outImage parameter set to true!!
            if fmode==true  %this warning is to show not all iterations are being output if fmode=true!
                    disp('WARNING*** fastmode set - To output all Images for a movie, set fmode to false(fast mode turned off) ');
            end 
            filenamejpg=[sprintf('%04d',N_IT)];
            eval(['print -djpeg90 agent_plot_' filenamejpg]); %print new jpeg to create movie later
        end
    end
end
