clc;
disp('===============================================');
disp('Studying functions x0(t) through x6(t) and g(t)');

N = 16384;
a = -50;
b = 50;
disp(['Number of samples : ', num2str(N)]);
disp(['Sampling interval : [', num2str(a), '; ', num2str(b), ']']);

%%
constant = 42;
disp(' ');
disp(['x0(t) = constant function of value ', num2str(constant)]);
studyFunction(createX0(constant), N, a, b);
pause;

%%
frequency = 0.02;
disp(' ');
disp(['x1(t) = cos of frequency ', num2str(frequency)]);
studyFunction(createX1(frequency), N, a, b);
pause;

%%
disp(' ');
disp(['x2(t) = sin of frequency ', num2str(frequency)]);
studyFunction(createX2(frequency), N, a, b);
pause;

%%
deltaT = ((b - a) / N) * 42;
disp(' ');
disp(['x3(t) = dirac at t = ', num2str(deltaT)]);
studyFunction(createX3(deltaT), N, a, b);
pause;

%%
frequency = 0.02;
disp(' ');
disp(['x4(t) = complex exponential of frequency ', num2str(frequency)]);
studyFunction(createX4(frequency), N, a, b, false);
pause;

%%
length = 2;
disp(' ');
disp(['x5(t) = rectangle function of length ', num2str(length)]);
studyFunction(createX5(length), N, a, b);
pause;

%%
length = 2;
disp(' ');
disp(['x5(t) bis = periodized rectangle function of length ', num2str(length)]);
studyFunction(createX5(length, true), N, a, b);
pause;

%%
frequency = 1;
disp(' ');
disp(['x5(t) = gaussian exponential of frequency ', num2str(frequency)]);
studyFunction(createX6(frequency), N, a, b);
pause;

%% Exiting
close all;