function output = applyInverseFilter(input, filterImpulseResponse)
    % Convert image coefficient to doubles
    input = double(input);
    
    % Compute filter transfer function
    transferFunction = fft2(filterImpulseResponse);
    % Compute Wiener filter transfer function
    inverseTransferFunction = (1 ./ transferFunction);
    
    % Apply the inverse filter
    output = ifft2( fft2(input) .* inverseTransferFunction );
    output = real(fftshift(output));
end