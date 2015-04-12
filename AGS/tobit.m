function bits = tobit(decimal, bitSize)
	
if decimal < 0
	signalBit = '1' ;
else 
	signalBit = '0' ;
end % of decimal

bits = dec2bin(abs(decimal),(bitSize-1)) ;

bits = strcat(signalBit,bits) ;