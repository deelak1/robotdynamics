function qfin = InverseKinematics (K)
qf=[0 0 0 0 0 0]
for i= 1:length(K)
  
load('parameters');
a1=0;           % [m]
a2=0.24365000;         % [m]
a3=0.262135;         % [m]
d=[0.1519 0 0 0 0 0]';
d6=d(6);% [m]
      % [rad]

dk=K(:,:,i);          % Position and orientation of end-effector
n=dk(1:3,1);
s=dk(1:3,2);
aN=dk(1:3,3);
R=[n s aN];
dk=K(:,:,i);          % Direct kinematics matrix

% Inverse Kinematic
p_ot=dk(1:3,4); % End-effector's position
pw=p_ot-d6*aN;   % Wrist's position
pw_x=dk(1,4);   % Vector's components that representes the wrist's position
pw_y=dk(2,4);
pw_z=dk(3,4);
save('xyz.mat','pw_x','pw_y','pw_z');
load('xyz.mat')
r=sqrt(pw_x^2+pw_y^2);
if pw_y<0
   fl1=-1;
else
    fl1=1;
end

teta1=atan2(pw_y,pw_x)+asin(d(3)/r)
teta1=teta1+3.1416


c3=(pw_x^2+pw_y^2+(pw_z-d(1))^2-a2^2-a3^2)/(2*a2*a3)  % cos(teta3)
s3=sqrt(1-c3^2)       % sin(teta3)

teta3=acos(c3)


save('in.mat','teta1','teta3');
x1=findd();
x=x1(1)
teta2=x+3.1417;
if teta2>3.1417 
    teta2=x-3.1417;
% sin(teta3)
end
%teta2=atan2((a2+a3*c3)*pw_z-a3*s3*sqrt(pw_x^2+pw_y^2),(a2+a3*c3)*sqrt(pw_x^2+pw_y^2)+a3*s3*pw_z);
R3_0=[cos(teta1)*cos(teta2+teta3) -cos(teta1)*sin(teta2+teta3) sin(teta1);      % Matrix for the Euler's angle of 3dof arm
    sin(teta1)*cos(teta2+teta3) -sin(teta1)*sin(teta2+teta3) -cos(teta1);
    sin(teta2+teta3) cos(teta2+teta3) 0];

R6_3=R3_0'*R;        % Matrix for the Euler's angle of spherical wrist

% Inverse kinematic for the spherical wrist


% Y = cos(teta1)*aN(1) + sin(teta1)*aN(2)
% M2 = sin(teta1)*aN(1) - cos(teta1)*aN(2) ;
% M1 =  ( cos(teta2-teta2) )*Y + ( sin(teta2-teta3) )*aN(3);
% teta4 = atan2(M2,-M1);

R3_0=[cos(teta1)*cos(teta2+teta3) -cos(teta1)*sin(teta2+teta3) sin(teta1);      % Matrix for the Euler's angle of 3dof arm
    sin(teta1)*cos(teta2+teta3) -sin(teta1)*sin(teta2+teta3) -cos(teta1);
    sin(teta2+teta3) cos(teta2+teta3) 0];

R6_3=R3_0'*R;        % Matrix for the Euler's angle of spherical wrist

% Inverse kinematic for the spherical wrist
teta4=atan2(R6_3(2,3),R6_3(1,3))
teta4a=3.1417+teta4;
if teta4a>3.1418
   teta4a=teta4-3.1417;
end
if aN(3)>0
    fl=-1;
else
    fl=+1;
end
teta5=fl*(atan2(sqrt((R6_3(1,3))^2+(R6_3(2,3))^2),R6_3(3,3)))
% c5=sqrt((c4^2)+(s4^2));
% s5=(R3_0(1,2)*a1)+(R3_0(2,2)*aN(2))+(R3_0(3,2)*aN(3));
% teta5=atan2(c5,s5)
%

teta6=-atan2(R6_3(3,2),R6_3(3,1))
% teta6a=teta6-3.1416
% if teta6a<-3.1416
%     teta6a=3.1416+teta6
%     
% end
qf=[qf; teta1 teta2 teta3 teta4a teta5 teta6]

% Solutions in radiant
end

qfin=qf;
save('Values','qfin');
load('Values');
 
end