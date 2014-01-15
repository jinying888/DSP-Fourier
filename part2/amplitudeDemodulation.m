function modulatedSignal = amplitudeDemodulation(modulated, modulationFrequency)
% Retrieves the original signal from an amplitude modulated signal
    modulatedSignal =  @(t) modulated(t) * cos( 2 * pi() * modulationFrequency * t);
end