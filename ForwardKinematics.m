function Kin=ForwardKinematics(qinput)

%Forward Kinematics - Converts angles into co-ordinates
load('parameters.mat');

RP = evalin('base', 'RP');

a=[0 0.2437 0.262133 0 0 0]';
d=[0.1519 0 0 0 0 0 ]';
A=[90,0,0,90,-90,0];
A=deg2rad(A);

q1=(qinput(1));
q2=(qinput(2));
q3=(qinput(3));
q4=(qinput(4));
q5=(qinput(5));
q6=(qinput(6));
q=[q1,q2,q3,q4,q5,q6];
% % 
% % T1=[cos(q1) 0 sin(q1) 0;...
% %     sin(q1) 0 -cos(q1) 0;...
% %     0 1 0 0.1519;...
% %     0 0 0 1;];
% %  
% % T2=[cos(q2) -sin(q2) 0 a(2).*cos(q2);...
% %     sin(q2) cos(q2) 0 a(2).*sin(q2);...
% %     0 0 1 0;...
% %     0 0 0 1;];
% % T3= [cos(q3) -sin(q3) 0 a(3).*cos(q3);...
% %     sin(q3) cos(q3) 0 a(3).*sin(q3);...
% %     0 0 1 0;...
% %     0 0 0 1;];
% % T4= [cos(q4) 0 -sin(q4) 0;...
% %     sin(q4) 0 cos(q4) 0;...
% %     0 1 0 0;...
% %     0 0 0 1;];
% % T5= [cos(q5) 0 sin(q5) 0;...
% %     sin(q5) 0 -cos(q5) 0;...
% %     0 1 0 0;...
% %     0 0 0 1;];
% % T6=[cos(q6) 0 sin(q6) 0;...
% %     sin(q6) 0 -cos(q6) 0;...
% %     0 1 0 0;...
% %     0 0 0 1;];
% % Ti=[1 0 0 0;...
% %     0 1 0 0;...
% %     0 0 1 0;...
% %     0 0 0 1;];
n=6;
T1_n = eye(4);
T{n} = zeros(4);
for i=1:n
T_i=[cos(q(i)), -cos(A(i))*sin(q(i)), sin(A(i))*sin(q(i)),  a(i)*cos(q(i));
    sin(q(i)),  cos(A(i))*cos(q(i)),-sin(A(i))*cos(q(i)),  a(i)*sin(q(i));
            0,            sin(A(i)),           cos(A(i)),            d(i);

           0,                    0,                   0,              1];
       
       
T1_n = T1_n * T_i;
      
end
Tot=T1_n;
Kin= T1_n((1:3),4)';
% % Tot=(T1*T2)*(T3*T4)*(T5*T6);
% % 
% % P = Tot(1:3,4);





end