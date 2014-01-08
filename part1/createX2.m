function x2 = createX2(frequency)
	x2 = @(t) sin( 2 * pi() * frequency * t);
end