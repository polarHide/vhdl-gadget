% file : sinMif.m
% function : 使用matlab生成mif文件，存为sin8bit_128.mif，作为8位数据线、10位地址线的RAM程序的初始化文件
% sin8bit_128.mif : 含128个点，每个点8位二进制数的一个周期的正弦波波形，设初相位为0
% author : ojw
% createDate : 2019-10-22

F1 = 1; %信号的频率
Fs = 2^7;  %采样频率
P1 = 0; %信号初相位0
N = 2^7; %采样点数128点
t = [0 : 1/Fs : (N-1)/Fs];  %采样时刻
ADC = 2^5;  %直流分量
A = 2^4;  %信号幅度
s = A*sin(2*pi*F1*t + pi*P1/180) + ADC; %生成信号
plot(s);  %绘制图形
fild = fopen('c:/sinMif/sin8bit_128.mif','wt');  %创建mif文件
% 写入mif文件文件头
fprintf(fild,'%s\n','WIDTH=8;');    %位宽
fprintf(fild,'%s\n\n','DEPTH=128;');   %深度
fprintf(fild,'%s\n','ADDRESS_RADIX=BIN;');  %地址格式
fprintf(fild,'%s\n\n','DATA_RADIX=BIN;');   %数据格式
fprintf(fild,'%s\t','CONTENT'); %地址
fprintf(fild,'%s\n','BEGIN');

for i = 1 : N
    s2(i) = round(s(i));    %对小数四舍五入取整
   
    % addr : data;
    fprintf(fild,'\t%s\t',dec2bin((i-1),10)); %地址从0开始编码
    fprintf(fild,'%s\t',':');
    fprintf(fild,'%s',dec2bin(s2(i),8));
    fprintf(fild,'%s\n',';');
end
fprintf(fild,'%s\n','END');

