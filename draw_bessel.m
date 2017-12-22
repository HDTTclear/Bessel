function [ res ] = draw_bessel( r, theta, v, N )
% 贝塞尔画图函数，根据给定的r，theta来画图。
% r,theta为数组，为两者取值范围（如r = 0:0.2:5, theta = -5:0.1:5）
% v为标量，不为负整数,
% N为正整数，项数
% 返回结果res可以标定程序运行到哪个状态了。
% 开始
res = 1;
% 计算
[R,T] = meshgrid(r,theta);
f = bessel1(R,T,v,N);
res = 2;
% 作图10
Z = R.*exp(1i*T);
cplxmap(Z,f);
colorbar;
%shading interp %加个影子美化
%colormap(copper) %着色为铜色
% 结束
res = 0;

end