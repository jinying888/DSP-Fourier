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
simplyFixed = applyInverseFilter(input, impulseResponse);
displayImageWithSpectrum(simplyFixed);

%%
% TODO: apply another kind of filter