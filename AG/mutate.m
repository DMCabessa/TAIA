function individual = mutate(child, options)

for i = 1:length(child)
	val = rand ;
	if val <= options.MutationRate 
		child(i) = -2047 + (2047+2047).*rand ;
		end % if child
	end % if val
end % for i

individual = child ;