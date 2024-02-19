function [Avg_SE_LoS,M] = Q31function()

    M = 10:100; %number of antennas ranging from 10 to 100.
    Dh = 1/2; %antenna spacing.

    %gains of channels
    gain_desired = 1;
    gain_interference = 0.1;
    
    %number of variations of angles for one computation of C
    realisations = 10000; 

    %initializing SE_LoS with all zeros so that it can be manipulated
    %later.
    Avg_SE_LoS = zeros(length(M), realisations);

    %generating desired and interference random angles.
    desired_angles = 2*pi*rand(1,realisations);
    interference_angles = 2*pi*rand(1,realisations);

    for iter = 1:length(M)  
        %iterating through each variation of the angles.
        disp(['computing ',num2str(M(iter)),' th antenna case.']);
        for variation = 1:realisations
            %calculating the fundamental exponents of both the channels.
            desired_exponent = exp(1i*(2*pi*Dh*sin(desired_angles(variation))));
            interference_exponent = exp(1i*(2*pi*Dh*sin(interference_angles(variation))));

            %initialising channels with zeros.
            desired_channel = zeros(M(iter),1);
            interference_channel = zeros(M(iter),1);

            %generating the channels vectors.
            for phase = 1:M(iter)
                desired_channel(phase) = sqrt(gain_desired)*desired_exponent^(phase-1);
                interference_channel(phase) = sqrt(gain_interference)*interference_exponent^(phase-1);
            end

            %at this point we have obtained both the channels.
            %computing the bound.

            term1 = norm(desired_channel)^2;
            term2 = (abs(desired_channel'*interference_channel))^2;

            Avg_SE_LoS(iter,variation) = log2(1 + term1/((term2/term1) + 1));


        end  
        

    end


   





end