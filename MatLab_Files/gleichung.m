%% Gleichung lösen
%
%
%Gleichung definieren
%
syms x

solve( 1-exp(-2*x)-x , x)


test = @(y) 1-exp(-2*y)-y;

y0=1

y=fsolve(test,y0)
