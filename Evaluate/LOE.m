%% lightness-order-error (LOE) measure
%rewrite by AomanHao
%https://www.aomanhao.top/
function value_loe = LOE(epic, ipic)
% ipic: input low light image
% epic: enhanced image


ipic=double(ipic);
epic=double(epic);

[m,n,k]=size(ipic);
RD = zeros(m,n);

%get the local maximum for each pixel of the input image
win=7;
if k>1
    imax=round(max(max(ipic(:,:,1),ipic(:,:,2)),ipic(:,:,3)));
    imax=getlocalmax(imax,win);
    %get the local maximum for each pixel of the enhanced image
    emax=round(max(max(epic(:,:,1),epic(:,:,2)),epic(:,:,3)));
    emax=getlocalmax(emax,win);
else
    imax=getlocalmax(ipic,win);
    %get the local maximum for each pixel of the enhanced image
    emax=getlocalmax(epic,win);
end


for i=1:m
    for j=1:n
        ipic_temp = ipic;
        ipic_temp(ipic_temp<ipic(i,j))=0;
        ipic_temp(ipic_temp>ipic(i,j)&ipic_temp==ipic(i,j))=1;
        
        epic_temp = epic;
        epic_temp(epic_temp<epic(i,j))=0;
        epic_temp(epic_temp>epic(i,j)&epic_temp==epic(i,j))=1;
        
        flag=(ipic_temp~=epic_temp);
        
        RD(i,j) = sum(flag(:));
    end
end

value_loe = mean(RD(:));
end

function output=getlocalmax(pic,win)
[m,n]=size(pic);
extpic=getextpic(pic,win);
output=zeros(m,n);
for i=1+win:m+win
    for j=1+win:n+win
        modual=extpic(i-win:i+win,j-win:j+win);
        output(i-win,j-win)=max(modual(:));
    end
end
end

function output=getextpic(im,win_size)
[h,w,c]=size(im);
extpic=zeros(h+2*win_size,w+2*win_size,c);
extpic(win_size+1:win_size+h,win_size+1:win_size+w,:)=im;
for i=1:win_size%extense row
    extpic(win_size+1-i,win_size+1:win_size+w,:)=extpic(win_size+1+i,win_size+1:win_size+w,:);%top edge
    extpic(h+win_size+i,win_size+1:win_size+w,:)=extpic(h+win_size-i,win_size+1:win_size+w,:);%botom edge
end
for i=1:win_size%extense column
    extpic(:,win_size+1-i,:)=extpic(:,win_size+1+i,:);%left edge
    extpic(:,win_size+w+i,:)=extpic(:,win_size+w-i,:);%right edge
end
output=extpic;
end % function
