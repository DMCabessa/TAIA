% input: An instance P of a CO problem model P = (S, f,omega).
% InitializePheromoneValues(T )
% sbs ←NULL
% while termination conditions not met do
% Siter ← 0
% for j = 1, . . . , na do
% s ←ConstructSolution(T )
% if s is a valid solution then
% s ←LocalSearch(s) {optional}
% if (f (s) < f(sbs)) or (sbs = NULL) then sbs ← s
% Siter ← Siter ∪ {s}
% end if
% end for
% ApplyPheromoneUpdate(T ,Siter ,sbs)
% end while
% output: The best-so-far solution sbs

function sbs = aco(model)

props = initializeProperties() ;
T = initializePheromoneValues(props.c,props.n,props.na) ;

sbs = inf*ones(props.n,1) ;

while true
	Siter = [];
	for j = 1:props.na
		s = constructSolution(T) ;
		s = localSearch(s) ;
		if model.f(s) < model.f(sbs)
			sbs = s ;
		end % if model
		Siter = horzcat(Siter,s) ;
	end % for j
	T = applyPheromoneUpdate(T,Siter,sbs) ;
end % while true