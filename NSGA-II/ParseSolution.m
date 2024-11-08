function [sol]=ParseSolution(q,model)
  

    N=model.N;
    t=model.t;
    PredList=model.PredList;
    es=model.es;
    activity=model.activity;
    worker=model.worker;
    complete=zeros(1,size(activity,1));
    
    
    p=RepairSchedule(q,model);
%     p=[1 2 5 9 10 4 8 12 3 7 6 11 14 13];
%     p=[4 3 7 2 6 11 8 1 5 9 10 12 14 13];
    T=zeros(size(worker,1),sum(t));
    x=zeros(size(activity,1),size(worker,1),sum(t));
    y=zeros(size(activity,1),size(worker,1),size(worker,2));
   
    %%
    es=es+1;
    es_p=es(p);  %es_p, moratab shodeye es bar asaas p
    ww=worker;
    
    %% Repair
    for h3=2:N
        if es_p(h3)<max(es_p(1:h3-1))
           es_p(h3)=max(es_p(1:h3-1));
           es(p(h3))=max(es_p(1:h3-1));
           aa=[];
           for i=1:N
               if any(PredList{i}==p(h3))
                  aa=[aa i]; 
               end
           end
           
           for s3=aa
               pn2=[];
               pn=PredList{s3};
               pn1=[];
               for ll1=pn
                   pn11=find(p==ll1);
                   pn1=[pn1 pn11];
               end
               
               pn2=find(p==s3);
               es_p(pn2)=max(es_p(pn1)+t(pn));
               es(s3)=max(es_p(pn1)+t(pn));
           end
           
           
        end
    
    end
    
    %%

    
    for TT=1:sum(t)
        activity_list=[];
        
        Pos1=find(es_p==TT);
        
        SizePos1=size(Pos1,2);
        if SizePos1==1
            b2=es_p(Pos1);
            es_p(Pos1)=max(es_p(1:Pos1));
            
            
                   aa=[];
                   for i=1:N
                           if any(PredList{i}==p(Pos1))
                              aa=[aa i]; 
                           end
                   end
                     dif1=max(es_p(1:Pos1))-b2(1);
               
                     
                     if size(aa,2)>0
                         for vv=aa
                      es_p(find(p==vv))=es_p(find(p==vv))+dif1;
                         end
                     end
                     [~,qq]=sort(p);
                     es=es_p(qq);
                     
            
            activity_list=p(Pos1);   %listi az faaliat hast ke bayad dar in zaman taeen taklif shavand
            
        
        elseif SizePos1>1
            activity_list=p(Pos1(1));
           
            for l=1:SizePos1-1
                
                if Pos1(l+1)-Pos1(l)==1 
                   activity_list=[activity_list p(Pos1(l+1))];
                else
                    

                   f=[];
                   Pos2=Pos1;
                   activity_similar_es=p(Pos2);
                   for kk=activity_list
                       ff=find(activity_similar_es==kk);
                       f=[f ff];
                       
                   end
                   Pos2(f)=[];
                      
                   b2=es_p(Pos2);
                   
                     for k=Pos2(1)
                         if es_p(k)==max(es_p(1:k))
                          es_p(k)=es_p(k)+1;
                         else
                             
                         es_p(k)=max(es_p(1:k));
                         end
                     end

                   
                    [~,qq]=sort(p);
                    es=es_p(qq);
                   es_p11=es_p;
                   
               for k=Pos2
                   aa=[];
                   for i=1:N
                           if any(PredList{i}==p(k))
                              aa=[aa i]; 
                           end
                   end
                     dif1=max(es_p(1:k))-b2(1);
                     for ew=aa
                        delta=es_p(find(p==ew))-es_p11(find(p==ew));
                        if delta==0
                        es_p(find(p==ew))=es_p(find(p==ew))+dif1;
                        else
                            bb11=max(delta,dif1);
                            es_p(find(p==ew))=es_p11(find(p==ew))+bb11;
                        end
                     end
               end
                
               Pos3=Pos2;
               Pos3(1)=[];
                     for kk=Pos3
                         if es_p(kk)==max(es_p(1:kk))
                            es_p(kk)=es_p(kk)+1;
                         else
                             
                         es_p(kk)=max(es_p(1:kk));
                         end
                     end
                   
                   
                    [~,qq]=sort(p);
                    es=es_p(qq);
                    break  %%%%%
                  
                end  
                 
            end 
       
            
        end
        
        
        wSelected=[];  %add
        ok=zeros(size(activity));
     if size(activity_list,2)>=1
        for ll=activity_list %select activity 2 3
            RequireSkill=activity(ll,:); %skill
            skills=find(RequireSkill>0);
            wSelected=[];
            
            for lll=skills

                WorkerSkill=find(worker(:,lll)>0); %possible worker
                if size(WorkerSkill,1)>=activity(ll,lll)
                wSelected{lll}=WorkerSkill(randsample(size(WorkerSkill,1),activity(ll,lll)))';
                worker([wSelected{lll}],:)=0;
                T([wSelected{lll}],TT)=t(ll);
                b=wSelected{lll};

                x(ll,b,TT:TT+t(ll)-1)=1; 
                y(ll,b,lll)=1;
                b=[];
              
                ok(ll,lll)=activity(ll,lll);
                
                else
                    if lll==skills(1)
                        
                break    
                        
                        
                    else
                worker([wSelected{:}],:)=ww([wSelected{:}],:);   %agar worker be andazeye kafi mojood nabud va faghad tavaanest masalan baraye faaliate 6 , yek skill ra anjam dahad va baraye skill baadi karegari mojood nabud bia karegare takhsis dade be skill e aval ra pas begir
                T([wSelected{:}],TT)=0;
                x(ll,:,TT:TT+t(ll)-1)=0;
                y(ll,:,lll)=0;
                        
                    end           
                    
                break

                end
                
            end
            
         
            
           
            

                [~,qq]=sort(p);
                es=es_p(qq);
            if ok(ll,:)==activity(ll,:)
                
                complete(ll)=1;
                

%                 if TT-es(ll)>0
%                     dif=TT-es_p(ll);
%                     a=[];
%                     for i=1:N
%                            if any(PredList{i}==ll)
%                               a=[a i]; 
%                            end
%                     end
% 
%                     for ee=a
%                       es_p(find(p==ee))=es_p(find(p==ee))+dif;
%                     end
%                      [~,qq]=sort(p);
%                      es=es_p(qq);
%                     
%                 else
%                     
%                     
%                 end
%            aa=[];
%            for i=1:N
%                if any(PredList{i}==ll)
%                   aa=[aa i]; 
%                end
%            end
%            
%            for s3=aa
%                pn2=[];
%                pn=PredList{s3};
%                pn1=[];
%                for ll1=pn
%                    pn11=find(p==ll1);
%                    pn1=[pn1 pn11];
%                end
%                
%                pn2=find(p==s3);
%                es_p(pn2)=max(es_p(pn1)+t(pn));
%                es(s3)=max(es_p(pn1)+t(pn));
%            end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            else
                complete(ll)=0;
                zzz=find(activity_list==ll);
                es(activity_list(:,zzz:end))=es(activity_list(:,zzz:end))+1;
                es_p=es(p);
                
                
                aa=[];  
                for i=1:N
                    if any(PredList{i}==ll)
                       aa=[aa i]; 
                    end
                end
                
%                 if size(a,2)>0
%                     for we=a
%                       es_p(find(p==we))=es_p(find(p==we))+1;
%                     end
%                 end
%                [~,qq]=sort(p);
%                es=es_p(qq);
               for s3=aa
                   pn2=[];
                   pn=PredList{s3};
                   pn1=[];
                   for ll1=pn
                       pn11=find(p==ll1);
                       pn1=[pn1 pn11];
                   end

                   pn2=find(p==s3);
                   es_p(pn2)=max(es_p(pn1)+t(pn));
                   es(s3)=max(es_p(pn1)+t(pn));
               end                

            end
            
            if complete(ll)==0
                break
            end
  
            
                  
            
            
        end
        
        
        
        
        T(:,TT+1)=max(T(:,TT)-1,0);
        Pos22=find(T(:,TT+1)==0);
        worker([Pos22],:)=ww([Pos22],:);
        
     else
         
        T(:,TT+1)=max(T(:,TT)-1,0);
        Pos222=find(T(:,TT+1)==0);
        worker([Pos222],:)=ww([Pos222],:);
        
         
     end
    
        
        
    end
    
    sol.T=T;
    sol.x=x;
    sol.y=y;
    sol.p=p;
    sol.es_p=es_p;
            
  
  
    
    
    
   
    
end
