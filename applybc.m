function [K,F] = applybc(K,F,bctyp,v,P) 

    l=length(F);

    if bctyp(1)==1
        [K,F]=drchlt(K,F,1,v(1));
    elseif bctyp(1)==2
        F(1)=F(1)-v(1);
    elseif bctyp(1)==3
        F(1)=F(1)+v(1)*v(3);
        K(1,1)=K(1,1)+v(1);
    end
    
    if bctyp(2)==1
        [K,F]=drchlt(K,F,2,v(2));
    elseif bctyp(2)==2
        F(l)=F(l)+v(2);
    elseif bctyp(2)==3
        F(l)=F(l)-v(2)*v(4);
        K(l,l)=K(l,l)+v(2);
    end
    
    if P(1,1) ~= 1
        sz=size(P);
        for j=1:1:sz(1)
            F(P(j,1)) = F(P(j,1)) + P(j,2);
        end
    end