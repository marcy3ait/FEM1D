function [nint]=nintgrtn(p,EA,f)

    for j=1:1:length(p)
        dEA=EA(j);pEA=-1;
        while (dEA~=0)
            dEA=diff(dEA);
            pEA=pEA+1;
        end
        
        df=f(j);pf=-1;
        while (df~=0)
            df=diff(df);
            pf=pf+1;
        end
        
        p1=pEA+2*p(j)-2;
        p2=pf+p(j);
        pint=max([p1 p2]);
        
        if rem(pint,2)==0;
            nint(j)=(pint+2)/2;
        else
            nint(j)=(pint+1)/2;
        end
    end