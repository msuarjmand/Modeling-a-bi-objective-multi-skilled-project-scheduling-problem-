function sol2=Mutate(sol1,model)


    C=sol1.C;
    L=sol1.L;
    RS=sol1.RS;
    
    activity=model.activity;
    worker=model.worker;
    mode=model.mode;
    N=model.N;
    

    m=randi([1 3]);
    
    switch m
        case 1
            % Do Swap
            RSnew=Swap(RS);
            
        case 2
            % Do Reversion
            RSnew=Reversion(RS);
            
        case 3
            % Do Insertion
            RSnew=Insertion(RS);
    end

    
    p1=RS(1,:);  
    p2=RS(2,:);
    br=zeros(1,mode);    
    for ii1=2:mode       
       br(ii1)=(ii1-1)*(1./mode);        
    end    
    SM=zeros(1,N);     % Selected mode for activities    
    for ii2=1:N
      SM(ii2)=find(p2(ii2)>=br,1,'last');
    end
    
    A2=zeros(size(activity{1}(:,:)));
    
    for ii2=1:N
      SM(ii2)=find(p2(ii2)>=br,1,'last');
      A2(ii2,:)=activity{SM(ii2)}(ii2,:);
    end
    
    p3=RS(3:end,:);                     
     
    [~,q]=sort(p1);                     
    
    n=numel(RS(1,:));
    D=cell(1,n);                      
    
     A3=cell(1,N);
     
     for jj=1:N
         
        A3{jj}=zeros(size(worker)); 
     end
    
    
    for i=q

         w=[];              
         a=1;          
         for j=L{i}
             aw=C{j};    
                         
            for k=1:activity{SM(i)}(i,j)                
                aw=aw(~ismember(aw,w));
                x=cumsum((1/(numel(aw)-(k-1))).*ones(1,(numel(aw)-(k-1))));  
                f=find(p3(a,i)<=x,1,'first');
                w=[w aw(f)];    %#ok
                
                 A3{i}(aw(f),j)=1;
                
                aw(f)=[]; 
                a=a+1;                
            end           
         end
         
         D{i}=w;
        
     end 
    
    
    
    
    
    sol2.q=q;
    sol2.SM=SM;
    sol2.D=D;
    sol2.C=C;
    sol2.L=L;
    sol2.RS=RSnew;
    sol2.A2=A2;
    sol2.A3=A3;
%     sol2.activity=activity;
%     sol2.mode=mode;
    
end

function RSnew=Swap(RS)

    n=numel(RS(1,:));
    
    i=randsample(n,2);


    i1=min(i(1),i(2));
    i2=max(i(1),i(2));
    
    RSnew=[RS(:,1:i1-1) RS(:,i2) RS(:,i1+1:i2-1) RS(:,i1) RS(:,i2+1:end)];

end

function RSnew=Reversion(RS)

    n=numel(RS(1,:));
    
    i=randsample(n,2);
    i1=min(i(1),i(2));
    i2=max(i(1),i(2));
    x=RS(:,i1:i2);
    y=fliplr(x);
    
    
    RSnew=[RS(:,1:i1-1) y RS(:,i2+1:end)]; 
    

end

function RSnew=Insertion(RS)

    n=numel(RS(1,:));
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    if i1<i2
        RSnew=[RS(:,1:i1-1) RS(:,i1+1:i2) RS(:,i1) RS(:,i2+1:end)];
    else
        RSnew=[RS(:,1:i2) RS(:,i1) RS(:,i2+1:i1-1) RS(:,i1+1:end)];
    end

end

