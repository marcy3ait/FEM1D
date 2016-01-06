function [u] = proc2(EA,f,P,bctyp,v,X,n,p,Xs)
    
    nint=nintgrtn(p,EA,f);
    [K,F] = form(n,p,X,EA,f,nint);
    [K,F] = applybc(K,F,bctyp,v,P);
    [alpha] = solve(K,F);
    
    x=sym('x');    
    
    m=1;rl=1;
    for i=1:1:(length(X)-1)
        u(i)=x-x;
        while (X(i+1)-Xs(m+1)>10^-6)
            m=m+1;
        end
        phi=basis(X(i),X(i+1),p(m));
        for j=1:1:(p(m)+1)
            u(i)=u(i)+alpha(rl-1+j)*phi(j);
        end
        rl=rl+p(m);
    end