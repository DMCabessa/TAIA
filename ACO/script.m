model.f = @ackleysfcn ;
s = aco(model) ;
fprintf('Best result: %d',model.f(s)) ;