function Torque=Robotdynamics(QAct)


q1=QAct(1);
q2=QAct(2);
q3=QAct(3);
q4=QAct(4);
q5=QAct(5);
q6=QAct(6);

qd1=QAct(7);
qd2=QAct(8);
qd3=QAct(9);
qd4=QAct(10);
qd5=QAct(11);
qd6=QAct(12);

qdd1=QAct(13);
qdd2=QAct(14);
qdd3=QAct(15);
qdd4=QAct(16);
qdd5=QAct(17);
qdd6=QAct(18);





Mass = MMatrix(q1,q2,q3,q4,q5,q6);
Nmatrix(q1,q2,q3,q4,q5,q6);

load('Values.mat')
B=evalin('base', 'B');
C=evalin('base', 'C');
G=evalin('base', 'G');

Mhat = [ 1 0 0 0 0 0;
         0 1 0 0 0 0;
         0 0 1 0 0 0;
         0 0 0 1 0 0;
         0 0 0 0 1 0;
         0 0 0 0 0 1];
      
Nhat = [0; 0; 0; 0; 0; 0];


Q=[q1;q2;q3;q4;q5;q6];
Qd=[qd1;qd2;qd3;qd4;qd5;qd6];
Qdd=[qdd1;qdd2;qdd3;qdd4;qdd5;qdd6];
QQ=[qd1*qd2 qd1*qd3 qd1*qd4 qd1*qd5 qd1*qd6 qd2*qd3 qd2*qd4 qd2*qd5 qd2*qd6 qd3*qd4 qd3*qd5 qd3*qd6 qd4*qd5 qd4*qd6 qd5*qd6];
Q2=[qd1^2 qd2^2 qd3^2 qd4^2 qd5^2 qd6^2];


%Torque=Mass*Qdd+ B*QQ' + C*Q2' + G;
Torque=Mhat*Qdd+Nhat
save('Values','Torque');

end