function [bctyp,v]=rbc()

    disp(' ')
    disp('***Boundary Conditions***')
    disp(' ')
    disp('Three types of boundary conditions:')
    disp('1. Dirichlet Condition- Value of displacement u is given. (Positive u in positive direction i.e. toward 0 to L)')
    disp('2. Neumann Condition- Value of force F is given. (Force pointing outwards from inside the domain is positive')
    disp('3. Robin Condition- F as a function of u is given. (Only linear functions of u considered i.e. spring.')
    disp('   Values to be provided in this case is spring constant k and pre-compression delta')
    
    disp(' ')
    bctyp(1)=input('Enter the type of B.C. at x=0 : (1/2/3) ');
    bctyp(2)=input('Enter the type of B.C. at x=L : (1/2/3) ');
    
    disp(' ')
    if bctyp(1)==1
        v(1)=input('Enter the value of u(0) = ');
    elseif bctyp(1)==2
        v(1)=input('Enter the value of F(0) = ');
    elseif bctyp(1)==3
        v(1)=input('Enter the value of spring constant at x=0, k = ');
        v(3)=input('Enter the value of pre compression in the spring at x=0, delta = ');
    end
    
    disp(' ')
    if bctyp(2)==1
        v(2)=input('Enter the value of u(L) = ');
    elseif bctyp(2)==2
        v(2)=input('Enter the value of F(L) = ');
    elseif bctyp(2)==3
        v(2)=input('Enter the value of spring constant at x=L, k = ');
        v(4)=input('Enter the value of pre compression in the spring at x=L, delta = ');
    end