function [xi,w]=gauleg(nint,a,b)

    if nint==0
        nint=1;
    end
    
    legendre_rule(nint,a,b,'gl');
    
    xi=importdata('gl_x.txt');
    w=importdata('gl_w.txt');