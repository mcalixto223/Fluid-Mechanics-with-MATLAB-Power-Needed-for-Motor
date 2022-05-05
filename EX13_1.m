e = 1000; % Water, [kg/m^3]
% The dynamic viscosity
u = 0.002; % [N*s/m^2]
Q = 50/1000; % 1 liter/s to m^3/s
d = 150*10^-3; % [m]
A = (pi*d^2)/4;
% pipe (k)
k = 0.15*10^-3; % Gal. Steel (mm)
disp(['The area is: ',num2str(A),' m'])
% The  of the fluid
V = Q/A;
disp(['The velocity of flow is: ',num2str(V),' m/s'])
% Reynolds Number
Re = (e*V*d)/u
disp(['Reynolds Number is: ',num2str(Re)])
% Relative Roughness:
Rr = k/d;
disp(['Relative Roughness is: ',num2str(Rr)])
% Friction Factor (Method 1) Moody Diagram
f1 = 0.0053;
% Friction Factor (Method 2) Smooth pipe Formula
if Re<2000
    f2 = 16/(Re^0.25);
    disp(['Friction Factor (f2): ',num2str(f2)])
else
   f2 = 0.079/(Re^0.25);
   disp(['Friction Factor (f2): ',num2str(f2)])
end
% Length:
L = 200; % [m]
% head loss ( Method 1)
hf1 = ((4*f1*L)/d)*((V^2)/(2*9.81));
   disp(['Head Loss Method 1 (Moody)(hf1): ',num2str(hf1),' m/m pipe length'])
% head loss ( Method 2)
hf2 = ((4*f2*L)/d)*((V^2)/(2*9.81));
   disp(['Head Loss Method 2 (Formula)(hf2): ',num2str(hf2),' m/m pipe length'])
   
%% part two
% Obstruction loss
K1 = 0.9*5;
K2= 1.0;
K3 = 0.5;
K4 = 5.0;
Kt = K1+K2+K3+K4;
g = 9.81;
ho = Kt*((V^2)/(2*g));
disp(['Loss of energy : ',num2str(ho),' m'])

hz = 100;

htot= hf1+ho+hz
np = 70/100;
nm = 90/100;
P = (e*g*Q*htot/(np*nm))/1000;

disp(['Power needed for electric motor with pump: ',num2str(P),' kW'])
