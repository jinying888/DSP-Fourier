clc;
disp('==============================================');
disp('Studying image restoration using Wiener filter');

path = 'imageFloue.png';
[input ~] = imread(path);

%%
disp(' ');
disp(['Displaying image that we want to restore (', path, ')']);
displayImageWithSpectrum(input);
pause;

%%
referencePath = 'imageRef.png';
[reference ~] = imread(referencePath);
disp(' ');
title(['Displaying reference image (', referencePath, ')']);
displayImageWithSpectrum(reference);
pause;

%%
disp(' ');
disp('Creating degrading filter impulse response');
impulseResponse = generateDegradingImpulseResponse(input, 3, 19);
displayImageWithSpectrum(impulseResponse);
pause;

%%
disp(' ');
disp('Applying Wiener restoration filter');
fixed = applyWienerFilter(input, reference, impulseResponse);
displayImageWithSpectrum(fixed);
pause;

%%
disp(' ');
disp('Applying simplistic restoration filter');
simplyFixed = applyFilter(input, impulseResponse, true);
displayImageWithSpectrum(simplyFixed);
pause;

%%
disp(' ');
disp('Applying square impulse-response filter to the restorated image');
squareImpulseResponse = generateDegradingImpulseResponse(input, 3, 3);
blurred = applyFilter(input, squareImpulseResponse);
displayImageWithSpectrum(blurred);
pause;

%%
disp(' ');
disp('Applying larger square impulse-response filter to the restorated image');
squareImpulseResponse = generateDegradingImpulseResponse(input, 10, 10);
blurred = applyFilter(input, squareImpulseResponse);
displayImageWithSpectrum(blurred);
pause;

%%
disp(' ');
disp('Applying very large square impulse-response filter to the restorated image');
squareImpulseResponse = generateDegradingImpulseResponse(input, 25, 25);
blurred = applyFilter(input, squareImpulseResponse);
displayImageWithSpectrum(blurred);