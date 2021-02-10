%% 程序分享 
% 个人博客 https://www.aomanhao.top
% Github https://github.com/AomanHao
%--------------------------------------
clear
close all
clc
%% 
% img=imread('test.jpg');
img=imread('3096.jpg');
figure;imshow(img),title('原始图像');

%% 评价图像的通透度
output = Evaluta(img);
