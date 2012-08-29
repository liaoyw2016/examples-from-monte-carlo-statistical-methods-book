N=1000;
theta=3.2;
censor_point=3.7;

%generate data
data=theta+randn(1,N);
ind=find(data<censor_point);
censored_data=data(ind);
N_censor_data=N-length(ind);



%EM algo
N_iterations=250;
thet_est=zeros(1,N_iterations);
thet_est(1)=1;

for ii=2:N_iterations
    thet_est(ii)=length(censored_data)*mean(censored_data)/N+ N_censor_data/N*(thet_est(ii-1)+normpdf(censor_point,thet_est(ii-1),1)/(1-normcdf(censor_point,thet_est(ii-1),1)));
end

