%ӰƬ��������: ��תһ����ά�����ͼ
r = 0:0.1:4;
theta = -500:0.1:500;
draw_bessel(r,theta,1,30)
%draw_bessel(r,theta,1,20)
%hold on
%draw_bessel(r,theta,1.2,20)
%hold on
%draw_bessel(r,theta,1.4,20)
%[X, Y, Z]=peaks(50); %����ɽ��ͼ������
%surfl(X, Y, Z) %���ƴ����յı���
axis([-20 20 -20 20 -20 20 -20 20]) %���ƻ�ͼ��Χ
%axis vis3d off %��ά��������,�ر��������ͷ
axis equal %�ȱ�����ʾ��ά����
%%shading interp %�Ӹ�Ӱ������
%colormap(copper) %��ɫΪͭɫ
for p=1:200 %��תɽ��,��1��360��,ÿһ�Ȳ�׽һ֡
draw_bessel2(r,-5:0.01*pi:5,1,p) %��ˮƽ-37.5+i��,��ֱ30�ȵķ���ɽ��%p/20��ÿ�,p/100�ÿ�
%view([0.2*p,30])%50�ߣ�30����
xlabel x
ylabel y
title(['This is figure for V=1 N='num2str(p)]);
pic(p)=getframe; %ÿ��һ���Ƕȿ���һ��ͼ��(֡),�ʹ洢��m
end %ÿ�ο���,ˮƽת��1��,ֱ��1��360��;
cla %Ϊ����ӰƬ�������
movie(pic) %�ѸղŴ浽m���ͼ����������һ��,����ӰƬ��.
