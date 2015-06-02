function T = applyPheromoneUpdate(T,Siter,sbs,props)

Supd = Siter ;

for i = 1:size(T,1)
	for j = 1:size(T,2)
		T(i,j) = (1-props.ro) * T(i,j) + (props.ro/Supd) ...
	end % for j
end % for i