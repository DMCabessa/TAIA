function options = mutate(options)

for i = 1:options.PopulationSize

	% Mutating step-size and individual
	% -------------------------------
	draw = normrnd(0,1) ;
	for j = 1:options.NVars
		drawi = normrnd(0,1) ;

		options.StepSize(i,j) = options.StepSize(i,j)*exp(options.tau_script*draw + options.tau*drawi) ;

		if options.StepSize(i,j) < options.epsilon
			options.StepSize(i,j) = options.epsilon ;
		end % if options

		options.Population(i,j) = options.Population(i,j)+options.StepSize(i,j)*drawi ;
	end % for j
	% -------------------------------

end % for i