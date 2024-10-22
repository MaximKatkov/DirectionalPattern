function  [E_azimuth, E_3D] = FieldComplexAmplitude_LinearAnt(azimuth,zenith,d,M,initPhase)

    E_3D = 0; E_azimuth = 0;
    % Calculation superposition of the phase incursion
    for m = 0:M
        E_azimuth = E_azimuth + exp(1i*(2*pi*m*d*sin(azimuth) + initPhase));
        E_3D = E_3D + exp(1i*(2*pi*m*d*sin(azimuth).*sin(zenith) + initPhase));
    end

end