% AUTHOR:
%    Prakhar Jaiswal
%    prakhar0402@gmail.com

close all
clear all

disp(' ')
disp('*** THIS CODE SOLVES 1D FEM PROBLEM ***')
disp(' ')

[EA,f,P,bctyp,v,X,n,p,Xs]=prep();
[u]=proc(EA,f,P,bctyp,v,X,n,p,Xs);
post(u,X,EA,f,Xs);