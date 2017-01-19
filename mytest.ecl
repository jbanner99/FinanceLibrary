EXPORT mytest := module
	export mult(decimal x, decimal y) := function
		return x * y;
	end;
	export div(decimal x, decimal y) := function
		return x/y;
	end;
END;
