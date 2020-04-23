classdef human
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        sociability;
        age;
        fatality;
        migration;
        pos;
        current_village;
        immunity;
        infected;
    end
    
    methods
        % CONSTRUCTOR ====
        % params 
        % Sociability, age, fatality, reproduction, migration,
        % current_village, speed, pos
        function obj = human(varargin)
            global PARAM;
            
            switch nargin
                case 0
                    obj.sociability = PARAM.SOCIABILITY;
                    obj.age = 0;
                    obj.fatality = PARAM.MORTALITY;
                    obj.migration = PARAM.H_MIGRATE_FREQ;
                    obj.current_village = 1;
                    obj.pos = [];
                    obj.immunity = false;
                    obj.infected = false;
                case 2
                    obj.sociability = PARAM.SOCIABILITY;
                    obj.age = 0;
                    obj.fatality = PARAM.MORTALITY;
                    obj.migration = PARAM.H_MIGRATE_FREQ;
                    obj.current_village = varargin{1};
                    obj.pos = varargin{2};
                    obj.immunity = false;
                    obj.infected = false;
                case 3
                    obj.sociability = PARAM.SOCIABILITY;
                    obj.age = varargin{2};
                    obj.fatality = PARAM.MORTALITY;
                    obj.migration = PARAM.H_MIGRATE_FREQ;
                    obj.current_village = varargin{1};
                    obj.pos = varargin{3};
                    obj.immunity = true;
                    obj.infected = false;
                case 7
                    obj.sociability = varargin{1};
                    obj.age = varargin{2};
                    obj.fatality = varargin{3};
                    obj.migration = varargin{4};
                    obj.current_village = varargin{5};
                    obj.pos = varargin{6};
                    obj.immunity = varargin{7};
                    obj.infected = false;
            end
        end
    end
end

