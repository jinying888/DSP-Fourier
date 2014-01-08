function x3 = createX3(deltaT)
	x3 = @(t) (t == deltaT) * 1;
end