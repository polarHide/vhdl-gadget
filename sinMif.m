F1 = 1; %�źŵ�Ƶ��
Fs = 2^7;  %����Ƶ��
P1 = 0; %�źų���λ0
N = 2^7; %��������128��
t = [0 : 1/Fs : (N-1)/Fs];  %����ʱ��
ADC = 2^5;  %ֱ������
A = 2^4;  %�źŷ���
s = A*sin(2*pi*F1*t + pi*P1/180) + ADC; %�����ź�
plot(s);  %����ͼ��
fild = fopen('c:/sinMif/sin8bit_128.mif','wt');  %����mif�ļ�
% д��mif�ļ��ļ�ͷ
fprintf(fild,'%s\n','WIDTH=8;');    %λ��
fprintf(fild,'%s\n\n','DEPTH=128;');   %���
fprintf(fild,'%s\n','ADDRESS_RADIX=BIN;');  %��ַ��ʽ
fprintf(fild,'%s\n\n','DATA_RADIX=BIN;');   %���ݸ�ʽ
fprintf(fild,'%s\t','CONTENT'); %��ַ
fprintf(fild,'%s\n','BEGIN');

for i = 1 : N
    s2(i) = round(s(i));    %��С����������ȡ��
   
    % addr : data;
    fprintf(fild,'\t%s\t',dec2bin((i-1),10)); %��ַ��0��ʼ����
    fprintf(fild,'%s\t',':');
    fprintf(fild,'%s',dec2bin(s2(i),8));
    fprintf(fild,'%s\n',';');
end
fprintf(fild,'%s\n','END');

