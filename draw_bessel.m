function [ res ] = draw_bessel( r, theta, v, N )
% ��������ͼ���������ݸ�����r��theta����ͼ��
% r,thetaΪ���飬Ϊ����ȡֵ��Χ����r = 0:0.2:5, theta = -5:0.1:5��
% vΪ��������Ϊ������,
% NΪ������������
% ���ؽ��res���Ա궨�������е��ĸ�״̬�ˡ�
% ��ʼ
res = 1;
% ����
[R,T] = meshgrid(r,theta);
f = bessel1(R,T,v,N);
res = 2;
% ��ͼ10
Z = R.*exp(1i*T);
cplxmap(Z,f);
colorbar;
%shading interp %�Ӹ�Ӱ������
%colormap(copper) %��ɫΪͭɫ
% ����
res = 0;

end