
n=n;
m=m;
RES = zeros(m,n);
RESf = zeros(m,n);
T = zeros(m,1);
STO = zeros(m,n);

for i = 1 : m 
for j = 1 : n
      run('algo_pierrot.m')

end
 D=sum(EXC,2);
      T=sum(EXC,2);

 for k = 1 : n        
    
      
      if T(i) >0 
            if RES(i,k)>LR(k)
                if RES(i,k) - LR(k) < T(i)
                RESf(i,k)= LR(k);
                T(i) = T(i)-(RES(i,k)-LR(k));
                else
                RESf(i,k)= RES(i,k) - T(i);
                T(i) = 0;
                end
            else
            RESf(i,k)= RES(i,k);
            T(i) = T(i);
            end
        else 
            RESf(i,k)= RES(i,k);
            T(i) = T(i);
      end
end


end
