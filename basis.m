function [phi]=basis(x1,x2,p)
    x=sym('x');
    
    for i=1:1:p+1
        s=(x2-x1)/p;
        xl(i)=x1+(i-1)*s;
        phi(i)=x/x;
    end
    
    for i=1:1:p+1
        for j=1:1:p+1            
           if (i~=j)
               phi(i)=phi(i)*(x-xl(j))/(xl(i)-xl(j));
           end            
        end
    end