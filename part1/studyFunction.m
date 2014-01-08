function studyFunction(func, numberOfSamples, a, b, plotPhase)
% Sample a function, compute its DFT
% and plot both the original function and its spectrum
	if (nargin < 5)
		plotPhase = true;
	end
	
	period = (b - a) / numberOfSamples;
	disp(['Sampling period : ', num2str(period)]);
	frequency = 1 / period;
	disp(['Sampling frequency :', num2str(frequency)]);
	
	samples = sample(func, numberOfSamples, a, b);
	T = a:period:(b-period);
	
	figure(1);
	clf;
	
	% Plot sampled version of the function
	subplot(2, 2, 1);
	hold on;
	plot(T, real(samples), '.b');
	plot(T, imag(samples), '.m');
	
	df = (1 / (b-a));
	F = (-frequency/2):df:((frequency/2) - df);
	transformed = tfour(samples');
	if plotPhase
		% Plot amplitude and phase
		subplot(2, 2, 2);
		plot(F, abs(transformed), '.r');
		title('Amplitude');
		
		subplot(2, 2, 4);
		plot(F, angle(transformed), '.g');
		title('Phase');
	else
		% Plot real and imaginary parts
		subplot(2, 2, 2);
		plot(F, real(transformed), '.r');
		title('Real part');
		
		subplot(2, 2, 4);
		plot(F, imag(transformed), '.g');
		title('Imaginary part');
	end
	
	% Plot the signal synthesized from the samples
	synthesized = tfourinv(transformed);
	
	subplot(2, 2, 3);
	hold on;
	plot(T, real(synthesized), '.c');
	plot(T, imag(synthesized), '.y');
	title('Synthesized signal');
end