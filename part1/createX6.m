function x6 = createX6(parameter)
	x6 = @(t) exp(- pi() * t^2 * parameter);
end