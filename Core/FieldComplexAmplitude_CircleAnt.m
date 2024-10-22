function  [E_azimuth, E_3D] = FieldComplexAmplitude_CircleAnt(azimuth,zenith,d,M,initPhase)

    R = d/(2*sin(pi/M));
    E_3D = 0; E_azimuth = 0;

    % Calculation superposition of the field
    [AZIMUTH, ZENITH] = meshgrid(azimuth, zenith);
    for m = 0:M
        E_azimuth = E_azimuth + exp(1i*(2*pi*R*cos(azimuth - 2*pi*(m-1)/M) + initPhase));
        E_3D = E_3D + exp(1i*(2*pi*R*cos(AZIMUTH - 2*pi*(m-1)/M).*sin(ZENITH) + initPhase));
    end

end