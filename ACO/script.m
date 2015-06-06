model.f = @ackleysfcn ;
model.S.n = 30 ;
model.S.LB = -15 ;
model.S.UB = 15 ;
iter = 10 ;

tic
for i = 1:iter
	figure(i)
	fprintf('\nIteration %d out of %d',i,iter)
	[s(:,i),gens(i)] = aco(model) ;
end % for i
time = toc ;

fprintf('\nResults: ')
fprintf('\n> Best result: %d',max(cellfun(@model.f,num2cell(s,1)))) ;
fprintf('\n> Average result: %d',mean(cellfun(@model.f,num2cell(s,1)))) ;
fprintf('\n> Standard deviantion: %d',std(cellfun(@model.f,num2cell(s,1)))) ;
fprintf('\n\n> Average generations: %d',mean(gens)) ;
fprintf('\n> Standard deviantion: %d',std(gens)) ;
fprintf('\n\n> Execution time: %d',time) ;