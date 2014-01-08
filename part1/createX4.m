function x4 = createX4(frequency)
	x4 = @(t) exp( 1i * 2 * pi() * frequency * t);
end