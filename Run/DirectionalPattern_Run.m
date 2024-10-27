function DirectionalPattern_Run(config, output)
        
%% CONFIGURATION

antennaType = config.antennaType;
M = config.numAntenna;
d = config.antSpLambda;
initPhase = config.initialPhase;
azimuth = linspace(0, 2*pi, 360);
zenith = linspace(-pi, pi, 360);

% M = 8;
d = 0.01;

%% Calculation the complex amplitude of the field.

switch antennaType
    case {'CircularAntenna'}
          [E_azimuth, E_zenith, E_3D] = FieldComplexAmplitude_CircleAnt(azimuth,zenith,d,M,initPhase);
    case {'LinearAntenna'}
          [E_azimuth, E_zenith, E_3D] = FieldComplexAmplitude_LinearAnt(azimuth,zenith,d,M,initPhase);
    otherwise
        error('This antenna is not supported')
end


%% Calculation the normalized directional pattern.
% 
D_azimuth = abs(E_azimuth).^2 ./ max(abs(E_azimuth).^2);
D_zenith = abs(E_zenith).^2 ./ max(abs(E_zenith).^2);
% D_3D = abs(E_3D).^2 ./ max(abs(E_3D).^2);

% D_azimuth = abs(E_azimuth).^2 ;
% D_zenith = abs(E_zenith).^2 ;

D_3D = abs(E_3D).^2 ;


%% Plotting 
[ZENITH, AZIMUTH] = meshgrid(zenith, azimuth);
X = cos(AZIMUTH).*sin(ZENITH); Y = sin(AZIMUTH).*sin(ZENITH); Z = cos(ZENITH);

figure(1)
subplot(2,2,1);polarplot(azimuth, D_azimuth);title('Directional pattern polar at azimuth plane');
subplot(2,2,2);polarplot(zenith, D_zenith);title('Directional pattern polar at zenith plane');
% subplot(2,2,3); mesh(D_3D.*X,D_3D.*Y,D_3D.*Z);grid on;axis equal;
subplot(2,2,3); patternCustom(D_3D, zenith*180/pi, azimuth/pi*180,"CoordinateSystem","polar");grid on;view(3);
subplot(2,2,4); patternCustom(D_3D, zenith*180/pi-90, azimuth/pi*180,"CoordinateSystem","polar");grid on;view(3);

% subplot(2,2,3);plot(zenith.*180./pi,D_zenith); title('Directional pattern azimuth plane'); xlabel('\theta \circ'); ylabel('D(\theta)'); grid on;



end