function [EA,f,P,bctyp,v,X,n,p,Xs]=prep()

    x=sym('x');
    e=sym('e');
    [xEA,EAs,xf,fs,xP,Ps]=rcon();
    [bctyp,v]=rbc();
    
    while (bctyp(1)==2 && bctyp(2)==2)
        intf=0;
        for j=1:1:length(fs)
            df=fs(j);pf=-1;
            while (df~=0)
                df=diff(df);
                pf=pf+1;
            end
            if rem(pf,2)==0;
                nint=(pf+2)/2;
            else
                nint=(pf+1)/2;
            end
            [xi,w]=gauleg(nint,xf(j),xf(j+1));
            expr=subs(fs(j),x,e);
            intf=intf+intgrtn(expr,xf(j),xf(j+1),xi,w);
        end
        
        sumP=0;
        for j=1:1:length(Ps)
            sumP=sumP+Ps(j);
        end
        
        if ((intf+sumP+v(2)-v(1))>=10^(-5))
            disp(' ')
            disp('The specified boundary condition does not satisfy the static equilibrium condition.')
            disp('Please specify different boundary conditions.')
            disp(' ')
            [bctyp,v]=rbc();
        else
            break
        end
    end
    
    
    [Xs]=rnode(xEA,xf,xP);
    [X,n,p]=relem(Xs);
    [EA,f,P]=rmat(xEA,EAs,xf,fs,xP,Ps,Xs,n,p);
    
    