function decimal = todec(bits, bitSize)
	
signalBit = bits(1) ;

decimal = bin2dec(bits(2:bitSize)) ;

if signalBit == '1'
	decimal = -decimal ;
end % if signalBit