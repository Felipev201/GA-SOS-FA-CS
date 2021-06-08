clear
f=3;            % number of the function
npob=60;        % population size
nvar=2;         % number of optimized variables
ittot=1000;    % total iterations
fitaac=zeros(101,10);

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
% Variable initialization
graf=10;
fita=zeros(ittot/graf,1);
ind=1;
padre = zeros(npob/2,1);
extinto = zeros(npob/2,1);

% initial population
xt=rand(npob,nvar).*(ub(1)-lb(1)) + lb(1);

% fitness 
fit=opt_fun(xt);

tic

for gen=0:ittot
%------------------------ Natural selection -------------------------------
% by Roulette
% fit1=-fit+max(fit);
% % normalized fitnes
% fitn=cumsum(fit1/sum(fit1));
% % rearanging
% rul=linspace(0,(npob-1)/npob,npob) + rand/npob;
% n=1;
% xtn=xt;
% for it=1:npob
%     sel=find(rul(it)<fitn);
%     for icol=1:nvar
%     xtn(sel,icol)=xt(it,icol);
%     end
% end

% by tournement
for it=1:2:npob
    if fit(it)<fit(it+1)
        padre((it+1)/2) = it;
        extinto ((it+1)/2) = it + 1;
    else
        padre((it+1)/2) = it + 1;
        extinto ((it+1)/2) = it;
    end
end
%------------------------- Crossover --------------------------------
% crossover rate
pc=.9;
mpc=repmat(rand(npob/4,1)<pc,1,nvar);

% chose parents 
vp=randperm(npob/2);
v1=padre(vp(1:npob/4));
v2=padre(vp(npob/4+1:end));

% new individuals
xt(extinto(1:npob/4),:)=xt(v1,:) - rand(npob/4,nvar).*(xt(v1,:)-xt(v2,:)).*mpc;
xt(extinto(npob/4+1:end),:)=xt(v2,:) + rand(npob/4,nvar).*(xt(v1,:)-xt(v2,:)).*mpc;
xt(xt>ub)=ub(xt>ub); xt(xt<lb)=lb(xt<lb);

%-------------------------------- Mutation --------------------------------
% mutation rate
pm=.01;
mpc=rand(npob,nvar)<pm;
nmpc=mpc==0;

% mutated individual
xt = xt.*nmpc + (rand(npob,nvar)*(ub(1)-lb(1)) + lb).*mpc;


% fitness
fit=opt_fun(xt);
if mod(gen,graf)==0
    % cumulative fitness
    fita(ind)=min(fit);
    ind=ind+1;
end
end
fitaac(:,iter1) = fita;
end
toc
fitaGA3 = mean(fitaac,2);
plot(0:graf:ittot,fita,'.')