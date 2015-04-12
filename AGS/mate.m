function [childA, childB] = mate(parentA, parentB, options)

chance = rand ;

if chance <= options.CrossoverRate
	crossoverPoint = randi([1,options.BitSize-1]) ;

	childA = strcat(bitsA(1:crossoverPoint),bitsB(crossoverPoint+1:options.BitSize)) ;
	childB = strcat(bitsB(1:crossoverPoint),bitsA(crossoverPoint+1:options.BitSize)) ;
else
	childA = parentA;
	childB = parentB;
end % if chance