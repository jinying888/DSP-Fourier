function modulatedFunction = amplitudeModulation(signal, frequency)
    modulatedFunction = @(t) signal(t) * cos( 2 * pi() * frequency * t);
end