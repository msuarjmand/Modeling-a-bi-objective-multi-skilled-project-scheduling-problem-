function [y1, y2]=Crossover(x1,x2,model)



        RS1=x1.RS;
        L=x1.L;
        C=x1.C;
        activity=model.activity;
        mode=model.mode;
        worker=model.worker;
        N=model.N;
        
        RS2=x2.RS;


%%

      METHOD=randi([1 3]);

      switch METHOD
             case 1
            
                 %one point

                n=numel(RS1(1,:));
                i=randsample(n,2);

                RSnew1=[RS1(:,1:i) RS2(:,i+1:end)];
                RSnew2=[RS2(:,1:i) RS1(:,i+1:end)];

            
             case 2

                 %two point
            
                   n=numel(RS1(1,:));
                   I=randsample(n,2);
                   i1=min(I);
                   i2=max(I);
                   
                RSnew1=[RS1(:,1:i1) RS2(:,i1+1:i2) RS1(:,i2+1:end)];
                RSnew2=[RS2(:,1:i1) RS1(:,i1+1:i2) RS2(:,i2+1:end)];
                
             case 3
              
                  %uniform
            
                    n=numel(RS1(1,:));
                    i1=randi([0 1],1,n);
                    RSnew1=zeros(size(RS1));
                                       
                    for j=1:n
                       if i1==0
                           RSnew1(:,j)=RS1(:,j);
                       else
                           RSnew1(:,j)=RS2(:,j);
                       end
                        
                    end
                    
                    i2=randi([0 1],1,n);
                    RSnew2=zeros(size(RS2));
                                       
                    for k=1:n
                       if i2==0
                           RSnew2(:,k)=RS1(:,k);
                       else
                           RSnew2(:,k)=RS2(:,k);
                       end
                        
                    end
            
      end
    

%%

    p11=RSnew1(1,:); 
    p12=RSnew1(2,:); 
    br1=zeros(1,mode);    
    for ii1=2:mode       
       br1(ii1)=(ii1-1)*(1./mode);        
    end    
    SM1=zeros(1,N);     % Selected mode for activities    
%     for ii2=1:N
%       SM1(ii2)=find(p12(ii2)>=br1,1,'last');
%     end
%     
     A21=zeros(size(activity{1}(:,:)));
    
    for ii2=1:N
      SM1(ii2)=find(p12(ii2)>=br1,1,'last');
      A21(ii2,:)=activity{SM1(ii2)}(ii2,:);
    end
    
%     p12=SM1;
    p13=RSnew1(3:end,:);                     
    [~,q1]=sort(p11);                         
                    
    p21=RSnew2(1,:);  
    p22=RSnew2(2,:); 
    br2=zeros(1,mode);    
    for ii1=2:mode       
       br2(ii1)=(ii1-1)*(1./mode);        
    end    
    SM2=zeros(1,N);     % Selected mode for activities    
%     for ii2=1:N
%       SM2(ii2)=find(p22(ii2)>=br2,1,'last');
%     end
    
     A22=zeros(size(activity{1}(:,:)));
    
    for ii2=1:N
      SM2(ii2)=find(p22(ii2)>=br2,1,'last');
      A22(ii2,:)=activity{SM2(ii2)}(ii2,:);
    end
    
%     p22=SM2;
    p23=RSnew2(3:end,:);                     
    [~,q2]=sort(p21);                         


    D1=cell(1,n);                      
    D2=cell(1,n);                      

  
     A31=cell(1,N);
     
     for jj=1:N
         
        A31{jj}=zeros(size(worker)); 
     end
    
    
    
     for i=q1

         w=[];              
         a=1;          
         for j=L{i}
             aw=C{j};    
                         
            for k=1:activity{SM1(i)}(i,j)                
                aw=aw(~ismember(aw,w));
                x=cumsum((1/(numel(aw)-(k-1))).*ones(1,(numel(aw)-(k-1))));  
                f=find(p13(a,i)<=x,1,'first');
                w=[w aw(f)];    %#ok
                
                A31{i}(aw(f),j)=1;
                
                aw(f)=[]; 
                a=a+1;                
            end           
         end
         
         D1{i}=w;
        
     end
     
     A32=cell(1,N);
     
     for jj=1:N
         
        A32{jj}=zeros(size(worker)); 
     end
     
     
     for i=q2

         w=[];              
         a=1;          
         for j=L{i}
             aw=C{j};     
                         
            for k=1:activity{SM2(i)}(i,j)                
                aw=aw(~ismember(aw,w));
                x=cumsum((1/(numel(aw)-(k-1))).*ones(1,(numel(aw)-(k-1))));  
                f=find(p23(a,i)<=x,1,'first');
                w=[w aw(f)];    %#ok
                
                 A32{i}(aw(f),j)=1;
                
                aw(f)=[]; 
                a=a+1;                
            end           
         end
         
         D2{i}=w;
        
     end
    



%%
                
    y1.q=q1;
    y1.D=D1;
    y1.C=C;
    y1.L=L;
    y1.SM=SM1;
    y1.RS=RSnew1;
    y1.A2=A21;
    y1.A3=A31;
%     y1.activity=activity;  
    
    y2.q=q2;
    y2.D=D2;
    y2.C=C;
    y2.L=L;
    y2.SM=SM2;
    y2.RS=RSnew2;
    y2.A2=A22;
    y2.A3=A32;
%     y2.activity=activity;


end





