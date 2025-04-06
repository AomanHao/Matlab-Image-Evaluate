%% �������
% ���˲��� https://www.aomanhao.top
% Github https://github.com/AomanHao
%--------------------------------------
clear
close all
clc

addpath('.\Evaluate_tool\');
addpath('.\Evaluate_tool\niqe_release');
%%
img=imread('.\data\Test1.jpg');
figure;imshow(img),title('ԭʼͼ��');


%% ͨ͸�� Permeability
Eva(1) = Evaluta(img);

%% �޲ο�ָ�� NIQE
load modelparameters.mat
blocksizerow    = 24;blocksizecol    = 24;
blockrowoverlap = 0;blockcoloverlap = 0;
Eva(2)= computequality(img./255,blocksizerow,blocksizecol,...
    blockrowoverlap,blockcoloverlap,mu_prisparam,cov_prisparam);

