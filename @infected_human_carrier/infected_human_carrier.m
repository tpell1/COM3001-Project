classdef infected_human_carrier
    % infected_human
    %   Detailed explanation goes here
    
    properties
        sociability;
        age;
        fatality;
        reproduction;
        migration;
        pos;
        speed;
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
                    obj.reproduction = PARAM.BR_AGE;
                    obj.migration = PARAM.H_MIGRATE_FREQ;
                    obj.current_village = 1;
                    obj.speed = PARAM.H_SPD;
                    obj.pos = [];
                    obj.infected = true;
                    obj.contagiousness = PARAM.D_CONTAGIOUS;
                case 2
                    obj.sociability = PARAM.SOCIABILITY;
                    obj.age = 0;
                    obj.fatality = PARAM.MORTALITY;
                    obj.reproduction = PARAM.BR_AGE;
                    obj.migration = PARAM.H_MIGRATE_FREQ;
                    obj.current_village = varargin{1};
                    obj.speed = PARAM.H_SPD;
                    obj.pos = varargin{2};
                    obj.infected = true;
                    obj.contagiousness = PARAM.D_CONTAGIOUS;
                case 10
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
            obj.p_of_cure=PARAM.IMMUNE_STRENGTH;
        end
    end
end

