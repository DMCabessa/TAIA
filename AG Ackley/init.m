function options = init()

options.PopulationSize = 30 ;
options.NVars = 30 ;
options.UB = 15 ;
options.LB = -15 ;
options.CrossoverRate = 0.8 ;
options.MutationRate = 0.05 ;
options.Generations = 300000 ;
options.StallGen = inf ;
options.Threshold = 0 ;
options.BestFitness = inf ;
options.BestIndividual = inf ;