% Script to run AG and compare multiple results

iter = 30;
individuallist = zeros(1,iter) ;
fitnesslist = zeros(1,iter) ;
genslist = zeros(1,iter) ;

for i = 1:iter

	fprintf('\nIteration %d out of %d\n',i,iter)

	[fitness,individual,gens] = ag() ;
	individuallist(i,:) = individual ;
	fitnesslist(i) = fitness ;
	genslist(i) = gens ;
end % for i

fprintf('\nFitness results:\n> Mean: %d\n> Deviantion: %d',mean(fitnesslist),std(fitnesslist))
fprintf('\nGenerations results:\n> Mean: %d\n> Deviantion: %d',mean(genslist),std(genslist))
fprintf('\n--------------------------------------------------')

for i = 1:length(individuallist)
	bestfitnesslist(i) = ackleysfitnessfcn(individuallist(i,:)) ;
end % for i
[val, idx] = min(bestfitnesslist) ;

fprintf('\nBest individual through all executions: %d\n> Mean: %d\n> Deviantion: %d', ...
	individuallist(idx,:), mean(individuallist), std(individuallist))
fprintf('\n--------------------------------------------------')