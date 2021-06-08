clear
alfa=.2; beta=1;  gamma=1;
f=3;            % number of the function
npob=50;        % population size
nvar=2;         % number of optimized variables
ittot=20;    % total iterations
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

% initial population
xt=rand(npob,nvar).*(ub(1)-lb(1)) + lb(1);
% fitness 
fit=opt_fun(xt);

% Finds best fitness
ibest=find(fit==min(fit));
ibest=ibest(1);

tic

for iter=0:ittot
for it=1:npob
% Which have lower fitness
pf=fit>opt_fun(xt(it,:));

% Dimesnions that are going to be modified
xm=xt(pf,:);

% number of individuals with worst fitness
cpf=size(xm,1);

% distance
rcv=xm-repmat(xt(it,:),cpf,1);
rsq=sum(rcv.*rcv,2);
rsq=repmat(rsq,1,nvar);

% new population
xmn = xm + beta*exp(-gamma*rsq).*-rcv + (2*rand(cpf,nvar)-1).*alfa;
xmn(xmn>ub(1:cpf,:))=ub(xmn>ub(1:cpf,:)); 
xmn(xmn<lb(1:cpf,:))=lb(xmn<lb(1:cpf,:));

% % poblacion que esta en la mitad superior
% xmmax=xmn>((ub(1:cpf,:)-lb(1:cpf,:))/2);
% % poblacion que está en la mitad inferior
% xmmin=xmmax==0;
xt(pf,:)=xmn;

% fitness 
fit=opt_fun(xt);


end

% Fitness
fit=opt_fun(xt);
% Finds best fitness
ibest=find(fit==min(fit));
ibest=ibest(1);

if mod(iter,graf)==0
    % Cumulative fitness
    fita(ind)=min(fit);
    ind=ind+1;
end
end
fitaac(:,iter1) = fita;
end
toc
fitaFA3 = mean(fitaac,2);
plot(0:graf:ittot,fita)