function generateOutputMessage(flag, generations, options)

if flag == 1
	fprintf('Fitness of best individual achieved a minimal threshold of %d after %d generations.\n',options.Threshold,generations)
elseif flag == 2
	fprintf('Best fitness did not improve after %d generations, running over %d generations.\n',options.StallGen, generations)
elseif flag == 3
	fprintf('Execution reached maximum of %d generations.\n',options.Generations)
end % flag