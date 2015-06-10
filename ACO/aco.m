%% aco - Ant Colony Optimization algorithm
%
% This function runs the ACO algorithm over a model composed by the space of the problem
% and a quality function. Namely:
% 
% Dimensions: 		model.S.n
% Upper boundary: 	model.S.UB
% Lower boundary: 	model.S.LB
% Quality function:	model.f
% Variable struct:	model.vars
%
% sbs = aco(model)
% [sbs,gens] = aco(model)
%
% Authors: npvc, vfp
% Since: 06/04/2015
function [sbs,gens] = aco(model)

% Initialization
% -------------------------------------------------------
props = initializeProperties(model.S.n,model.S.LB,model.S.UB,model.vars) ;
T = initializePheromoneValues(props.t0,props.n,props.range) ;
sbs = props.UB*ones(props.n,1) ;
% -------------------------------------------------------

i = 0 ;
stall = 0 ;

% Main loop
% -------------------------------------------------------
while ~terminationConditions(model,sbs,props,i,stall)
	i = i + 1 ;
	stall = stall + 1 ;
	Siter = [];
	for k = 1:props.na
		s = constructSolution(T,props) ;

		% Mutation zone
		for dim = 1:length(s)
			r = rand ;
			if r < props.mutationRate
				s(dim) = props.LB + rand*(props.UB-props.LB) ;
			end % if r
		end % for i 

		% Optional (do it later)
		s = localSearch(s,props,model.f) ;

		if model.f(s) < model.f(sbs)
			sbs = s ;
			stall = 0 ;
		end % if model
		Siter = horzcat(Siter,s) ;
	end % for k
	T = applyPheromoneUpdate(T,Siter,sbs,props,model.f) ;

	% Plot best fitness graph
	% --------------------------------------------------
	xs = 1:i ;
	ys(i) = model.f(sbs) ;
	yss(i) = mean(cellfun(@model.f,num2cell(Siter,1))) ;
	plot(xs,ys)
	hold on
	plot(xs,yss,'g')
	xlabel('Generations')
	ylabel('Fitness')
	legend('Best solution','Average')
	drawnow
	% --------------------------------------------------
end % while sbs
gens = i ;
% ------------------------------------------------------

function met = terminationConditions(model,sbs,props,iter,stallTime)

met = false ;

if model.f(sbs) <= props.threshold
	met = true ;
end % of model

if iter >= props.generations
	met = true ;
end % iter

if stallTime > props.stallGen
	met = true ;
end