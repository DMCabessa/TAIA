%% initializeProperties - Creates a structure with the basic parameters for aco
%
% props = initializeProperties()
%
% See also INITIALIZEPHEROMONEVALUES
function props = initializeProperties()

props.t0 = 0.000001 ;
props.n = 20 ;
props.na = 50 ;
props.UB = 15 ;
props.LB = -15 ;
props.range = 40 ;
props.alpha = 1 ;
props.ro = 0.9 ;
props.Q = 20 ;

% Create a vector of range+1 positions from LB to UB
for j = 1:props.range+1
	props.b(j) = props.LB+((props.UB-props.LB)/props.range)*(j-1) ;
end % for j

props.threshold = 0.1 ;