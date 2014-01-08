function x1 = createX1(frequency)
	x1 = @(t) cos( 2 * pi() * frequency * t);
end