%影片生成例子: 旋转一个三维表面绘图
r = 0:0.1:4;
theta = -500:0.1:500;
draw_bessel(r,theta,1,30)
%draw_bessel(r,theta,1,20)
%hold on
%draw_bessel(r,theta,1.2,20)
%hold on
%draw_bessel(r,theta,1.4,20)
%[X, Y, Z]=peaks(50); %创建山峰图形数据
%surfl(X, Y, Z) %绘制带光照的表面
axis([-20 20 -20 20 -20 20 -20 20]) %限制绘图范围
%axis vis3d off %三维坐标修正,关闭坐标轴箭头
axis equal %等比例显示三维坐标
%%shading interp %加个影子美化
%colormap(copper) %着色为铜色
for p=1:200 %旋转山峰,从1到360度,每一度捕捉一帧
draw_bessel2(r,-5:0.01*pi:5,1,p) %从水平-37.5+i度,垂直30度的方向看山峰%p/20变得快,p/100好看
%view([0.2*p,30])%50高，30正好
xlabel x
ylabel y
title(['This is figure for V=1 N='num2str(p)]);
pic(p)=getframe; %每从一个角度看到一张图像(帧),就存储到m
end %每次看完,水平转动1度,直到1周360度;
cla %为播放影片清除坐标
movie(pic) %把刚才存到m里的图像连续播放一遍,就是影片了.
