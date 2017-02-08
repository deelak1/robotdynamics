uiopen('load')

RP = evalin('base', 'RP');

I1=RP.Izz(1) + (RP.mass(1) * (0.02)^2) + (RP.mass(2) * RP.d(2)^2)...
    +(RP.mass(2) * (0.1157)^2)+ RP.Ixx(2)+RP.Iyy(3)...
    +(2 * RP.mass(2) * RP.d(2) * 0.1157) +( RP.mass(2) * 0)...
    + (RP.mass(3) * 0.0238^2)+RP.Izz(4)+RP.Iyy(5)+RP.Izz(6);
I2=RP.Izz(2)+(RP.mass(2)*(0.02^2))+((RP.a(2)^2)*(RP.mass(3)+RP.mass(4)+RP.mass(5)+RP.mass(6)))
I3=-RP.Ixx(2)+RP.Iyy(2)+(RP.mass(3)+RP.mass(4)+RP.mass(5)+RP.mass(6))*(RP.a(2)^2)
I4=RP.mass(2)*0.13*(RP.d(2)+0.1157)+RP.mass(3)*RP.a(2)*(0.0238)...
    +(RP.mass(3)+RP.mass(4)+RP.mass(5)+RP.mass(6))*RP.a(2)*(RP.d(2)*RP.d(3))
I5=(RP.mass(4)+RP.mass(5)+RP.mass(6))*RP.a(2)*RP.d(4)+(RP.mass(4)*RP.a(2)*0.01)
I6=RP.Izz(3)+(RP.mass(3)*(0.0238^2))+RP.mass(4)*((RP.d(4)+0.01)^2)...
    +RP.Iyy(4)+(RP.mass(5)*RP.a(3)^2)+(RP.mass(5)*RP.d(4)^2)+RP.Izz(5)...
    +(RP.mass(6)*RP.a(3)^2)+(RP.mass(6)*RP.d(4)^2)+(RP.mass(6)*0.02^2)+RP.Ixx(6)
I7=RP.Ixx(3)-RP.Iyy(3)+(RP.mass(4)*0.0100^2)+(2*RP.mass(4)*RP.d(4)*0.0100)...
    +(RP.mass(4)+RP.mass(5)+RP.mass(6))*(RP.d(4)^2-RP.a(3)^2)...
    +RP.Iyy(4)-RP.Izz(4)+RP.Izz(5)-RP.Iyy(5)+(RP.mass(6)*0.0200^2)...
    -RP.Izz(6)+RP.Ixx(6)
I8=0
I9=0
I10=(2*RP.mass(4)*RP.a(3)*0.01)+2*(RP.mass(4)+RP.mass(5)+RP.mass(6))*RP.a(3)*RP.d(4)
I11=-2*RP.mass(2)*.13*0
I12=(RP.mass(4)+RP.mass(5)+RP.mass(6))*(RP.a(2)*RP.a(3))
I13=0
I14=RP.Izz(4)+RP.Iyy(5)+RP.Izz(6)
I15=RP.mass(6)*RP.d(4)*0.02
I16=RP.mass(6)*RP.a(2)*0.02
I17=RP.Izz(5)+RP.Ixx(6)+RP.mass(6)*0.02^2
I18=0




