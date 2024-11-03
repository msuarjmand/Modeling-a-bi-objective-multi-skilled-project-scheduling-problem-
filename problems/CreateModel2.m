function model=CreateModel2()
%% first sample

     PredList={[],1,1,1,3,2,4,[3,4],[5,6,7],[2,8]};
     
     
      tmax=[15, 12, 20, 14, 9, 25, 7, 11, 16, 23
            11,  9, 14, 12, 7, 20, 5,  7, 13, 20];
     
     
     
      tmin=[10,  8, 13, 9, 6, 21, 3,  8, 12, 17
             7,  5, 10, 6, 5, 11, 2,  4, 10, 12];
     
     

    N=numel(tmax(1,:));

    
  activity{1}=[0 1 1
               1 0 1
               2 1 0
               0 1 0
               0 0 1
               1 1 0
               0 0 1
               2 0 0
               1 2 0
               0 0 2];
           
  activity{2}=[0 2 2
               2 0 2
               2 1 0
               0 2 0
               0 0 2
               1 2 0
               0 0 2
               2 1 0
               1 2 0
               1 1 1];

          
    worker=[ 1     1     1
             1     1     0
             1     1     1
             0     1     0
             1     1     0
             0     1     1
             1     0     1
             0     1     1]; 
        

   
    es=[0 0 0 1 2 3 3 4 6 9];
    
    skill=numel(worker(1,:));
    mode=numel(tmax(:,1));
    

    
    
    CW=[480   436   439
        325   269     0
        460   300   459
          0   345     0
        362   369     0
          0   364   261
        240     0   300
          0   382   406];
      
      
    QW=[ 0.5200    0.8800    0.7600
         0.8500    0.7900         0
         0.7200    0.8500    0.7400
              0    0.8700         0
         0.5000    0.8100         0
              0    0.8100    0.9000
         0.5200         0    0.6200
              0    0.9100    0.9000];
          
          
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
    

end