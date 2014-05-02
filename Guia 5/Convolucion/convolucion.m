function [c] = convolucion(f,h)
	lf = length(f);%saco la longitud de la funcion
	lh = length(h);%saco la longitud del impulso
	N = max(lf,lh);% N es la longitud mayor
	
	%Como las funciones no tienen el largo necesario para poder hacer convolucion circular hago zero padding
	%Teniendo en cuenta que pasa cuando el largo es diferente entre ambas
	f=[f zeros(1,N-lf)];%es otro vector mas largo que lo contiene a f y agrega ceros al final
	h=[h zeros(1,N-lh)];

	% dos ciclos for, uno por cada sumatoria
	% ver http://cnx.org/content/m10786/latest/
	
	for n=0:N-1;
		c(n+1)=0;
		for i=0:N-1
			%para h deberia ser h(n-i) pero con el mod me evito indices negativos 
			j=mod(n-i,N);
			c(n+1)=c(n+1) + f(i+1)*h(j+1);
		endfor
	endfor
	
endfunction
