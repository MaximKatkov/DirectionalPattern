function  [E_azimuth, E_zenith, E_3D] = FieldComplexAmplitude_CircleAnt(azimuth,zenith,d,M,initPhase)

    R = d/(2*sin(pi/M));
    E_3D = 0; E_azimuth = 0; E_zenith=0;
   

    % Calculation superposition of the field
    [ZENITH, AZIMUTH] = meshgrid(zenith, azimuth);
    for m = 1:M
        E_azimuth = E_azimuth + exp(1i*(2*pi*R*cos(azimuth - 2*pi*(m-1)/M) + initPhase));
        E_zenith = E_zenith + exp(1i*(2*pi*R*cos(2*pi*(m-1)/M).*sin(zenith) + initPhase));
        E_3D = E_3D + exp(1i*(2*pi*R*cos(AZIMUTH - 2*pi*(m-1)/M).*sin(ZENITH) + initPhase));
    end
 
    % E_3D1 = zeros(360,360);X = zeros(360,360); Y= zeros(360,360); Z = zeros(360,360);
    % for azim = 1:numel(azimuth)
    %     for zen = 1:numel(zenith)
    %         for m = 1:M
    %             E_3D1(azim,zen) =  E_3D1(azim,zen) + exp(1i*(2*pi*R*cos(azimuth(azim) - 2*pi*(m-1)/M).*sin(zenith(zen)) + initPhase));
    %             X(azim,zen) = cos(azimuth(azim)).*sin(zenith(zen));
    %             Y(azim,zen) = sin(azimuth(azim)).*sin(zenith(zen));
    %             Z(azim,zen) = cos(zenith(zen));
    %         end
    %     end
    % end

end