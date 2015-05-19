function [fitness,individual,gens] = ee()

fprintf('\nGenerating population...')

% Generate initial variables
% --------------------------------------------------------------
options = init() ;
timeSinceLastImprove = 0 ;
exitFlag = 0 ;
% --------------------------------------------------------------

% Generate initial population
% --------------------------------------------------------------
options.Population = options.LB + (-options.LB+options.UB).*rand(options.PopulationSize,options.NVars) ;
options.StepSize = rand(options.PopulationSize,options.NVars) ;
% options.Population.Rotation = ? ;
% --------------------------------------------------------------

% Start function loop
% --------------------------------------------------------------

fprintf('\nStarting evolution...')

for i = 1:options.Generations
	% Evaluate fitness of population and stop clauses
	% --------------------------------------------------------------
	for j = 1:options.PopulationSize
		options.FitnessValues(j) = ackleysfitnessfcn(options.Population(j,:)) ;
	end % for j
	[minvalue,minindex] = min(options.FitnessValues) ;

	% Check if best fitness is below a certain threshold
	if minvalue <= options.Threshold
		options.BestFitness = minvalue ;
		options.BestIndividual = options.Population(minindex,:) ;
		exitFlag = 1;
	end % if minvalue

	% Check last time best fitness has been increased
	if minvalue < options.BestFitness
		%fprintf('(%d)',options.Population(minindex))
		options.BestFitness = minvalue ;
		options.BestIndividual = options.Population(minindex) ;
		timeSinceLastImprove = 0 ;
	else
		timeSinceLastImprove = timeSinceLastImprove + 1 ;
		if timeSinceLastImprove >= options.StallGen
			exitFlag = 2;
		end % if timeSinceLastImprove
	end % if minvalue

	if exitFlag > 0
		break ;
	end % if exitFlag
	% --------------------------------------------------------------

	% Mutation zone
	% ----------------------------------------------------------
	options = mutate(options) ;
	% ----------------------------------------------------------

	% Recombination zone
	% ----------------------------------------------------------
	offspring = recombination(options) ;
	% ----------------------------------------------------------

	% Survival selection
	% ----------------------------------------------------------
	options = survivals(options,offspring) ;
	% ----------------------------------------------------------	

end % for i

if i == options.Generations
	exitFlag = 3;
end % if i

fitness = options.BestFitness ;
individual = options.BestIndividual ;
gens = i ;

generateOutputMessage(exitFlag, i, options) ;