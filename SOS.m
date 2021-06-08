clear
f=3;            % number of the function
npob=50;        % population size
nvar=2;         % number of optimized variables
ittot=15;    % total iterations
fitaac=zeros(16,10);

if f==1 || f==5
    lb = -50*ones(1,nvar);        % lower bound
    ub = 50*ones(1,nvar);         % upper bound
elseif f==2 || f==3
    lb = -10*ones(1,nvar);        % lower bound
    ub = 10*ones(1,nvar);         % upper bound
elseif f==4
    lb = -2*ones(1,nvar);        % lower bound
    ub = 2*ones(1,nvar);         % upper bound
elseif f==6
    lb = -5.12*ones(1,nvar);        % lower bound
    ub = 5.12*ones(1,nvar);         % upper bound
end
for iter1=1:10
% variable initialization
graf=1;
fita=zeros(ittot/graf,1);
ind=1;

% ecosystem generation
xt=rand(npob,nvar).*(ub(1)-lb(1)) + lb(1);
% fitness 
fit=opt_fun(xt);

% finds best fitness
ibest=find(fit==min(fit));
ibest=ibest(1);

tic

for iter=0:ittot
for it=1:npob
%------------------------------ Mutualism -------------------------------
% choosing the random organism
jt=randi(npob-1);
jt=jt+(jt>=it);

% Mutual vector
mv=(xt(it,:)+xt(jt,:))/2;

% benefit factor vector
bf=randi(2,[2,1]);

% new organisms
xin=xt(it,:) + rand(1,nvar).*(xt(ibest,:)-mv*bf(1));
xjn=xt(jt,:) + rand(1,nvar).*(xt(ibest,:)-mv*bf(2));
xin(xin>ub)=ub(xin>ub); xin(xin<lb)=lb(xin<lb);
xjn(xjn>ub)=ub(xjn>ub); xjn(xjn<lb)=lb(xjn<lb);

% objective function value of old organisms
fiti=opt_fun(xt(it,:));
fitj=opt_fun(xt(jt,:));

% objective function value of new organisms
fitin=opt_fun(xin);
fitjn=opt_fun(xjn);

% Replace old organism if the new organisms have a better (lower) fitness
if fitin<fiti
    xt(it,:)=xin;
end
if fitjn<fitj
    xt(jt,:)=xjn;
end

%------------------------- Comensalismo --------------------------------
% choosing the random organism
jt=randi(npob-1);
jt=jt+(jt>=it);

% new organism
xin=xt(it,:) + (2*rand(1,nvar)-1).*(xt(ibest,:)-xt(jt,:));
xin(xin>ub)=ub(xin>ub); xin(xin<lb)=lb(xin<lb);

% objective function value of old organisms
fiti=opt_fun(xt(it,:));

% objective function value of new organisms
fitin=opt_fun(xin);

% Replace old organism if the new organisms have a better (lower) fitness
if fitin<fiti
    xt(it,:)=xin;
end

%----------------------- Parasitism -----------------------------------
% choosing the random organism
jt=randi(npob-1);
jt=jt+(jt>=it);

% number of dimensions that are going to be modified
nd=randi(nvar);
% dimensions that are going to be modified
cd=randperm(nvar);
cd=cd(1:nd);

% parasite vector
xp=xt(it,:);
xp(cd)=rand(1,nd)*(ub(1)-lb(1))+lb(1:nd);

% fitness of host organism
fitj=opt_fun(xt(jt,:));

% fitness of parasite organism
fitp=opt_fun(xp);

% Replace host organism if parasite organism has a better fitness
if fitp<fitj
    xt(it,:)=xin;
end
end

% Evaluate fitness
fit=opt_fun(xt);
% Find best fitness
ibest=find(fit==min(fit));
ibest=ibest(1);

if mod(iter,graf)==0
    % Acumulated fitness
    fita(ind)=min(fit);
    ind=ind+1;
end
end
fitaac(:,iter1) = fita;
end
toc
fitaSOS3 = mean(fitaac,2);
