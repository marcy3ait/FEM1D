function [K,F] = drchlt(K,F,i,u)
    l=length(F);
    if(i==1)
        K(1,1) = 1;
        F(1) = u; 
        for j=2:1:l
            F(j) = F(j) - K(j,1)*u;
            K(j,1) = 0;
            K(1,j) = 0;
        end
    end
    
    if(i==2)
        K(l,l) = 1;
        F(l) = u; 
            for j=1:1:l-1
                F(j) = F(j) - K(j,l)*u;
                K(j,l) = 0;
                K(l,j) = 0;
            end
    end
    
    
        
        