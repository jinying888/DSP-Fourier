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
	
	% Plot sampled version of the function
	figure(1);
	clf;
	hold on;
	plot(T, real(samples), '.b');
	plot(T, imag(samples), '.m');
	
	df = (1 / (b-a));
	F = (-frequency/2):df:((frequency/2) - df);
	transformed = tfour(samples');
	if plotPhase
		% Plot amplitude and phase
		figure(2);
		clf;
		plot(F, abs(transformed), '.r');
		title('Amplitude');
		figure(3);
		clf;
		plot(F, angle(transformed), '.g');
		title('Phase');
	else
		% Plot real and imaginary parts
		figure(2);
		clf;
		plot(F, real(transformed), '.r');
		title('Real part');
		figure(3);
		clf;
		plot(F, imag(transformed), '.g');
		title('Imaginary part');
	end
	
	% Plot the signal synthesized from the samples
	synthesized = tfourinv(transformed);
	figure(4);
	clf;
	hold on;
	plot(T, real(synthesized), '.c');
	plot(T, imag(synthesized), '.y');
	title('Synthesized signal');
end