%% ������� 
% ���˲��� https://www.aomanhao.top
% Github https://github.com/AomanHao
%--------------------------------------
clear
close all
clc
%% 
% img=imread('test.jpg');
img=imread('3096.jpg');
figure;imshow(img),title('ԭʼͼ��');

%% ����ͼ���ͨ͸��
output = Evaluta(img);
