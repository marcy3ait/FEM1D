function [xEA,EA,xf,f,xP,P]=rcon()

disp('The linear domain for the problem is defined with two end coordinates as x=0 and x=L')
disp(' ')
L=input('Give the value of L : ');

while L<=0
    L=input('Enter a positive value of L : ');
end

x=sym('x');

disp(' ')
disp('***Polynomial functions for EA***')
disp(' ')
nEA=input(['Enter the number of times EA(x) changes its form inside the domain (0,',num2str(L),'): nEA = ']);

xEA(1)=0;
for j=2:1:nEA+2
    disp(' ')
    if j~=nEA+2
        xEA(j)=input(['Enter the coordinate x of the last point of segment no. ',num2str(j-1),' starting from x=',num2str(xEA(j-1)),' : ']);
        while (xEA(j)<=xEA(j-1) || xEA(j)>=L)
            disp(' ')
            disp(['The value entered should be between x=',num2str(xEA(j-1)),' and x=',num2str(L)])
            xEA(j)=input(['Enter the coordinate x of the last point of segment no. ',num2str(j-1),' starting from x=',num2str(xEA(j-1)),' : ']);
        end
    else
        xEA(j)=L;
    end
    EA(j-1)=x;
    EA(j-1)=input(['Enter the expression for EA(x) in terms of x between x=',num2str(xEA(j-1)),' and x=',num2str(xEA(j)),' = ']);
    while (EA(j-1)==0)
        disp(' ')
        disp('Value of EA(x) can''t be zero.')
        EA(j-1)=input(['Enter different expression for EA(x) in terms of x between x=',num2str(xEA(j-1)),' and x=',num2str(xEA(j)),' = ']);
    end
end

disp(' ')
disp('***Polynomial functions for f***')
disp(' ')
nf=input(['Enter the number of times f(x) changes its form inside the domain (0,',num2str(L),'): nf = ']);

xf(1)=0;
for j=2:1:nf+2
    disp(' ')
    if j~=nf+2
        xf(j)=input(['Enter the coordinate x of the last point of segment no. ',num2str(j-1),' starting from x=',num2str(xEA(j-1)),' : ']);
        while (xf(j)<=xf(j-1) || xf(j)>=L)
            disp(' ')
            disp(['The value entered should be between x=',num2str(xf(j-1)),' and x=',num2str(L)])
            xf(j)=input(['Enter the coordinate x of the last point of segment no. ',num2str(j-1),' starting from x=',num2str(xEA(j-1)),' : ']);
        end
    else
        xf(j)=L;
    end
    f(j-1)=x;
    f(j-1)=input(['Enter the expression for f(x) in terms of x between x=',num2str(xf(j-1)),' and x=',num2str(xf(j)),' = ']);
    
end

disp(' ')
disp('***Details of Point Loads***')
disp(' ')
nP=input(['Enter the number of Point loads inside the domain (0,',num2str(L),'): nP = ']);

xP(1)=0;P(1)=0;
for j=1:1:nP
    disp(' ')
    xP(j)=input('Enter the coordinate x of the point load :');
    while (xP(j)<=0 || xP(j)>=L)
        disp(' ')
        disp(['The value entered should be between x=0 and x=',num2str(L)])
        xP(j)=input('Enter the coordinate x of the point load :');
    end
    P(j)=input(['Enter the value of the point load at x=',num2str(xP(j)),' : ']);
end