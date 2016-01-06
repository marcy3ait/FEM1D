function [EAe,fe]=getmat(x1,x2,EA,f) %x1=xi_1 and x2=xi_p+1

    e=sym('e');
    x=sym('x');
    xe=x1*(1-e)/2+x2*(1+e)/2;
    EAe=subs(EA,x,xe);
    fe=subs(f,x,xe);