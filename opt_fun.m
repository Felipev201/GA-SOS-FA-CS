function [ y1 ] = opt_fun(a1 )
%     if fun==1
        % Schaffer N. 1 Function
%         y1=.5 + (sin(a1(:,1).^2+a1(:,2).^2).^2-.5)./(1+0.001.*(a1(:,1).^2+a1(:,2).^2)).^2;
%     elseif fun==2
        % Holder-Table Function
%         y1=-abs(sin(a1(:,1)).*cos(a1(:,2)).*exp(abs(1-sqrt(a1(:,1).^2+a1(:,2).^2)/pi)));
%     elseif fun==3
        % Cross-in-Tray Function
        y1=-.0001.*(abs(sin(a1(:,1)).*sin(a1(:,2)).*exp(abs(100-sqrt(a1(:,1).^2+a1(:,2).^2)/pi)))+1).^0.1;  
%     elseif fun==4    
        % Happy cat
%         y1=((sum(a1.^2,2) - size(a1,2)).^2).^(1/8) + (sum(a1.^2,2)/2 + sum(a1,2))/size(a1,2) + 0.5;
%     elseif fun==5
        % Schaffer N. 4 Function
%          y1=.5 + (cos(sin(abs(a1(:,1).^2-a1(:,2).^2))).^2-.5)./(1+0.001.*(a1(:,1).^2+a1(:,2).^2)).^2;
%     elseif fun==6    
        % sphere
%         y1=sum(a1.^2,2);
end

