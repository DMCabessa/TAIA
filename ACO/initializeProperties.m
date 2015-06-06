%% initializeProperties - Creates a structure with the basic parameters for aco
%
% props = initializeProperties(dim,lb,ub)
%
% See also INITIALIZEPHEROMONEVALUES
function props = initializeProperties(dim,lb,ub)

props.n = dim ;
props.UB = ub ;
props.LB = lb ;

props.t0 = 0.000001 ;
props.na = 50 ;
props.range = 80 ;
props.alpha = 1 ;
props.ro = 0.9 ;
props.Q = 20 ;
props.threshold = 0.1 ;
props.mutationRate = 0.01 ;
props.generations = 1000 ;
props.stallGen = ceil(props.generations/3) ;

% Create a vector of range+1 positions from LB to UB
for j = 1:props.range+1
	props.b(j) = props.LB+((props.UB-props.LB)/props.range)*(j-1) ;
end % for j