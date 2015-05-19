function options = init()

options.PopulationSize = 6 ;
options.CrossoverRate = 0.8 ;
options.MutationRate = 0.05 ;
options.Generations = 1000 ;
options.StallGen = 100 ;
options.BitSize = 12 ;
options.Threshold = 100 ;
options.BestFitness = inf ;
options.BestIndividual = inf ;

% Generate initial population
% --------------------------------------------------------------
options.Population = randi([-2047,2047],1,options.PopulationSize) ;
% --------------------------------------------------------------