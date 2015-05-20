function parent = getAny(options,parentA)

idx = randi(options.PopulationSize) ;

if options.Population(idx) ~= parentA
	parent = options.Population(idx) ;
elseif idx < options.PopulationSize
	parent = options.Population(idx+1) ;
else
	parent = options.Population(1) ;
end