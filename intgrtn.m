function [val]=intgrtn(expr,a,b,xi,w)
    e=sym('e');
    l=length(xi);
    val=0;
    for j=1:1:l
        val=val+w(j)*subs(expr,e,xi(j));
    end