function  [E_azimuth, E_zenith, E_3D] = FieldComplexAmplitude_LinearAnt(azimuth,zenith,d,M,initPhase)

    E_3D = 0; E_azimuth = 0; E_zenith=0;
    [AZIMUTH, ZENITH] = meshgrid(azimuth, zenith);
    % Calculation superposition of the phase incursion
    for m = 0:M
        E_azimuth = E_azimuth + exp(1i*(2*pi*m*d*sin(azimuth) + initPhase));
        E_zenith = E_zenith + exp(1i*(2*pi*m*d*sin(zenith) + initPhase));
        E_3D = E_3D + exp(1i*(2*pi*m*d*sin(AZIMUTH).*sin(ZENITH) + initPhase));
    end

end