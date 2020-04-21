function val=get(c,prop_name)

%standard function to allow extraction of memory parameters from rabbit object

switch prop_name

        infected;
        contagiousness;
        
    case 'age'
       val=c.age;
    case 'sociability'
       val=c.sociability;
    case 'pos'
        val=c.pos;
    case 'speed'
         val=c.speed;
    case 'fatality'
         val=c.fatality; 
    case 'reproduction'
        val=c.reproduction;
    case 'migration'
        val=c.migration;
    case 'current_village'
        val=c.current_village;
    case 'contagiousness'
        val=c.contagiousness;
otherwise 
   error('invalid field name')
end