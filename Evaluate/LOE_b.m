function value = LOE_b(epic, ipic)
% ipic: input low light image
% epic: enhanced image


ipic=double(ipic);
epic=double(epic);

[m,n,k]=size(ipic);

%get the local maximum for each pixel of the input image
win=5;
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

%get the downsampled image
num=50;
blkm=floor(m/num);
blkn=floor(n/num);

ipic_ds=imax(1:blkm:num*blkm,1:blkn:num*blkn);
epic_ds=emax(1:blkm:num*blkm,1:blkn:num*blkn);

for i=1:num
    for j=1:num
        ipic_temp = ipic_ds;
        ipic_temp(ipic_temp<ipic_ds(i,j))=0;
        ipic_temp(ipic_temp>ipic_ds(i,j)|ipic_temp==ipic_ds(i,j))=1;
        
        epic_temp = epic_ds;
        epic_temp(epic_temp<epic_ds(i,j))=0;
        epic_temp(epic_temp>epic_ds(i,j)|epic_temp==epic_ds(i,j))=1;
        
        flag=(ipic_temp~=epic_temp);
        
        RD(i,j) = sum(flag(:));
    end
end
% 
% 
% for i=1:win
%     for j=1:win
%         flag1=ipic_ds>=ipic_ds(i,j);
%         flag2=epic_ds>=epic_ds(i,j);
%         flag=(flag1~=flag2);
%         Value_loe(i,j)=sum(flag(:));
%     end
% end

value = sum(RD(:));
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
