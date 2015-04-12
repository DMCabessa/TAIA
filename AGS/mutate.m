function individual = mutate(child, options)

for i = 1:length(child)
	val = rand ;
	if val <= options.MutationRate 
		if child(i) == '1'
			child(i) = '0'
		else
			child(i) = '1'
		end % if child
	end % if val
end % for i