function [ res ] = bessel2( r, theta, v, N )
%BESSEL2 ���������̵ڶ��⣬��ŵ����������
%   r,theta Ϊʵ����v,NΪ��ֵ��v����ʵ��Ϊ��
%   ��vΪ������ʱ�����в�ͬ�ı��ʽ

% ����ϵ��
c = cos(pi*v);
s = sin(pi*v);
if v == int32(real(v))
    % ����
    n=v;
    % ������
    l = (2/pi)*bessel1(r,theta,v,N).*(log(r/2)+1i*theta);
    % �������ò�����v�������޶�ֵ�ԣ�
    z0 = (r/2).*exp(1i*theta);
    z2 = z0.^2;
    % ����׳ˣ�0-n+N��������㵽170!��
    facts = ones(n+N+1, 1);
    % factsΪgamma����ֵ
    for k=2:n+N+1
        if k>172
            facts(k)=inf;
        else
            facts(k)=facts(k-1)*(k-1);
        end  
    end    
    % ���������
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
    
    % ���������
    zn = z0.^(n);
    sum2 = (psi(1)+psi(n+1))/facts(n+1)*zn;
    for k=1:N
        zn = zn.*(-z2);
        sum2 = sum2 + (psi(n+k+1)+psi(k+1))/facts(k+1)/facts(n+k+1)*zn;
    end
    % TODO
    res = l-(sum1+sum2)/pi;
else
    % ������
    res = (c/s)*bessel1(r,theta,v,N)-(1/s)*bessel1(r,theta,-v,N);
end


end

