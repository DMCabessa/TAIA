%% initializePheromoneValues - Starts the pherormone values with a constant t0
%
% T = initializePheromoneValues(t0,n,range)
%
% See also INITIALIZEPROPERTIES
function T = initializePheromoneValues(t0,n,range)

T = t0*ones(n,range) ;