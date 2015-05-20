function options = init()

options.PopulationSize = 30 ;
options.NVars = 30 ;
options.UB = 15 ;
options.LB = -15 ;
options.CrossoverRate = 0.8 ;
options.MutationRate = 0.05 ;
options.Generations = 1000 ;
options.StallGen = 200 ;
options.Threshold = 0 ;
options.BestFitness = inf ;
options.BestIndividual = inf ;