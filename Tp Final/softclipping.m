function [x] = softclipping(op,x)
	n = length(x);
	switch (op)
        case 1 % TSQ Two Stage Quadratric 
           %optimizado para matlab
           %la otra forma se quebaba en "busy"
            x(find( abs(x) >= (1/3) & abs(x) <= 2/3))=sign(x(find( abs(x) >= (1/3) & abs(x) <= 2/3))).*((1/3).*(3-(2-(3*abs(x(find( abs(x) >= (1/3) & abs(x) <= 2/3))).^2))));
			x(find( x > (-1/3) & x <= 1/3))=2.*x(find( x > (-1/3) & x <= 1/3));
            x(find( abs(x) > 2/3))=sign( x(find( abs(x) > 2/3)));
%             for i = 1:n
%                 %find( abs(pmono_2) >= (1/3) & abs(pmono_2 <= 2/3))
% 				if(abs(x(i)) >= 1/3 && abs(x(i)) <= 2/3)
% 					y(i)= sign(x(i))*(3 - (2 - 3*abs(x(i)))^2)/3;
%                     cont=cont+1;
% 				else if(x(i) > -1/3 && x(i) < 1/3)
% 						y(i)=2*x(i);
%                     else
% 						y(i)= sign(x(i));
% 					end
% 				end
% 			end
%         case 2 %EXP 5
%falta 
% 			for i = 1:n
% 				if(x(i) >= -2/3 && x(i)<= 2/3)
% 					y(i)= sign(x(i))*(1 - abs( 1.5*x(i) - sign(x(i)) )^5);
% 				else
% 					y(i)= sign(x(i));
% 				end
% 			end
%         case 3 % Sinusoidal
%falta
% 			for i = 1:n
% 				if(x(i) >= -2/3 && x(i) <= 2/3)
% 					y(i)= sin((3/4)*pi*x(i));
% 				else
% 					y(i)= sign(x(i));
% 				end
% 			end
         case 4 % James Johnston
             %optimizado para matlab
 			y = x ./ ( (2.5 .*abs(x)) + 1);
    end
end
		
