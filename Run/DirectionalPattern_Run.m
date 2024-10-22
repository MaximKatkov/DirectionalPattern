function DirectionalPattern_Run(config, output)
        
%% CONFIGURATION

antennaType = config.antennaType;
M = config.numAntenna;
d = config.antSpLambda;% antenna spacing in wavelength
initPhase = config.initialPhase;
azimuth = linspace(-pi, pi, 360);
zenith = linspace(0, pi, 180);
E_azimuth = 0;
R = d/(2*sin(pi/M));

%% Calculation the complex amplitude of the field.

switch antennaType
    case {'CircularAntenna'}
          [E_azimuth, E_3D] = FieldComplexAmplitude_CircleAnt(azimuth,zenith,d,M,initPhase);
    case {'LinearAntenna'}
          [E_azimuth, E_3D] = FieldComplexAmplitude_LinearAnt(azimuth,zenith,d,M,initPhase);
    otherwise
        error('This antenna is not supported')
end


%% Calculation the normalized directional pattern.

D_azimuth = abs(E_azimuth).^2 ./ max(abs(E_azimuth).^2);
D_3D = abs(E_3D).^2 ./ max(abs(E_3D).^2);

%% Plotting 

[AZIMUTH, ZENITH] = meshgrid(azimuth, zenith);

subplot(1,2,2);polarplot(azimuth, D_azimuth);title('Directional pattern polar');
subplot(1,2,1);plot(azimuth.*180./pi,D_azimuth); title('Directional pattern azimuth plane'); xlabel('\theta \circ'); ylabel('D(\theta)'); grid on;
% subplot(1,2,1);patternCustom(AZIMUTH,ZENITH, D_3D);
% subplot(1,2,1);plot3(AZIMUTH,ZENITH, D_3D);

end