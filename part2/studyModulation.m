clc;
disp('==============================================');
disp('Studying modulation and demodulation on signal');

N = 16384;
a = -50;
b = 50;
disp(['Number of samples : ', num2str(N)]);
disp(['Sampling interval : [', num2str(a), '; ', num2str(b), ']']);
period = (b - a) / N;
frequency = 1 / period;

%%
disp(' ');
disp('Initial signal: s(t) = sum(n * cos(2*pi()*n*t)) with n from 1 to 4 ');
signal = generateReferenceSignal();
displaySignal(signal, N, a, b);
pause;

%%
f = 40;
disp(' ');
disp(['Modulated signal with frequency f=', num2str(f)]);
modulated = amplitudeModulation(signal, f);
displaySignal(modulated, N, a, b);
pause;

%%
disp(' ');
disp(['Demodulated signal with frequency f=', num2str(f)]);
demodulated = amplitudeDemodulation(modulated, f);
displaySignal(demodulated, N, a, b);
pause;

%%
disp(' ');
disp('Retrieving original signal by applying low-pass filter and boosting amplitude');

% Sample demodulated function
samples = sample(demodulated, N, a, b);
T = a:period:(b-period);
figure(1);
clf;
% Compute FT
df = (1 / (b-a));
F = (-frequency/2):df:((frequency/2) - df);
transformed = tfour(samples');
% Apply low-pass filter (hard-coded for now)
transformed(1, 1:(N/4)) = 0;
transformed(1, (3*N/4):N) = 0;
% Boost amplitude
transformed = transformed .* 2;
% Plot spectrum amplitude
subplot(1, 2, 2);
plot(F, abs(transformed), '.r');
title('Amplitude');

% Plot sampled version of the synthesized function
synthesized = tfourinv(transformed);
subplot(1, 2, 1);
hold on;
plot(T, real(synthesized), '-c');
plot(T, imag(synthesized), '-y');
title('Synthesized signal');