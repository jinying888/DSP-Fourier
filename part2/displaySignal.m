function displaySignal(func, numberOfSamples, a, b)
% Sample the given signal
% and display its spectrum (amplitude / phase or real / imaginary)
	period = (b - a) / numberOfSamples;
	frequency = 1 / period;
	
	samples = sample(func, numberOfSamples, a, b);
	T = a:period:(b-period);
	
	figure(1);
	clf;
	
	% Plot sampled version of the function
	subplot(1, 2, 1);
	hold on;
	plot(T, real(samples), '-b');
	plot(T, imag(samples), '-m');
	
	df = (1 / (b-a));
	F = (-frequency/2):df:((frequency/2) - df);
	transformed = tfour(samples');
    % Plot amplitude and phase
    subplot(1, 2, 2);
    plot(F, abs(transformed), '.r');
    title('Amplitude');
end