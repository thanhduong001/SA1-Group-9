function [cl cd] = forces(circ,cp,delstarl,thetal,delstaru,thetau)
cl = -2 * circ;
uete = (1 - cp(end)) ^ 0.5;
delte = delstarl(end) + delstaru(end);
thetate = thetal(end) + thetau(end);
Hte = delte/thetate;
thetainf = thetate * uete ^ ((Hte + 5)/2);
cd = thetainf * 2;