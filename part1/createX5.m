function x5 = createX5(length, periodic)
	if (nargin < 2) || ~periodic
		x5 = @(t) rectangle(t, length);
	else
		period = 2 * length;
		x5 = @(t) rectangle( mod( (t + (period/4)), period) - (period * (1/4)) , length );
	end;
end

function result = rectangle(t, length)
	if (t < -(length/2) || t > (length/2))
		result = 0;
	elseif length ~= 0
		result = (1 / length);
	else
		result = 1;
	end;
end