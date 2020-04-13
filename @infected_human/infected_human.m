classdef infected_human
    % infected_human
    %   Detailed explanation goes here
    
    properties
        Sociability;
        age;
        fatality;
        reproduction;
        migration;
        pos;
        speed;
        current_village;
        infected;
        contagiousness;
    end
        
    methods  
        % params 
        % Sociability, age, fatality, reproduction, migration,
        % current_village, speed, pos
        function obj = infected_human(varargin) 
            global PARAM
            switch nargin
                case 0
                    obj.sociability = PARAM.SOCIABILITY*PARAM.D_SOCIAL_F;
                    obj.age = 0;
                    obj.fatality = (PARAM.MORTALITY*PARAM.D_MORTALITY)+PARAM.MORTALITY;
                    obj.reproduction = PARAM.BR_AGE;
                    obj.migration = PARAM.I_MIGRATE_FREQ;
                    obj.current_village = 1;
                    obj.speed = PARAM.IH_SPD;
                    obj.pos = [];
                    obj.infected = true;
                    obj.contagiousness = PARAM.D_CONTAGIOUS;
                case 8
                    obj.sociability = varargin{1};
                    obj.age = varargin{2};
                    obj.fatality = varargin{3};
                    obj.reproduction = varargin{4};
                    obj.migration = varargin{5};
                    obj.current_village = varargin{6};
                    obj.speed = varargin{7};
                    obj.pos = varargin{8};
                    obj.infected = varargin{9};
                    obj.contagiousness = varargin{10};
            end
        end
    end
end

