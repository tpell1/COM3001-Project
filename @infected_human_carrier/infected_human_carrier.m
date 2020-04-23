classdef infected_human_carrier
    % infected_human
    %   Detailed explanation goes here
    
    properties
        sociability;
        age;
        fatality;
        migration;
        pos;
        current_village;
        infected;
        contagiousness;
        p_of_cure;
    end
    
    methods  
        % params 
        % Sociability, age, fatality, reproduction, migration,
        % current_village, speed, pos
        function obj = infected_human_carrier(varargin)
            global PARAM;
            
            switch nargin
                case 0
                    obj.sociability = PARAM.SOCIABILITY;
                    obj.age = 0;
                    obj.fatality = PARAM.MORTALITY;
                    obj.current_village = 1;
                    obj.pos = [];
                    obj.infected = true;
                    obj.contagiousness = PARAM.D_CONTAGIOUS;
                case 2
                    obj.sociability = PARAM.SOCIABILITY;
                    obj.age = 0;
                    obj.fatality = PARAM.MORTALITY;
                    obj.migration = PARAM.H_MIGRATE_FREQ;
                    obj.current_village = varargin{1};
                    obj.pos = varargin{2};
                    obj.infected = true;
                    obj.contagiousness = PARAM.D_CONTAGIOUS;
                case 8
                    obj.sociability = varargin{1};
                    obj.age = varargin{2};
                    obj.fatality = varargin{3};
                    obj.migration = varargin{4};
                    obj.current_village = varargin{5};
                    obj.pos = varargin{6};
                    obj.infected = varargin{7};
                    obj.contagiousness = varargin{8};
            end
            obj.p_of_cure=PARAM.IMMUNE_STRENGTH;
        end
    end
end

