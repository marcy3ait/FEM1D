function [X,n,p]=relem(Xs)

    disp(' ')
    disp(['Number of segments in the domain = ',num2str(length(Xs)-1)])
    disp(' ')
    disp('Enter the value of number of elements n and the order of approximation p (<=5) for each segment')
    
    for j=1:1:length(Xs)-1
        disp(' ')
        disp(['For segment no. ',num2str(j),' between x=',num2str(Xs(j)),' and x=',num2str(Xs(j+1)),' : '])
        n(j)=input(['n',num2str(j),' = ']);
        p(j)=input(['p',num2str(j),' = ']);
        while p(j)>5
            disp('Value of p should be less than 5.')
            p(j)=input(['p',num2str(j),' = ']);
        end
    end
    
    r=1;
    X(r)=0;
    for j=1:1:length(Xs)-1
        for k=1:1:n(j)
            r=r+1;
            X(r)=X(r-1)+(Xs(j+1)-Xs(j))/n(j);
        end
    end