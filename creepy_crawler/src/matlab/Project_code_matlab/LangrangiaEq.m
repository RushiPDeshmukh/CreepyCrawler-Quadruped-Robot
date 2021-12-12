clc;
clear all;
close all;


% Given 2 Linls with m1,m2,l1,l2,q1,q2,I1,I2
%% 
% Part a 

syms I1 r1 q1 m1 I2 r2 q2 m2 l1 l2 q1dot q2dot q1ddot q2ddot g I1 I2 u1 u2

X = sym ('X', [4,1]);
X(1) = q1;
X(2) = q2;
X(3) = q1dot;
X(4) = q2dot;

% v1 = (-r1*sin(q1)*q1dot)+(r1*cos(q1)*q1dot) + 0;
% v2 = ((l1*sin(q1)*q1dot)+(r2*((-sin(q2)*sin(q1)*q1dot)+(cos(q2)*cos(q1)*q2dot)))) + ((l1*cos(q1)*q1dot)+(r2*((sin(q2)*cos(q1)*q1dot)+(cos(q2)*sin(q1)*q2dot))))  +  (-r2*sin(q2)*q2dot);
% I1 = [I1x I1y I1z]
% I2 = [I2xx I2yy I2zz]
vx = (l1*sin(q1)*q1dot)+(r2*((-sin(q2)*sin(q1)*q1dot)+(cos(q2)*cos(q1)*q2dot)));
vy = ((l1*cos(q1)*q1dot)+(r2*((sin(q2)*cos(q1)*q1dot)+(cos(q2)*sin(q1)*q2dot))));
vz = (-r2*sin(q2)*q2dot);

v2 = (vx^2 + vy^2 + vz^2)^0.5;

K1 = 0.5*m1*r1*r1*(q1dot^2) + 0.5*I1*q1dot^2; 
K2 = 0.5*m2*(v2^2) + 0.5*I2*(q1dot+q2dot)^2;
K = K1+K2;

P1 = 0;
P2 = m2*g*(l2 - l1*cos(q2));
P = P1+P2;
L = simplify(K-P);

q = [q1; q2];
qd = [q1dot; q2dot];
qdd = [q1ddot; q2ddot];
U = [u1;u2];


DLDq1 = jacobian(L, q1);                           
DLDq1dot = jacobian(L, q1dot);                      

DLDq2 = simplify(jacobian(L,q2));                  
DLDq2dot = simplify(jacobian(L,q2dot));             

dDL_dtDdotq1 = jacobian(DLDq1dot,[q;qd])*[qd;qdd];
dDL_dtDdotq2 = jacobian(DLDq2dot,[q;qd])*[qd;qdd];  

eq1 = dDL_dtDdotq1-DLDq1
%-u1;                           
eq2 = dDL_dtDdotq2-DLDq2
%-u2;                           
% 
sol = solve([eq1==0,eq2==0],[q1ddot,q2ddot]);
simplify(sol.q1ddot)
simplify(sol.q2ddot)

%%
% Part c
T = 20;
[t,y] = ode45(@mode45, [0,T], [(1/180)*pi;(45/180)*pi;0;0]) 

figure(1)
plot(t,y(:,1));
title('Solution');
xlabel('Time t');
ylabel('y');
legend('q1')
grid

figure(2)
plot(t,y(:,2));
title('Solution');
xlabel('Time t');
ylabel('y');
legend('q2')
grid

figure(3)
plot(t,y(:,3));
title('Solution');
xlabel('Time t');
ylabel('y');
legend('q1dot')
grid

figure(4)
plot(t,y(:,4));
title('Solution');
xlabel('Time t');
ylabel('y');
legend('q2dot')
grid