Z=1000;

mu=[0, 3.1];
sigma=[1 1];
p1=.7;
p2=1-p1;

Y=zeros(1,Z);

%gen data
unrnd=rand(1,Z);
ind=find(unrnd<=p1);
Y(ind)=mu(1)+sigma(1)*randn(1,length(ind));
ind=find(unrnd>p1);
Y(ind)=mu(2)+sigma(2)*randn(1,length(ind));

start=[.5 .5; 0 1; 3 4; .1 2.9];


N=1000;

est=zeros(2,N);



for k=1:size(start,1)
  est(:,1)=start(k,:);
for ii=2:N
    T=zeros(2,Z);
    T(1,:)=p1*exp(-.5*(Y-est(1,ii-1)).^2/sigma(1))/(sqrt(2*pi)*sigma(1));
    T(2,:)=p2*exp(-.5*(Y-est(2,ii-1)).^2/sigma(2))/(sqrt(2*pi)*sigma(2));
    
    temp=sum(T,1);
    %keyboard;
    T=T./repmat(temp,2,1);
    
    est(:,ii)=T*Y'./sum(T,2);
end

    est(:,end)
    figure (k)
    plot(est(1,1:25),'r-');
    hold on;
    plot(est(2,1:25),'b-');
    
end
