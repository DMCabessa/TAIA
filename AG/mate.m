function [childA, childB] = mate(parentA, parentB, options)

chance = rand ;

if chance <= options.CrossoverRate
	crossoverPoint = rand ;

	childA = crossoverPoint * parentA + (1 - crossoverPoint) * parentB ;
	childB = (1 - crossoverPoint) * parentA + crossoverPoint * parentB ;
else
	childA = parentA;
	childB = parentB;
end % if chance