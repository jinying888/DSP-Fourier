function result = sample(func, numberOfSamples, a, b)
% Returns a vector of numberOfSamples equally spaced samples,
% taken from a to b from the function func
	result = zeros(numberOfSamples, 1);
	period = (b - a) / numberOfSamples;
	
	for i = 1:numberOfSamples
		result(i) = func( (i-1) * period + a );
	end;
end