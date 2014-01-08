function g = createG(frequency, df)
	sin1 = createX2(frequency);
	sin2 = createX2(frequency + df);
	sin3 = createX2(frequency + 2 * df);
	g = @(t) - sin1(t) + sin2(t) + sin3(t);
	
	% Frequency that results in overlap : 156.34 = Fe - (10 + 5)/2
end