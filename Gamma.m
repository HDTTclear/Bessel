function [ res ] = Gamma( z, n )
%GAMMA 积分法计算复数gamma函数
%   用于计算Gamma(x+iy)当x较小时的值
if nargin < 2
    % n = 10，默认值
    n = 10;
end
if real(z) == z
    % 假如z为实数，直接调用内置gamma实函数
    res = gamma(z);
else
    % 如果积分收敛则积分计算，否则采用递归式
    if real(z) > 0
        syms t;
        f = t.^(z-1).*exp(-t);
        ga = int(f,t,0,inf);
        res = vpa(ga,n);
    else
        res = vpa(Gamma(z+1, n)./z, n);
    end
end

end

