function [childA, childB] = mate(parentA, parentB, options)

chance = rand ;

if chance <= options.CrossoverRate
	crossoverPoint = rand ;

	for i = 1:options.NVars
		childA(i) = crossoverPoint * parentA(i) + (1 - crossoverPoint) * parentB(i) ;
		childB(i) = (1 - crossoverPoint) * parentA(i) + crossoverPoint * parentB(i) ;
	end % for i
	
else
	childA = parentA;
	childB = parentB;
end % if chance