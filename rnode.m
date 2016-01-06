function [Xs]=rnode(xEA,xf,xP)
    
    i=[1 1 1];
    j=1;
    xP=sort(xP);
    xP(length(xP)+1)=xEA(length(xEA));
    
    while (i(1)<length(xEA) || i(2)<length(xf) || i(3)<length(xP))
        
        Xs(j)=min([xEA(i(1)) xf(i(2)) xP(i(3))]);
        if Xs(j)==xEA(i(1))
            i(1)=i(1)+1;
        end
        if Xs(j)==xf(i(2))
            i(2)=i(2)+1;
        end
        if Xs(j)==xP(i(3))
            i(3)=i(3)+1;
        end
        j=j+1;
    end
    Xs(j)=xEA(length(xEA));
    
    