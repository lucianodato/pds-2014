function [y] = softclipping(op,K,x)
	n = length(x);
	switch (op)
		case 1 % TSQ Two Stage Quadratric 
			for i = 1:n
				if(abs(x(i)) >= 1/3 && abs(x(i)) <= 2/3)
					y(i)= sign(x(i))*(3 - (2 - 3*abs(x(i)))^2)/3;
				else if(x(i) > -1/3 && x(i) < 1/3)
						y(i)=2*x(i);
					else
						y(i)= sign(x(i));
					endif
				endif
			endfor
		case 2 %EXP 5
			for i = 1:n
				if(x(i) >= -2/3 && x(i)<= 2/3)
					y(i)= sign(x(i))*(1 - abs( 1.5*x(i) - sign(x(i)) )^5);
				else
					y(i)= sign(x(i));
				endif
			endfor
		case 3 % Sinusoidal
			for i = 1:n
				if(x(i) >= -2/3 && x(i) <= 2/3)
					y(i)= sin((3/4)*pi*x(i));
				else
					y(i)= sign(x(i));
				endif
			endfor
		case 4 % James Johnston
			for i = 1:n
				y(i) = x(i) / (K*abs(x(i)) + 1);
			endfor
	endswitch
endfunction
