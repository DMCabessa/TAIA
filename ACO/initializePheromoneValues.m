%% initializePheromoneValues - Start pherormone values constant
%
% T = initializePheromoneValues(t0,n,range)
%
% See also INITIALIZEPROPERTIES
function T = initializePheromoneValues(t0,n,range)

T = t0*ones(n,range) ;