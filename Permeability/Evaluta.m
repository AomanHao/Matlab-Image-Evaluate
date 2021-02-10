function EvalutaValue = Evaluta(image)

[row, col] = size(image(:,:,1));
MinPixel = zeros(3, 1);
MinImage = zeros(row, col);
R_Channel = image(:,:,1);
G_Channel = image(:,:,2);
B_Channel = image(:,:,3);


%% ͨ����С����
for i = 1:row
    for j = 1:col
       MinPixel(1,1) = R_Channel(i, j);
       MinPixel(2,1) = G_Channel(i, j);
       MinPixel(3,1) = B_Channel(i, j);
       MinImage(i,j) = min(MinPixel);
    end
end

%% ����ģ��
 CenterSize= round(row / 40)*2 +1;
 padsize = (CenterSize - 1) / 2;
 MinImagePad = padarray(MinImage,[padsize, padsize],'symmetric','both'); % ���ͼ��
 MinImagePad1 = zeros(size(MinImagePad));

%% ͨ����С����
for i = padsize+1 : padsize+row
    for j = padsize+1 : padsize+col
        Local = MinImagePad(i-padsize: i+padsize, i-padsize: i+padsize);
        LocalMin = min(min(Local));
        MinImagePad1(i,j) = LocalMin;
    end
end
 
 EvalutaImg = MinImagePad1(padsize:padsize+row,padsize:padsize+col);
 
 EvalutaValue = mean(mean(EvalutaImg));
 
 
