function output = applyFilter(input, filterImpulseResponse, inverse)
	if (nargin < 3)
		inverse = false;
	end;

    % Convert image coefficient to doubles
    input = double(input);
    
    % Compute filter transfer function
    transferFunction = fft2(filterImpulseResponse);
	if inverse
		transferFunction = (1 ./ transferFunction);
	end;
	
    % Apply the filter
    output = ifft2( fft2(input) .* transferFunction );
    output = real(fftshift(output));
end