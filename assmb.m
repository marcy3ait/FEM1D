function [K,F]=assmb(K,F,ki,fi,rl,p)
    for j=1:1:p+1
        J=rl-1+j;
        F(J)=F(J)+fi(j);
        for k=1:1:p+1
            Kk=rl-1+k;
            K(J,Kk)=K(J,Kk)+ki(j,k);
        end
    end
