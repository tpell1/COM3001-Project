function array = create_villages(n)

% function that creates an array of village objects ([coord, radi])

global ENV_DATA
array=cell(n, 2);
array(1, :)={[1,1],3};
array(2, :)={[5,8],1};
array(3, :)={[5,5],2};
array(4, :)={[7,8],1};
