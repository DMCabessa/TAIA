function T = applyPheromoneUpdate(T,Siter,sbs,props,f)

for i = 1:props.n
	for j = 1:props.range
		for k = 1:props.na
			Lk = f(Siter(:,k)) ;
			if Siter(i,k) >= props.b(j) && Siter(i,k) <= props.b(j+1)
				delta(i,j,k) = props.Q/Lk ;
			else
				delta(i,j,k) = 0 ;
			end % if Siter
		end % for k
		T(i,j) = (1-props.ro)*T(i,j) + sum(delta(i,j,:)) ;
	end % for j
end % for i