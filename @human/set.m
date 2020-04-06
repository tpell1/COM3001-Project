function c=set(c,prop_name,val)

switch prop_name
    case 'age'
        c.age=val;
    case 'sociability'
        c.sociability=val;
    case 'pos'
        c.pos=val;
    case 'speed'
        c.speed=val;
    case 'fatality'
        c.fatality=val; 
    case 'reproduction'
        c.reproduction=val;
    case 'migration'
        c.migration=val;
    case 'current_village'
        c.current_village=val;
    case 'immunity'
        c.immunity=val;
end