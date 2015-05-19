function options = survivals(options,offspring)

for i = 1:options.PopulationSize
	offspring.fitness(i) = ackleysfitnessfcn(offspring.position(i,:)) ;
end % for i

[~,idxs] = sort(offspring.fitness) ;
offspring.position = offspring.position(idxs) ;
offspring.stepsize = offspring.stepsize(idxs) ;

for i = 1:options.PopulationSize
	options.Population(i,:) = offspring.position(i) ;
	options.StepSize(i,:) = offspring.stepsize(i) ;
end % for i