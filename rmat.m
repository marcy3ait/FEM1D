function [EA,f,P]=rmat(xEA,EAs,xf,fs,xP,Ps,Xs,n,p)
    
    EA(1)=EAs(1);
    f(1)=fs(1);
    y=2;z=2;
    for j=2:1:length(Xs)-1
        
        if Xs(j)>=xEA(y)
            y=y+1;
        end
        EA(j)=EAs(y-1);
        
        if Xs(j)>=xf(z)
            z=z+1;
        end
        f(j)=fs(z-1);
        
    end
    
    for j=1:1:length(xP)
        P(j,1)=1;P(j,2)=Ps(j);
        for k=2:1:length(Xs)-1
            if xP(j)==Xs(k)               
                for r=1:1:k-1
                    P(j,1)=P(j,1)+n(r)*p(r);
                end
                break
            end
        end
    end