function Y = ackleysfitnessfcn(X)

c1 = 20 ;
c2 = 0.2 ;
c3 = 2*pi ;

% Set here for now
n = 30 ;

X2 = X.^2 ;
summation_X2 = sum(X2) ;

cosX = cos(c3.*X) ;
summation_cosX = sum(cosX) ;

Y = -c1*exp(-c2*sqrt((1/n)*summation_X2))-exp((1/n)*summation_cosX)+c1+exp(1);