% Call: emee (Measure of Enhancement)(A,M,L,alpha)
% The 1st measure, EME, measure of enhancement by entropy calculation
%<A new measure of image enhancement>'S.S Agaian, K.Panetta'2000
%rewrite by AomanHao

function E=EMEE(X,L)
% defalt L=8
if isempty(L)
    L=8;
end
[m,n]=size(X);

num_m=floor(m/L);
num_n=floor(n/L);

E_temp=0;
for m=1:num_m
    m1 = (m-1)*L+1;
    for n=1:num_n
        n1 = (n-1)*L+1;
        B1=X(m1:m1+L-1,n1:n1+L-1);
        b_min=min(min(B1));
        b_max=max(max(B1));
        
        if b_max ==  b_min
            continue
        else
            b_ratio=b_max/(b_min+1e-4);
            E_temp=E_temp+b_ratio*log(b_ratio);
        end
    end
end
E=E_temp/num_m/num_n;
