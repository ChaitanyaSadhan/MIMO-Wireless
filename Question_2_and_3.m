%computing SE_LoS, SE-LoS with closed form formula. (QUESTION 2)


%The code of this function is present in Q2function.m file
[SE_LoS, SE_nLoS, M] = Q2function(); 

%computing SE_LoS, SE-LoS by averaging. (QUESTION 3)

%for nLoS case. 
%the code is present in Q32function.m file
[Avg_SE_nLoS] = Q32function();

%for LoS case. 
%the code is present in Q31function.m file

[Avg_SE_LoS] = Q31function();


%plotting all the four plots.
figure;
hold on; box on;

plot(M,mean(SE_LoS,2),'k-','LineWidth',1);
plot(M,mean(Avg_SE_LoS,2),'b-','LineWidth',1);

plot(M,SE_nLoS,'r--','LineWidth',1);
plot(M,mean(Avg_SE_nLoS,2),'k-','LineWidth',1);



xlabel('Number of antennas (M)');
ylabel('Average SE [bit/s/Hz]');

legend('SE LoS', 'Avg SE LoS', 'SE nLoS', 'Avg SE nLoS', 'Location','northwest')
