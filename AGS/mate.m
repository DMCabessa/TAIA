function [childA, childB] = mate(parentA, parentB, options)

chance = rand ;

if chance <= options.CrossoverRate
	crossoverPoint = randi([1,options.BitSize-1]) ;

	childA = strcat(parentA(1:crossoverPoint),parentB(crossoverPoint+1:options.BitSize)) ;
	childB = strcat(parentB(1:crossoverPoint),parentA(crossoverPoint+1:options.BitSize)) ;
else
	childA = parentA;
	childB = parentB;
end % if chance