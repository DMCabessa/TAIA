function [fitness,individual,gens] = ags()

fprintf('\nGenerating population...')

% Generate initial variables
% --------------------------------------------------------------
options = init() ;
timeSinceLastImprove = 0 ;
exitFlag = 0 ;
% --------------------------------------------------------------

% Generate initial population
% --------------------------------------------------------------
options.Population = randi([-2047,2047],1,options.PopulationSize) ;
% --------------------------------------------------------------

% Start function loop
% --------------------------------------------------------------
options.RelativeFitness = zeros(1,options.PopulationSize) ;
options.CumulativeFitness = zeros(1,options.PopulationSize) ;

fprintf('\nStarting evolution...')

for i = 1:options.Generations

	% Evaluate fitness of population and stop clauses
	% --------------------------------------------------------------
	options.FitnessValues = arrayfun(@fitnessfcn,options.Population) ;
	[minvalue,minindex] = min(options.FitnessValues) ;

	% Check if best fitness is below a certain threshold
	if minvalue < options.Threshold
		options.BestFitness = minvalue ;
		options.BestIndividual = options.Population(minindex) ;
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

	total = sum(options.FitnessValues) ;
	options.RelativeFitness = options.FitnessValues./total ;
	options.CumulativeFitness(1) = options.RelativeFitness(1) ;

	% Generate cumulative fitness
	for j = 2:options.PopulationSize
		options.CumulativeFitness(j) = options.CumulativeFitness(j-1) + options.RelativeFitness(j) ;
	end % for j

	% Convert phenotype to genotype
	for j = 1:options.PopulationSize
		temp(j,:) = tobit(options.Population(j),options.BitSize) ;
	end % for j
	options.Population = temp; 

	% Start mate pool
	% ----------------------------------------------------------	
	offidx = 1 ;

	for j = 1:floor(options.PopulationSize/2)
		parentA = roulette_wheel(options) ;
		parentB = roulette_wheel(options) ;
		while parentB == parentA
			parentB = roulette_wheel(options) ;
		end % while parentB

		[childA, childB] = mate(parentA, parentB, options) ;
		offspring(offidx,:) = childA ;
		offidx = offidx + 1;
		offspring(offidx,:) = childB ;
		offidx = offidx + 1;
	end % for j
	% ----------------------------------------------------------

	% Mutation zone
	% ----------------------------------------------------------
	for j = 1:options.PopulationSize
		offspring(j,:) = mutate(offspring(j,:), options) ;
	end % for j
	% ----------------------------------------------------------

	% New generation is equal to the offspring
	options.Population = offspring ;

	% Convert genotype to phenotype
	for j = 1:options.PopulationSize
		aux(j) = todec(options.Population(j,:),options.BitSize) ;
	end % for j
	options.Population = aux ; 

end % for i
% --------------------------------------------------------------

if i == options.Generations
	exitFlag = 3;
end % if i

fitness = options.BestFitness ;
individual = options.BestIndividual ;
gens = i ;

generateOutputMessage(exitFlag, i, options) ;
		