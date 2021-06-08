% -----------------------------------------------------------------
% Cuckoo Search (CS) algorithm by Xin-She Yang and Suash Deb      %
% Programmed by Xin-She Yang at Cambridge University              %
% Programming dates: Nov 2008 to June 2009                        %
% Last revised: Dec  2009   (simplified version for demo only)    %
% -----------------------------------------------------------------
% Papers -- Citation Details:
% 1) X.-S. Yang, S. Deb, Cuckoo search via Levy flights,
% in: Proc. of World Congress on Nature & Biologically Inspired
% Computing (NaBIC 2009), December 2009, India,
% IEEE Publications, USA,  pp. 210-214 (2009).
% http://arxiv.org/PS_cache/arxiv/pdf/1003/1003.1594v1.pdf 
% 2) X.-S. Yang, S. Deb, Engineering optimization by cuckoo search,
% Int. J. Mathematical Modelling and Numerical Optimisation, 
% Vol. 1, No. 4, 330-343 (2010). 
% http://arxiv.org/PS_cache/arxiv/pdf/1005/1005.2908v2.pdf
% ----------------------------------------------------------------%
% This demo program only implements a standard version of         %
% Cuckoo Search (CS), as the Levy flights and generation of       %
% new solutions may use slightly different methods.               %
% The pseudo code was given sequentially (select a cuckoo etc),   %
% but the implementation here uses Matlab's vector capability,    %
% which results in neater/better codes and shorter running time.  % 
% This implementation is different and more efficient than the    %
% the demo code provided in the book by 
%    "Yang X. S., Nature-Inspired Metaheuristic Algoirthms,       % 
%     2nd Edition, Luniver Press, (2010).                 "       %
% --------------------------------------------------------------- %
% =============================================================== %
% Notes:                                                          %
% Different implementations may lead to slightly different        %
% behavour and/or results, but there is nothing wrong with it,    %
% as this is the nature of random walks and all metaheuristics.   %
% -----------------------------------------------------------------
% Additional Note: This version uses a fixed number of generation %
% (not a given tolerance) because many readers asked me to add    %
%  or implement this option.                               Thanks.%                          
function [fita,bestnest,fmin]=cuckoo_search(n)
if nargin<1,
% Number of nests (or different solutions)
n=50;
end
% Discovery rate of alien eggs/solutions
pa=0.25;
%% Change this if you want to get better results
N_IterTotal=45;
fita=zeros(45,1);
%% Simple bounds of the search domain
% Lower bounds
nd=2;%Dimensiones del problema
Lb=-10*ones(1,nd);
% Lb=[-1.5,-3];
% Upper bounds
Ub=10*ones(1,nd);
% Ub=[4,4];
% Random initial solutions
for i=1:n,
nest(i,:)=Lb+(Ub-Lb).*rand(size(Lb));
%Soluciones aleatorias entre [Lb,Ub] 
end
% Get the current best
fitness=10^10*ones(n,1);
[fmin,bestnest,nest,fitness]=get_best_nest(nest,nest,fitness);
N_iter=0;
%% Starting iterations
for iter=1:N_IterTotal
    % Generate new solutions (but keep the current best)
     new_nest=get_cuckoos(nest,bestnest,Lb,Ub);   
     [fnew,best,nest,fitness]=get_best_nest(nest,new_nest,fitness);
    % Update the counter
      N_iter=N_iter+n; 
    % Discovery and randomization
      new_nest=empty_nests(nest,Lb,Ub,pa) ;
    
    % Evaluate this set of solutions
      [fnew,best,nest,fitness]=get_best_nest(nest,new_nest,fitness);
    % Update the counter again
      N_iter=N_iter+n;
    % Find the best objective so far  
    if fnew<fmin,
        fmin=fnew;
        bestnest=best;
    end
    fita(iter) = fmin;
end %% End of iterations
%% Post-optimization processing
%% Display all the nests
disp(strcat('Total number of iterations=',num2str(N_iter)))
fmin
% bestnest
%% --------------- All subfunctions are list below ------------------
%% Get cuckoos by ramdom walk
function nest=get_cuckoos(nest,best,Lb,Ub)
% Levy flights
n=size(nest,1);
% Levy exponent and coefficient
% For details, see equation (2.21), Page 16 (chapter 2) of the book
% X. S. Yang, Nature-Inspired Metaheuristic Algorithms, 2nd Edition, Luniver Press, (2010).
beta=3/2;
sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
for j=1:n,
    s=nest(j,:);
    % This is a simple way of implementing Levy flights
    % For standard random walks, use step=1;
    %% Levy flights by Mantegna's algorithm
    u=randn(size(s))*sigma;
    v=randn(size(s));
    step=u./abs(v).^(1/beta);
  
    % In the next equation, the difference factor (s-best) means that 
    % when the solution is the best solution, it remains unchanged.     
    stepsize=0.01*step.*(s-best);
    % Here the factor 0.01 comes from the fact that L/100 should the typical
    % step size of walks/flights where L is the typical lenghtscale; 
    % otherwise, Levy flights may become too aggresive/efficient, 
    % which makes new solutions (even) jump out side of the design domain 
    % (and thus wasting evaluations).
    % Now the actual random walks or flights
    s=s+stepsize.*randn(size(s));
   % Apply simple bounds/limits
   nest(j,:)=simplebounds(s,Lb,Ub);
end
%% Find the current best nest
function [fmin,best,nest,fitness]=get_best_nest(nest,newnest,fitness)
% Evaluating all new solutions
for j=1:size(nest,1),
    fnew=fobj(newnest(j,:));
    if fnew<=fitness(j),
       fitness(j)=fnew;%Si la nueva solucion tiene mejor fitness lo dejas
       %si no te quedas con la anterior
       nest(j,:)=newnest(j,:);
    end
end
% Find the current best
[fmin,K]=min(fitness) ;
best=nest(K,:);
%% Replace some nests by constructing new solutions/nests
function new_nest=empty_nests(nest,Lb,Ub,pa)
% A fraction of worse nests are discovered with a probability pa
n=size(nest,1);
% Discovered or not -- a status vector
K=rand(size(nest))>pa;
% In the real world, if a cuckoo's egg is very similar to a host's eggs, then 
% this cuckoo's egg is less likely to be discovered, thus the fitness should 
% be related to the difference in solutions.  Therefore, it is a good idea 
% to do a random walk in a biased way with some random step sizes.  
%% New solution by biased/selective random walks
stepsize=rand*(nest(randperm(n),:)-nest(randperm(n),:));
new_nest=nest+stepsize.*K;
for j=1:size(new_nest,1)
    s=new_nest(j,:);
  new_nest(j,:)=simplebounds(s,Lb,Ub);  
end
% Application of simple constraints
function s=simplebounds(s,Lb,Ub)
  % Apply the lower bound
  ns_tmp=s;
  I=ns_tmp<Lb;
  ns_tmp(I)=Lb(I);
  
  % Apply the upper bounds 
  J=ns_tmp>Ub;
  ns_tmp(J)=Ub(J);
  % Update this new move 
  s=ns_tmp;
%% You can replace the following by your own functions
% A d-dimensional objective function
function z=fobj(u)
%% d-dimensional sphere function sum_j=1^d (u_j-1)^2. 
%  with a minimum at (1,1, ...., 1); 
%z=sum((u-1).^2);
%z=abs(u.^2+1);
%z=(u(1)-sqrt(2)).^2+(u(2)-(pi)).^2;
% z=sin(u(1)+u(2))+(u(1)-u(2)).^2-1.5.*u(1)+2.5.*u(2)+1;%Mccornick%
%z=((sum(u.*u)-2).^2).^(1/8)+1/2.*(1/2.*sum(u.*u)+sum(u))+1/2;
%[-0.54719,-1.54719] fmin=-1.9133 intervalo maximo de -3 a 4 
%Nota ampliando el rango de busqueda no siempre encuentra el minimo global%
%z=sin(3*pi.*u(1)).^2+(u(1)-1)^2.*(1+sin(3.*pi.*u(2)).^2)+(u(2)-1).^2.*(1+sin(2*pi.*u(2)).^2);
%Levy function[1,1] fmin =0 rango de busqueda de -10 a 10%%%
%z=(u(1).^4-16.*u(1).^2+5.*u(1))./2+(u(2).^4-16.*u(2).^2+5.*u(2))./2+...
%(u(3).^4-16.*u(3).^2+5.*u(3))./2+(u(4).^4-16.*u(4).^2+5.*u(4))./2;
%Stybilinski-Tang function [-2.903534,-2.903534,-2.903534,-2.903534]
% -5<=xi<=5%
% z=0.5+(sin(u(1).^2+u(2).^2).^2-.5)./(1+0.001.*(u(1).^2+u(2).^2)).^2;
% z = .5 + (cos(sin(abs(u(1).^2-u(2).^2))).^2-.5)./(1+0.001.*(u(1).^2+u(2).^2)).^2;
%intervalo [-100,100] ---> [0,0]Schaffer N2 - N4
% z=-abs(sin(u(1)).*cos(u(2)).*exp(abs(1-sqrt(u(1).^2+u(2).^2)/pi)));
z=-.0001.*(abs(sin(u(1)).*sin(u(2)).*exp(abs(100-sqrt(u(1).^2+u(2).^2)/pi)))+1).^0.1;
%intervalo [-10,10] ---> [0,0]Holder table Y Cross In Tray
% z=((sum(u.^2,2) - size(u,2)).^2).^(1/8) + (sum(u.^2,2)/2 + sum(u,2))/size(u,2) + 0.5;
%intervalo [-2,2] ---> [0,0]Happy cat
%z=u(1).^2*u(1)-2*u(1)*u(2).^2+3*u(1)*u(2)+4;%
%z=rastrigin(u);
% z=sum(u.^2,2);%Nsphere u_i=0 domain all real numbers
%z=cuckoo_search_fourier(u);
%z=(u(1)+u(2)*i)^2+1;
%z=(2*u(1)+u(2)-5)^2+(u(2)^2-u(3)^3-u(1)^5)^2+(u(1)+2*u(2)-7)^2+(2*u(3)-u(1)-u(2))^2;

% clear
% fitaac=zeros(45,10);
% for iter1=1:10
%     [fita,~,~] = cuckoo_search(50);
%     fitaac(:,iter1) = fita;
% end
% fitaCS2 = mean(fitaac,2);