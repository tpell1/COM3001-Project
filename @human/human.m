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
    end
    
    methods
        % CONSTRUCTOR ====
        % params 
        % Sociability, age, fatality, reproduction, migration,
        % current_village, speed, pos
        function obj = human(varargin) 
            switch nargin
                case 0
                    obj.sociability = [];
                    obj.age = [];
                    obj.fatality = [];
                    obj.reproduction = [];
                    obj.migration = [];
                    obj.current_village = 1;
                    obj.speed = 0;
                    obj.pos = [];
                    obj.immunity = [];
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
            end
        end
    end
end

