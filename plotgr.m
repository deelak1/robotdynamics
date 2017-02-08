
figure()
plot(QactOutput,'--');
hold on;
plot(H.q(1:100,1),H.q(1:100,2:7));
hold off;
legend('Actual Joint Angles 1','2','3','4','5','6','Desired Joint Angles','2','3','4','5','6');

figure()
plot(fkineout,'--');
hold on;
plot(path500);
hold off;


figure()
subplot(3,1,1);
fk=fkineout.data;
len=length(fk);
len=floor(len/(length(path500)));
for i=1:length(path500)
    
plot(i,fk((i)*len,1),'r*');
hold on

end
plot(1:length(path500),path500(:,1));
hold off
legend('after forward kinematics','given');
title('x')

subplot(3,1,2);

for i=1:length(path500)
    
plot(i,fk((i)*len,2),'c*');
hold on

end
plot(1:length(path500),path500(:,2));
hold off
legend('after forward kinematics','given');
title('y')

subplot(3,1,3);

for i=1:length(path500)
    
plot(i,fk((i)*len,3),'m*');
hold on

end
plot(1:length(path500),path500(:,3));
hold off
legend('after forward kinematics','given');
title('z')

figure()
subplot(3,2,1);

lent=length(Qk);
lent=floor(lent/(length(path500)));
for i=1:length(H.q(1:97,2:7))
    
plot(i,Qk((i)*len,1),'r*');
hold on

end
plot(1:length(H.q(1:97,2:7)),H.q(1:97,2));
hold off
legend('after forward kinematics','given');
title('Angle 1')


subplot(3,2,2);
for i=1:length(H.q(1:97,2:7))
    
plot(i,Qk((i)*len,2),'b*');
hold on

end
plot(1:length(H.q(1:97,2:7)),H.q(1:97,3));
hold off
legend('after forward kinematics','given');
title('Angle 2')

subplot(3,2,3);
for i=1:length(H.q(1:97,2:7))
    
plot(i,Qk((i)*len,3),'r*');
hold on

end
plot(1:length(H.q(1:97,2:7)),H.q(1:97,4));
hold off
legend('after forward kinematics','given');
title('Angle 3')

subplot(3,2,4);
for i=1:length(H.q(1:97,2:7))
    
plot(i,Qk((i)*len,4),'c*');
hold on

end
plot(1:length(H.q(1:97,2:7)),H.q(1:97,5));
hold off
legend('after forward kinematics','given');
title('Angle 4')

subplot(3,2,5);
for i=1:length(H.q(1:97,2:7))
    
plot(i,Qk((i)*len,5),'m*');
hold on

end
plot(1:length(H.q(1:97,2:7)),H.q(1:97,6));
hold off
legend('after forward kinematics','given');
title('Angle 5')
subplot(3,2,6);
for i=1:length(H.q(1:97,2:7))
    
plot(i,Qk((i)*len,6),'y*');
hold on

end
plot(1:length(H.q(1:97,2:7)),H.q(1:97,7));
hold off
legend('after forward kinematics','given');
title('Angle 6')
