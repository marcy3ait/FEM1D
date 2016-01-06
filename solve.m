function [alpha] = solve(K,F)

    l = length(F);
    for j=1:1:l-1
        c=K(j,j);
        F(j) = F(j)/c;
        for k=j:1:l
            K(j,k) = K(j,k)/c;
        end
        for h=j+1:1:l
            d=K(h,j);
            F(h)=F(h)-d*F(j);
            for k=j:1:l
                K(h,k) = K(h,k) - d*K(j,k);
            end
        end
    end
    F(l)=F(l)/K(l,l);
    K(l,l)=1;
    
    alpha = F;
    for j=l-1:-1:1
        for k=j+1:1:l
            alpha(j) = alpha(j) - K(j,k)*alpha(k);
        end
    end
    
    
    