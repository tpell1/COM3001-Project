classdef human
    %UNTITLED Summary of this class goes here
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
                    obj.reproduction = PARAM.BR_AGE;
                    obj.migration = PARAM.H_MIGRATE_FREQ;
                    obj.current_village = 1;
                    obj.speed = PARAM.H_SPD;
                    obj.pos = [];
                    obj.immunity = false;
                    obj.infected = false;
                case 1
                    obj.sociability = PARAM.SOCIABILITY;
                    obj.age = 0;
                    obj.fatality = PARAM.MORTALITY;
                    obj.reproduction = PARAM.BR_AGE;
                    obj.migration = PARAM.H_MIGRATE_FREQ;
                    obj.current_village = varargin{1};
                    obj.speed = PARAM.H_SPD;
                    obj.pos = [];
                    obj.immunity = false;
                    obj.infected = false;
                case 9
                    obj.sociability = varargin{1};
                    obj.age = varargin{2};
                    obj.fatality = varargin{3};
                    obj.reproduction = varargin{4};
                    obj.migration = varargin{5};
                    obj.current_village = varargin{6};
                    obj.speed = varargin{7};
                    obj.pos = varargin{8};
                    obj.immunity = varargin{9};
                    obj.infected = false;
            end
        end
    end
end

