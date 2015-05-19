function options = init()

options.PopulationSize = 6 ;
options.NVars = 30 ;
% Not used by now
% options.KVars = option.NVars*(options.NVars-1)/2 ;
options.UB = 15 ;
options.LB = -15 ;
options.Generations = 1000 ;
options.StallGen = 100 ;
options.Threshold = 0 ;

% Params for mutation
options.tau = 1/sqrt(2*sqrt(options.NVars)) ;
options.tau_script = 1/sqrt(2*options.NVars) ;
options.epsilon = 0.1 ;