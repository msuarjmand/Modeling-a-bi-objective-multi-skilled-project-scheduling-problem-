function model=CreateModel1()
%% first sample

    PredList={[],[],1,2};
    
    tmax=[20 17 14 16
          14 15 10  9];
    tmin=[12 10 10 8
           9  7  6 4];

    N=numel(tmax(1,:));

    
  activity{1}=[0 1 1
               1 0 1
               2 1 0
               0 1 0];
  activity{2}=[0 2 2
               2 0 2
               2 1 0
               0 2 0];

          
    worker=[0 1 1 
            1 0 1 
            1 0 0 
            1 0 1
            1 1 1
            0 0 1
            1 0 1
            0 1 1]; 
        
   
    es=[0 0 0 0];
    
    skill=numel(worker(1,:));
    mode=numel(tmax(:,1));
    
    CW=randi([200 500],size(worker)).*worker;               
    
    QW=(randi([50 95],size(worker))./100).*worker;  
    
    
    M=5;     % number of simulation
   

  
    
   %%
 
    model.PredList=PredList;
    model.N=N;
    model.activity=activity;
    model.worker=worker;
    model.es=es;
%     model.t=t;
    model.tmax=tmax;
    model.tmin=tmin;
    model.skill=skill;
    model.CW=CW;
    model.QW=QW;
    model.mode=mode;
    model.M=M;
%     model.T=T;

end