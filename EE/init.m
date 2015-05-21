function options = init()

options.PopulationSize = 30 ;
options.OffspringSize = 7 * options.PopulationSize ;
options.NVars = 30 ;
% Not used by now
% options.KVars = option.NVars*(options.NVars-1)/2 ;
options.UB = 15 ;
options.LB = -15 ;
options.Generations = 300000 ;
options.StallGen = inf;
options.Threshold = 0.1 ;
options.BestFitness = inf ;
options.BestIndividual = inf ;

% Params for mutation
options.tau = 1/sqrt(2*sqrt(options.NVars)) ;
options.tau_script = 1/sqrt(2*options.NVars) ;
options.epsilon = 0.01 ;