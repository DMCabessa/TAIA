function offspring = recombination(options)

for i = 1:options.OffspringSize
	idxs = randperm(options.PopulationSize,2) ;
	parentA.position = options.Population(idxs(1),:) ;
	parentA.stepsize = options.StepSize(idxs(1),:) ;
	parentB.position = options.Population(idxs(2),:) ;
	parentB.stepsize = options.StepSize(idxs(2),:) ;

	for j = 1:size(options.Population,2)
		offspring.position(i,j) = (parentA.position(j) +  parentB.position(j))/2 ;
		offspring.stepsize(i,j) = (parentA.stepsize(j) +  parentB.stepsize(j))/2 ;
	end % for j
end % for i

