function individual = roulette_wheel(options)

val = rand ;

for i = 1:options.PopulationSize
	if val <= options.CumulativeFitness(i)
		individual = options.Population(i) ;
		break ;
	end % if val 
end % for i