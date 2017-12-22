function [ res ] = Gamma( z, n )
%GAMMA ���ַ����㸴��gamma����
%   ���ڼ���Gamma(x+iy)��x��Сʱ��ֵ
if nargin < 2
    % n = 10��Ĭ��ֵ
    n = 10;
end
if real(z) == z
    % ����zΪʵ����ֱ�ӵ�������gammaʵ����
    res = gamma(z);
else
    % ���������������ּ��㣬������õݹ�ʽ
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

