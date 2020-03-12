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
        function obj = human(varargin) 
            switch nargin
                case 0
                    obj.sociability = [];
                    obj.age = [];
                    obj.fatality = [];
                    obj.reproduction = [];
                    obj.migration = [];
                    obj.current_village = 1;
                    obj.speed = [];
                    obj.pos = [];
                    obj.infected = [];
                    obj.contagiousness = [];
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

