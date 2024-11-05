function sol=CreateRandomSolution(model)


    N=model.N;
    activity=model.activity;
    worker=model.worker;
    skill=model.skill;
    mode=model.mode;
    
    %% 
    
    A=zeros(1,mode); 
    for ii=1:mode
        
       A(ii)=max(sum(activity{ii}(:,:),2));
        
    end
        
    RS=rand(max(A)+2,N);               
     
    p1=RS(1,:);                 % the sequence of the activities
    p2=RS(2,:);                 % the mode
    p3=RS(3:end,:);             % skills        
     
    [~,q]=sort(p1);                     

    br=zeros(1,mode);
    
    for ii1=2:mode
        
       br(ii1)=(ii1-1)*(1./mode); 
        
    end
    
    SM=zeros(1,N);     % Selected mode for activities
    A2=zeros(size(activity{1}(:,:)));
    
    for ii2=1:N
      SM(ii2)=find(p2(ii2)>=br,1,'last');
      A2(ii2,:)=activity{SM(ii2)}(ii2,:);
    end
    
    
    %%
   
    C=cell(1,skill);                  
    D=cell(1,N);                      
    L=cell(1,N);                      
    
    
    
     for o=1:skill
         
         C{o}=find(worker(:,o)==1);
         
     end
     
     A3=cell(1,N);
     
     for jj=1:N
         
        A3{jj}=zeros(size(worker)); 
     end
    
     for i=q
         
         L{i}=find(activity{SM(i)}(i,:)~=0);             

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
    
sol.q=q;
sol.SM=SM;
sol.D=D;
sol.C=C;
sol.L=L;
sol.RS=RS;
sol.A2=A2;
sol.A3=A3;
% sol.worker=worker;
% sol.mode=mode;
% sol.activity=activity;
% 



end

