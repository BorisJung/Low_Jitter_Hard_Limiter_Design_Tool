clear all;
clc;


A=1e6;
[g] = gain_dist(A)
i=0;
n=3;
j=0;
M = g(1)
for i=2:n;
    for j=1:i;
    N = prod(g(1:j)) 
    end;
    m(i) = g(i)/N
    M = M + (m(i))
end;
