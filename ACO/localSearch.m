function s = localSearch(s,props,f)

for i = 1:props.n
	for j = 1:props.range
		if s(i) >= props.b(j) && s(i) <= props.b(j+1)
			sleft = s ;
			sright = s ;

			sleft(i) = props.b(j) ;
			sright(i) = props.b(j+1) ;

			if f(sleft) > f(s)
				s = sleft ;
			end % if f
			if f(sright) > f(s)
				s = sright ;
			end % if f
		end % if s
	end % for j
end % for i