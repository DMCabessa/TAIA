function individual = mutate(child, options)

for i = 1:options.NVars
	val = rand ;
	if val <= options.MutationRate 
		child(i) = -15 + (15+15).*rand ;
	end % if val
end % for i

individual = child ;