function [ res ] = bessel1( r, theta, v, N )
%BESSEL1 解出贝塞尔方程第一解。
%   r,theta 为实矩阵，v,N为单值。v不限制实部为正
%   根据第一解的表达式，设第k项级数为f(k),则f(k)/f(0) = -1/(4*k*(k+v))*z^2，是z的单值函数。
%   若v实部为小数，需要给出单值分支，这一点回头再改

%   TODO 寻找合适的v-N对
%   TODO 修改程序结构使其适应多值函数画图

% 计算z
z = r.*exp(1i*theta);
% 计算-(z/2)^2
z0 = -(z/2).^2;
% 计算k=0级数
fact = double(1/(Gamma(v+1,20))/(2^v)); % 首先计算系数以防止重复计算Gamma
serie = (r.^v).*(exp(1i*v*theta))*fact; % 用于缓存上一级的级数
res = serie;
% 循环，用秦九韶算法叠加
for k=1:N
    serie = serie.*z0/(k*(k+v));
    res = res + serie; 
end
% 把res符号变量转化为complexdouble
res = complex(double(real(res)) ,double(imag(res)) );
end

