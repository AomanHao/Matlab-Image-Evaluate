%% ������� 
% ���˲��� https://www.aomanhao.top
% Github https://github.com/AomanHao
%--------------------------------------
clear
close all
clc
%% 
img=imread('Test1.jpg');
% img=imread('Test2.jpg');
figure;imshow(img),title('ԭʼͼ��');

%% ����ͼ���ͨ͸��
output = Evaluta(img);
