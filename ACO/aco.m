function sbs = aco(model)

% Initialization
% -------------------------------------------------------
props = initializeProperties() ;
T = initializePheromoneValues(props.t0,props.n,props.range) ;
sbs = props.UB*ones(props.n,1) ;
% -------------------------------------------------------

i = 0 ;

% Main loop
% -------------------------------------------------------
while model.f(sbs) > props.threshold
	i = i + 1 ;
	Siter = [];
	for k = 1:props.na
		s = constructSolution(T,props) ;

		% Mutation zone
		for dim = 1:length(s)
			r = rand ;
			if r < 0.01
				s(dim) = props.LB + rand*(props.UB-props.LB) ;
			end % if r
		end % for i 

		% Optional (do it later)
		% s = localSearch(s) ;

		if model.f(s) < model.f(sbs)
			sbs = s ;
		end % if model
		Siter = horzcat(Siter,s) ;
	end % for k
	T = applyPheromoneUpdate(T,Siter,sbs,props,model.f) ;

	% Plot best fitness graph
	%
	xs = 1:i ;
	ys(i) = model.f(sbs) ;
	plot(xs,ys)
	xlabel('Generations')
	ylabel('Best fitness')
	drawnow
	%}
end % while sbs
% ------------------------------------------------------