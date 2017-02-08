function qdd=InverseDynamics(QAct)
Tau1=QAct(1);
Tau2=QAct(2);
Tau3=QAct(3);
Tau4=QAct(4);
Tau5=QAct(5);
Tau6=QAct(6);

q1=QAct(7);
q2=QAct(8);
q3=QAct(9);
q4=QAct(10);
q5=QAct(11);
q6=QAct(12);

qd1=QAct(13);
qd2=QAct(14);
qd3=QAct(15);
qd4=QAct(16);
qd5=QAct(17);
qd6=QAct(18);

Mhat = [ 1 0 0 0 0 0;
         0 1 0 0 0 0;
         0 0 1 0 0 0;
         0 0 0 1 0 0;
         0 0 0 0 1 0;
         0 0 0 0 0 1];
      
Nhat = [0; 0; 0; 0; 0; 0];

% Mhat = [ 5 0 0 0 0 0;
%          0 1 0 0 0 0;
%          0 0 7 0 5 0;
%          0 0 0 3 0 0;
%          0 0 0 0 6 0;
%          0 0 0 0 0 2];
%       
% Nhat = [0; 3; 0; 5; 0; 0];

v=load('Values.mat');
v=load('Values1.mat');
Mass = evalin('base', 'Mass');
B=evalin('base', 'B');
C=evalin('base', 'C');
G=evalin('base', 'G');


Q=[q1;q2;q3;q4;q5;q6];
Qd=[qd1;qd2;qd3;qd4;qd5;qd6];
QQ=[qd1*qd2 qd1*qd3 qd1*qd4 qd1*qd5 qd1*qd6 qd2*qd3 qd2*qd4 qd2*qd5 qd2*qd6 qd3*qd4 qd3*qd5 qd3*qd6 qd4*qd5 qd4*qd6 qd5*qd6];
Q2=[qd1^2 qd2^2 qd3^2 qd4^2 qd5^2 qd6^2];

%Tau=B*QQ' + C*Q2' + G;
Tau=Nhat;
Torque=[Tau1 Tau2 Tau3 Tau4 Tau5 Tau6]';
qdd= (inv(Mhat))*(Torque-Tau);



end