function []=post(u,X,EA,f,Xs)

    x=sym('x');
    e=sym('e');
    L=X(length(X));
    disp(' ')
    disp(' ')
    disp('*** Comparitive study can be made between exact and finite element soluiton if the exact solution is known. ***')
    isex=input('Is the exact solution to this problem known? [Y/N] : ','s');
    if (isex=='Y' || isex=='y')
        [Xex,uex,duex]=exact(L);
    end
    
    for j=1:1:length(u)
        du(j)=diff(u(j));
    end
    
    disp(' ')
    reply=input('Do you want the plot of u(x) ? [Y/N] : ','s');
    if (reply=='Y' || reply=='y')
        hold off
        if (isex=='Y' || isex=='y')
            for j=1:1:length(uex)
                m=1;        
                for k=Xex(j):(Xex(j+1)-Xex(j))/100:Xex(j+1)
                    up(m)=subs(uex(j),x,k);
                    xp(m)=k;
                    m=m+1;
                end
                plot(xp,up,'k:')
                hold on
            end
        end
        for j=1:1:length(u)
            m=1;        
            for k=X(j):(X(j+1)-X(j))/100:X(j+1)
                ufe(m)=subs(u(j),x,k);            
                xfe(m)=k;
                m=m+1;
            end
            plot(xfe,ufe,'k-')
            hold on
        end
        xlabel('x')
        ylabel('u')
        if (isex=='Y' || isex=='y')
            legend('Exact Solution','Finite Element Soltion')
        end
        title('u vs x')
    end
    
    disp(' ')
    reply=input('Do you want the plot of du(x)/dx ? [Y/N] : ','s');
    if (reply=='Y' || reply=='y')
        hold off
        if (isex=='Y' || isex=='y')
            for j=1:1:length(uex)
                m=1;        
                for k=Xex(j):(Xex(j+1)-Xex(j))/100:Xex(j+1)
                    up(m)=subs(duex(j),x,k);
                    xp(m)=k;
                    m=m+1;
                end
                plot(xp,up,'k:')                
                hold on
            end
        end
        for j=1:1:length(u)
            m=1;        
            for k=X(j):(X(j+1)-X(j))/100:X(j+1)
                ufe(m)=subs(du(j),x,k);            
                xfe(m)=k;
                m=m+1;
            end
            plot(xfe,ufe,'k-')
            hold on
        end
        xlabel('x')
        ylabel('du(x)/dx')
        if (isex=='Y' || isex=='y')
            legend('Exact Solution','Finite Element Soltion')
        end
        title('du(x)/dx vs x')
    end
    
    if (isex=='Y' || isex=='y')
        disp(' ')
        reply=input('Do you want the plot of e(x) = u_exact - u_FE ? [Y/N] : ','s');
        if (reply=='Y' || reply=='y')
            hold off
            h=2;
            for j=1:1:length(u)
                m=1;
                for k=X(j):(X(j+1)-X(j))/100:X(j+1)
                    while (k>Xex(h))
                        h=h+1;
                    end
                    err(m)=subs(uex(h-1)-u(j),x,k);
                    xerr(m)=k;
                    m=m+1;
                end
                plot(xerr,err,'k-')
                hold on
            end
            xlabel('x')
            ylabel('e(x)')
            title('e(x) vs x')
        end
        
        disp(' ')
        reply=input('Do you want the plot of de(x)/dx ? [Y/N] : ','s');
        if (reply=='Y' || reply=='y')
            hold off
            h=2;
            for j=1:1:length(u)
                m=1;
                for k=X(j):(X(j+1)-X(j))/100:X(j+1)
                    while ((k>Xex(h)) || (X(j)==Xex(h)))
                        h=h+1;
                    end
                    err(m)=subs(duex(h-1)-du(j),x,k);
                    xerr(m)=k;
                    m=m+1;
                end
                plot(xerr,err,'k-')
                hold on
            end
            xlabel('x')
            ylabel('de(x)/dx')
            title('de(x)/dx vs x')
        end
    end
    
    disp(' ')
    reply=input('Do you want the plot of r(x) ? [Y/N] : ','s');
    if (reply=='Y' || reply=='y')        
        hold off
        q=1;
        for j=1:1:length(u)
            while X(j+1)>Xs(q+1)
                q=q+1;
            end
            expr=f(q)+diff(EA(q)*diff(u(j)));
            m=1;        
            for k=X(j):(X(j+1)-X(j))/100:X(j+1)
                res(m)=subs(expr,x,k);            
                xres(m)=k;
                m=m+1;
            end
            plot(xres,res,'k-')
            hold on
        end
        xlabel('x')
        ylabel('r(x)')
        title('r(x) vs x')
    end
    
    if (isex=='Y' || isex=='y')
        disp(' ')
        reply=input('Do you want the plot of error in strain energy U_ex-U_fe ? [Y/N] : ','s');
        if (reply=='Y' || reply=='y')
            hold off
            valfe=0;valex=0;
            q=1;s=1;
            for j=1:1:length(u)
                while X(j+1)>Xs(q+1)
                    q=q+1;
                end
                while X(j+1)>Xex(s+1)
                    s=s+1;
                end
                
                expr=EA(q)*(diff(u(j)))^2;
                pe=-1;d=expr;
                while (d~=0)
                    d=diff(d);
                    pe=pe+1;
                end
                if rem(pe,2)==0;
                    nint=(pe+2)/2;
                else
                    nint=(pe+1)/2;
                end
                [xi,w]=gauleg(nint,X(j),X(j+1));
                expr=subs(expr,x,e);
                Ufe(j)=intgrtn(expr,X(j),X(j+1),xi,w);
                valfe=valfe+Ufe(j);
                
                expr=EA(q)*(diff(uex(s)))^2;
                pe=-1;d=expr;
                while (d~=0)
                    d=diff(d);
                    pe=pe+1;
                end
                if rem(pe,2)==0;
                    nint=(pe+2)/2;
                else
                    nint=(pe+1)/2;
                end
                [xi,w]=gauleg(nint,X(j),X(j+1));
                expr=subs(expr,x,e);
                Uex(j)=intgrtn(expr,X(j),X(j+1),xi,w);
                valex=valex+Uex(j);
                
                xufe(j)=(X(j)+X(j+1))/2;
                dU(j)=Uex(j)-Ufe(j);
            end
            bar(xufe,dU)
            xlabel('x')
            ylabel('U')
            title('U vs x')
        end
    end