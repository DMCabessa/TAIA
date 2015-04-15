function y = fitnessfcn(x)

w = 100*(x+1-x^2)^2+(x-1)^2 ;
y = 1/1-w ;