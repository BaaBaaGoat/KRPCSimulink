clear;clc;
load matlab.mat
% 输入数据平滑
for i=1:4
quater(:,i) = conv(quater(:,i),ones(1,5)/5,'same');
end
% 纠正符号和初始旋转
quater = quater .* [1 -1 1 -1];
quater_bias = quatdivide(quater,[-sqrt(2) 0 sqrt(2) 0]);
% 转欧拉角
[i j k] = quat2angle(quater_bias,'zxy');
euler_recov = [j k i]*180/pi;

% 输入欧拉角，纠正范围和符号
euler(:,2) = euler(:,2) * -1;
euler(euler > 180) = euler(euler > 180) - 360;

% 画图，显示值和误差
close all;
figure;
for i=1:3
subplot(3,2,i*2-1);
plot(euler(:,i),'DisplayName','euler');hold all;
plot(euler_recov(:,i),'DisplayName','euler_recov')
subplot(3,2,i*2);
plot(euler(:,i) - euler_recov(:,i),'DisplayName','error');
end
