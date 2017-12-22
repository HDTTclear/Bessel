function [ res ] = bessel1( r, theta, v, N )
%BESSEL1 ������������̵�һ�⡣
%   r,theta Ϊʵ����v,NΪ��ֵ��v������ʵ��Ϊ��
%   ���ݵ�һ��ı��ʽ�����k���Ϊf(k),��f(k)/f(0) = -1/(4*k*(k+v))*z^2����z�ĵ�ֵ������
%   ��vʵ��ΪС������Ҫ������ֵ��֧����һ���ͷ�ٸ�

%   TODO Ѱ�Һ��ʵ�v-N��
%   TODO �޸ĳ���ṹʹ����Ӧ��ֵ������ͼ

% ����z
z = r.*exp(1i*theta);
% ����-(z/2)^2
z0 = -(z/2).^2;
% ����k=0����
fact = double(1/(Gamma(v+1,20))/(2^v)); % ���ȼ���ϵ���Է�ֹ�ظ�����Gamma
serie = (r.^v).*(exp(1i*v*theta))*fact; % ���ڻ�����һ���ļ���
res = serie;
% ѭ�������ؾ����㷨����
for k=1:N
    serie = serie.*z0/(k*(k+v));
    res = res + serie; 
end
% ��res���ű���ת��Ϊcomplexdouble
res = complex(double(real(res)) ,double(imag(res)) );
end

