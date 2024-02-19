function [Avg_SE_nLoS, M] = Q32function()

    SNRo = 1; %0dB is equal to 1 in linear scale

    %var_des = 1; %variance of desired channel is 1
    %var_int = 0.1; %variance of interference channel is 0.1

    M = 10:100; %number of antennas ranging from 10 to 100

    %number of random realization of the channel coefficients
    numofvariations = 10000;

    %declaring the array of zeros, so that it can be manipulated later.
    Avg_SE_nLoS = zeros(length(M), numofvariations);

    %rayleigh fading channel coefficients with mean zero variance 1;


    for i = 1:length(M)
        m = M(i);
        
        desired_channel_coeffs = (randn(m, numofvariations) + 1j*randn(m, numofvariations))/sqrt(2);
        interference_channel_coeffs = (randn(m, numofvariations) + 1j*randn(m, numofvariations))/sqrt(2);

        for iter = 1:numofvariations
            term1 = norm(desired_channel_coeffs(:, iter))^2;
            term2 = (abs(desired_channel_coeffs(:, iter)'*interference_channel_coeffs(:, iter)))^2;
        
            Avg_SE_nLoS(i,iter) = log2(1 + term1/(0.1*(term2/term1)+1));
    
        end

        disp([num2str(m), "th antenna case."]);


    end
end