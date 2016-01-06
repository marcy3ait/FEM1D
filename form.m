function [K,F]=form(n,p,X,EA,f,nint)

    r=1;t=0;
    for j=1:1:length(n)
        r=r+n(j)*p(j);
        t=t+n(j);
        s(j)=t;
    end
    K=zeros(r,r);
    F=zeros(r);
        
    m=1;rl=1;
    for i=1:1:t
        if i>s(m);
            m=m+1;
        end
        
        [xi,w]=gauleg(nint(m),-1,1);
        [ki,fi]=elem(p(m),X(i),X(i+1),EA(m),f(m),xi,w);
        [K,F]=assmb(K,F,ki,fi,rl,p(m));
        rl=rl+p(m);
    end