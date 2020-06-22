%% Slew Rates 
%
%
function [SR, roh_out] = slew_rates(g, G, n, roh_in)
roh_out=roh_in*g(1)*g(2)*g(3)*g(4);
SR(1) = roh_in*1e-6;
for i=2:2*n+1;
    if mod(i,2)==0
    SR(i) = SR(i-1)*G(i/2);
    else
    SR(i) = SR(i-2)*g((i-1)/2);
    end;
end;