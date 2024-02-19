function g = g_generate(antennas, angle1, angle2array)
g = sind(90*antennas*(sin(angle1)-sin(angle2array)))./sind(90*(sin(angle1)-sin(angle2array)));
g = (g.^2)/antennas;

%g function equals to m if desired user and interfering
%user are making same angles. Below code sets g function values to m in
%that case

for nan = 1:length(g)
    if(isnan(g(nan)))
        g(nan) = antennas;
    end
end