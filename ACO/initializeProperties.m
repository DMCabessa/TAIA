%% initializeProperties - Creates a structure with the basic parameters for aco
%
% props = initializeProperties(dim,lb,ub)
%
% See also INITIALIZEPHEROMONEVALUES
function props = initializeProperties(dim,lb,ub,vars)

props.n = dim ;
props.UB = ub ;
props.LB = lb ;

props.t0 = vars.t0 ; % 0.000001, 0.1
props.na = vars.na ; % 15, 50
props.range = vars.range ; % 40, 80
props.alpha = 1 ;
props.ro = vars.ro ; % 0.3, 0.9
props.Q = 20 ;
props.threshold = 0.1 ;
props.mutationRate = vars.mutationRate ; % 0.01, 0.1
props.generations = 1000 ;
props.stallGen = ceil(props.generations/3) ;

% Create a vector of range+1 positions from LB to UB
for j = 1:props.range+1
	props.b(j) = props.LB+((props.UB-props.LB)/props.range)*(j-1) ;
end % for j