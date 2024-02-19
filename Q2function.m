function [SE_LoS, SE_nLoS, M] = Q2function()
    %initializing of constants.

    SNRo = 1; %0dB is equal to 1 in linear scale
    Bbar = 1e-1; %interference to desired gain ratio
    M = 10:100; % number of antennas ranging from 10 to 100

    %number of random angles
    numofangles = 10000;

    %realizing desired user angles say Sio.
    Sio = 2*pi*rand(1,numofangles); 

    %realizing interference user angles say Si1.
    Si1 = 2*pi*rand(1, numofangles);

    %declaring array of zeros, which later can be filled with SE values.
    SE_LoS = zeros(length(M), numofangles);
    SE_nLoS = zeros(1, length(M));

    %computing argument to calculate the g function later.
    %diff_of_angles = sin(Sio)-sin(Si1);

    %calculating g function.
    for i = 1:length(M)
        m = M(i);
        
        %calculating g function
        %code is present in g_generate.m file
        g = g_generate(m,Sio, Si1);

        %calculating SE_LoS.
        %disp(m)
        SE_LoS(i,:) = log2(1 + m./(Bbar*g + (1/SNRo)));
    
        %calculating SE_nLoS
        SE_nLoS(i) = log2(1+(m-1)./(Bbar + (1/SNRo)));

    end


end