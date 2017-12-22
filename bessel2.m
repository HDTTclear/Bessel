function [ res ] = bessel2( r, theta, v, N )
%BESSEL2 贝塞尔方程第二解，即诺依曼函数。
%   r,theta 为实矩阵，v,N为单值。v限制实部为正
%   当v为正整数时，具有不同的表达式

% 计算系数
c = cos(pi*v);
s = sin(pi*v);
if v == int32(real(v))
    % 整数
    n=v;
    % 对数项
    l = (2/pi)*bessel1(r,theta,v,N).*(log(r/2)+1i*theta);
    % 计算有用参数（v整数，无多值性）
    z0 = (r/2).*exp(1i*theta);
    z2 = z0.^2;
    % 计算阶乘（0-n+N）（最多算到170!）
    facts = ones(n+N+1, 1);
    % facts为gamma函数值
    for k=2:n+N+1
        if k>172
            facts(k)=inf;
        else
            facts(k)=facts(k-1)*(k-1);
        end  
    end    
    % 部分求和项
    zn = z0.^(-n);
    if n==0
        sum1=0;
    else 
        sum1=facts(n)*zn;
    end
    for k=1:n-1
        zn = zn.*z2;
        sum1 = sum1 + zn * (facts(n-k)/facts(k+1));
    end
    
    % 无穷求和项
    zn = z0.^(n);
    sum2 = (psi(1)+psi(n+1))/facts(n+1)*zn;
    for k=1:N
        zn = zn.*(-z2);
        sum2 = sum2 + (psi(n+k+1)+psi(k+1))/facts(k+1)/facts(n+k+1)*zn;
    end
    % TODO
    res = l-(sum1+sum2)/pi;
else
    % 非整数
    res = (c/s)*bessel1(r,theta,v,N)-(1/s)*bessel1(r,theta,-v,N);
end


end

