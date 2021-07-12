
m=m;
n=n;
RES = zeros(m,n);
STO = zeros(m,n);
EXC1 = zeros(m,n);
EXC2 = zeros(m,n);
CAS = zeros(m,n);

for i = 1 : m 
for j = 1 : n
if i == 1
        run('algo_nasser1.m')
    else
        run('algo_nasser2.m')
    end    
end
end
