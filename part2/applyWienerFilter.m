function output = applyWienerFilter(input, reference, degradationImpulseResponse)
    % Convert images coefficient to doubles
    input = double(input);
    reference = double(reference);
    
    % Compute degradation filter transfer function
    degradationTransferFunction = fftshift(fft2(degradationImpulseResponse));
    
    % Compute noise power spectrum from reference image
    Dr = fftshift(fft2(reference)) .* degradationTransferFunction;
    dr = ifft2(fftshift(Dr));
    dq = round(dr);
    noise = dq - dr;
    noisePowerSpectrum = abs(fftshift(fft2(noise)));
    
    % Compute reference image power spectrum
    referencePowerSpectrum = abs(fftshift(fft2(reference)));
    
    % Compute Wiener filter transfer function
    HSquared = abs(degradationTransferFunction) .^ 2;
    noiseOverRef = noisePowerSpectrum ./ referencePowerSpectrum;
    wienerTransferFunction = (1 ./ degradationTransferFunction)...
                           .* ( HSquared ./ ( HSquared + noiseOverRef ) );
    
    % Apply Wiener filter
    output = ifft2( fftshift(fft2(input)) .* wienerTransferFunction );
    output = real(fftshift(output));
end