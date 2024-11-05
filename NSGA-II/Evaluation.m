function PM=Evaluation(C)



NPS=numel(C(:,1));
MI=zeros(size(C(:,1)));

    for i=1:NPS
        MI(i)=sqrt(sum(C(i,:).^2)); 
    end
    
MID=(sum(MI))/NPS;

a=max(C,[],1);
b=min(C,[],1);
D=zeros(size(C(1,:)));
    for k=1:numel(C(1,:))
        D(k)=(a(k)-b(k))^2;        
    end
    MS=sqrt(sum(D(:)));

   


PM.NPS=NPS;
PM.MID=MID;
PM.D=MS;




end