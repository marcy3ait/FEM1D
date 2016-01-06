function [ki,fi]=elem(p,x1,x2,EA,f,xi,w)
    [EAe,fe]=getmat(x1,x2,EA,f);
    
    N=shape(p);
    for j=1:1:p+1        
        expr_f=fe*N(j)*(x2-x1)/2;
        fi(j)=intgrtn(expr_f,-1,1,xi,w);
        for k=1:1:p+1
            expr_k=EAe*diff(N(j))*diff(N(k))*2/(x2-x1);
            ki(j,k)=intgrtn(expr_k,-1,1,xi,w);
        end
    end
    