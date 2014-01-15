function displayImageWithSpectrum(input)
	figure(1);
	clf;
	
	% Plot image in grayscale
    grayscale = ([0:255] / 255)' * [1 1 1];
	
    subplot(1, 2, 1);
    image(input);
    colormap(grayscale);
    title('Image')
    
	transformed = fft2(input);
    transformed = fftshift(transformed);
    % Use a log scale to reduce displayed dynamic range
    logTransformed = log(abs(transformed) + 1);
    maxValue = max(max(logTransformed));
    minValue = min(min(logTransformed));
    logTransformed = (logTransformed - minValue) / (maxValue - minValue);
    logTransformed = 255 * logTransformed;
    
    subplot(1, 2, 2);
    image(logTransformed);
    colormap(grayscale);
    title('Frequency representation')
end