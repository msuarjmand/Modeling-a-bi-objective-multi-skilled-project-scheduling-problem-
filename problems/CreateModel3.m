function model=CreateModel3()
%% first sample

     PredList={[],1,1,2,[3,6],[2,4],[5,6],[3,6],[7,8]};
     
     
      tmax=[15,20, 19, 18, 28, 21, 19, 25, 23
            13,11, 16, 12, 25, 17, 15, 19, 17];
     
      tmin=[11,16, 13, 10, 17, 13, 14, 15, 10
             9, 7, 10,  8, 15, 12,  9, 10,  7];

    N=numel(tmax(1,:));

    
  activity{1}=[1 0 0
               1 0 1
               2 1 0
               1 1 0
               0 0 1
               0 1 0             
               2 0 0
               1 0 0
               1 0 1];
           
  activity{2}=[2 0 0
               2 0 1
               2 1 0
               1 2 0
               0 0 2
               0 2 0
               2 1 0
               1 1 0
               1 0 2];

          
    worker=[  1     0     0
              1     0     1
              0     1     1
              1     0     1
              1     0     0
              1     1     0
              0     1     0]; 
        

   
    es=[0 0 0 1 2 3 4 6 6];
    
    skill=numel(worker(1,:));
    mode=numel(tmax(:,1));
    

    
    CW=[   218     0     0
           357     0   152
             0   237   145
           247     0   324
           313     0     0
           125   346     0
             0   296     0];
      
      
    QW=[  0.6000         0         0
          0.7500         0    0.6900
               0    0.8100    0.5600
          0.5300         0    0.7100
          0.9100         0         0
          0.7100    0.8300         0
               0    0.5700         0];
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