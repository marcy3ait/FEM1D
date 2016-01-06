function [N] =  shape(p)
    e=sym('e');
    
    for i=1:1:p+1
        s=2/p;
        eta(i)=-1+(i-1)*s;
        N(i)=e/e;
    end
    
    for i=1:1:p+1
        for j=1:1:p+1            
           if (i~=j)
               N(i)=N(i)*(e-eta(j))/(eta(i)-eta(j));
           end            
        end
    end