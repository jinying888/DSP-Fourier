function output = applyWienerFilter(input, reference, degradationImpulseResponse)
    % Convert images coefficient to doubles
    input = double(input);
    reference = double(reference);
    
    % Compute degradation filter transfer function
    degradationTransferFunction = fft2(degradationImpulseResponse);
    
    % Compute noise power spectrum from reference image
    Dr = fft2(reference) .* degradationTransferFunction;
    dr = ifft2(Dr);
    dq = round(dr);
    noise = dq - dr;
    noisePowerSpectrum = abs(fft2(noise)) .^ 2;
    
    % Compute reference image power spectrum
    referencePowerSpectrum = abs(fft2(reference)) .^ 2;
    
    % Compute Wiener filter transfer function
    HSquared = abs(degradationTransferFunction) .^ 2;
    noiseOverRef = noisePowerSpectrum ./ referencePowerSpectrum;
    wienerTransferFunction = (1 ./ degradationTransferFunction)...
                           .* ( HSquared ./ ( HSquared + noiseOverRef ) );
    
    % Apply Wiener filter
    output = ifft2( fft2(input) .* wienerTransferFunction );
    output = real(fftshift(output));
end