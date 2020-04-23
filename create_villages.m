function array = create_villages(n)

% function that creates a cellarray of village objects ({coord, radi})
% n - number of villages to create (n is define in global PARAM)
% output
% coord [x,y] - coordinates of village
% radius - radius of village (not used at the moment)

global ENV_DATA
array=cell(n,2);

for i=1:n
    clash=true;
  
    array{i, 2}=1
    array{i,1}=zeros(2);
    while clash                             %get coordinates that have not been
        x=randi([1,ENV_DATA.bm_size]);      %used before for a village
        y=randi([1,ENV_DATA.bm_size]);
        
        if i==1 
            clash=false;
            array(i, 1)={[x,y]}; 
        else
            for j=1:i-1
                if x==array{j,1}(1)|y==array{j,1}(2)
                    clash=true;
                else
                    clash=false;
                    array(i, 1)={[x,y]}; 
                end
            end
        end
    end
end
