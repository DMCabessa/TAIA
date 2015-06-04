function s = constructSolution(T,props)

for i = 1:props.n
	summation = sum(T(i,:)) ;
	for j = 1:props.range
		p(i,j) = T(i,j) / summation ;
	end % for j

	r = rand ;
	count = 0 ;
	for j = 1:props.range
		count = count + p(i,j) ;
		if count > r
			break
		end % if i
	end % for j

	s(i) = U(props.b(j),props.b(j+1)) ;
end % for i

s = s' ;

function r = U(UB,LB)
	r = LB + rand*(UB-LB) ;