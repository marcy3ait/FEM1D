function [Xex,uex,duex]=exact(L)

    x=sym('x');
    disp(' ')
    nex=input(['Enter the number of times u_exact(x) changes its form inside the domain (0,',num2str(L),'): nex = ']);
      
    Xex(1)=0;
    for j=2:1:nex+2
        disp(' ')
        if j~=nex+2
           Xex(j)=input(['Enter the coordinate x of the last point of segment no. ',num2str(j-1),' starting from x=',num2str(Xex(j-1)),' : ']);
           while (Xex(j)<=Xex(j-1) || Xex(j)>=L)
               disp(' ')
               disp(['The value entered should be between x=',num2str(Xex(j-1)),' and x=',num2str(L)])
               Xex(j)=input(['Enter the coordinate x of the last point of segment no. ',num2str(j-1),' starting from x=',num2str(Xex(j-1)),' : ']);
           end
        else
           Xex(j)=L;
        end
        uex(j-1)=x;
        uex(j-1)=input(['Enter the expression for u_exact(x) in terms of x between x=',num2str(Xex(j-1)),' and x=',num2str(Xex(j)),' = ']);
        duex(j-1)=diff(uex(j-1));
    end
  