function options = mutate(options)

for i = 1:options.PopulationSize

	% Mutating step-size and individual
	% -------------------------------
	draw = normrnd(0,1) ;
	for j = 1:options.NVars
		drawi = normrnd(0,1) ;

		stepsize(i,j) = options.StepSize(i,j)*exp(options.tau_script*draw + options.tau*drawi) ;

		if stepsize(i,j) < options.epsilon
			stepsize(i,j) = options.epsilon ;
		end % if options

		population(i,j) = options.Population(i,j)+stepsize(i,j)*drawi ;
	end % for j
	% -------------------------------

	current = ackleysfitnessfcn(options.Population(i,:)) ;
	candidate = ackleysfitnessfcn(population(i,:)) ;

	if candidate <= current
		options.Population(i,:) = population(i,:) ;
		options.StepSize(i,:) = stepsize(i,:) ;
	end % if candidate

end % for i