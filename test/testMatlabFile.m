clear;
clc;

antenna = phased.ShortDipoleAntennaElement(...
    'FrequencyRange',[1e9,10e9],...
    'AxisDirection','Z');
array = phased.UCA('NumElements',8,'Radius',6.85e-2,'Element',antenna);
fc = 5.944e9;
ang = [0;0];
resp = array(fc,ang);
disp(resp.V)
c = physconst('LightSpeed');
figure(2)
subplot(1,2,1);pattern(array,fc,[-180:180],0,'Type','directivity','PropagationSpeed',c);

subplot(1,2,2);pattern(array,fc,[0],[-90:90],'Type','directivity','PropagationSpeed',c)


