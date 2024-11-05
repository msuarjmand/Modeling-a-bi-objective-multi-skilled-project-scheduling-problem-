function sol1=ParseSolution(sol,model)

    %% 
    q=sol.q;
    D=sol.D;
    C=sol.C;
    L=sol.L;
    SM=sol.SM;
    A2=sol.A2;
    A3=sol.A3;
    
    N=model.N;
%     t=model.t;
    mode=model.mode;
    PredList=model.PredList;
    es=model.es;
    worker=model.worker;

    M=model.M;
    tmax=model.tmax;
    tmin=model.tmin;
    
    %% 
    
    q=RepairSchedule(q,model);
   
    ST=zeros(M,N);
    FT=zeros(M,N);
    NW=numel(worker(:,1));
    t=cell(1,M);
    T=zeros(1,M);
    W=cell(1,M);
    UW=cell(1,M);
    Cmax=zeros(1,M);
    
    for m1=1:M
        for m2=1:mode
            for m3=1:N
                 t{m1}(m2,m3)=randi([tmin(m2,m3),tmax(m2,m3)]);               
            end
        end
        T(m1)=max(sum(t{m1},2));
%         W{m1}=zeros(NW,T(m1));
    end    
    
%    W1=zeros(NW,max(T));
    
 for m=1:M  
       W{m}=zeros(NW,T(m)+15);
    for i=q
        if ~isempty(PredList{i})
            t1=max(FT(m,PredList{i}),es(i));
        else
            t1=es(i);
        end
        for tt=t1:T(m)
            workers_are_ready=true;
            
            for d=1:t{m}(SM(i),i)
                for k=D{i}
                    if W{m}(k,tt+d)==1
                        workers_are_ready=false;
                        break;
                    end
                end
            end
            
            if workers_are_ready
                t2=tt;
                break;
            end
        end
        
        ST(m,i)=t2;
        
        for d=1:t{m}(SM(i),i)
            for l=D{i}
               W{m}(l,ST(m,i)+d)=1;
                
            end
        end
        
        FT(m,i)=ST(m,i)+t{m}(SM(i),i);
        
    end
    
    Cmax(m)=max(FT(m,:));
    
%     W{m}=W1;
    UW{m}=zeros(1,numel(worker(:,1)));
    
    for o=1:numel(worker(:,1))
       
        if any(W{m}(o,:)==1)
            UW{m}(o)=1;
        end
    end
    
    W{m}=W{m}(:,1:Cmax(m));
    
 end
    
    
    
    MCmax=mean(Cmax(:));
    %% 
    
    CW=model.CW;
    QW=model.QW;
    A4=zeros(1,N);
    A5=zeros(1,N);
    
    for ii=1:N
        
       A4(ii)=sum(sum(CW.*A3{ii})); 
       A5(ii)=sum(sum(QW.*A3{ii}))/sum(A2(ii,:)); 
        
    end
    
    TCW=sum(A4(:));
    TQW=sum(A5(:))/N;
    
    %% 
    sol1.D=D;
    sol1.C=C;
    sol1.L=L;
    sol1.A2=A2;
    sol1.q=q;
    sol1.SM=SM;
    sol1.mode=mode;
    sol1.ST=ST;
    sol1.FT=FT;
    sol1.Cmax=Cmax;
    sol1.W=W;
    sol1.UW=UW;
    sol1.worker=worker;
    sol1.TCW=TCW;
    sol1.TQW=TQW;
    sol1.MCmax=MCmax;
    sol1.t=t;
    sol1.T=T;

end