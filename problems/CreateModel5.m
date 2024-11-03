function model=CreateModel5()
%% first sample

      PredList={[],1,2,3,[2,3],3,[4,5,6]};
      
      
      tmax=[18, 28, 27, 21, 20, 23, 23
            13, 19, 24, 14, 16, 25, 14];
     
     tmin=[14, 20, 17, 11, 12, 15, 13
           10, 16, 14,  8,  9, 11,  9];
 

    N=numel(tmax(1,:));

    
  activity{1}=[  0     1     0
                 1     0     0
                 0     0     1
                 0     1     1
                 0     1     0
                 0     1     1
                 1     0     0];
           
  activity{2}=[  0     2     0
                 1     1     0
                 1     0     1
                 0     2     1
                 2     1     0
                 0     2     1
                 1     1     1];

          
    worker=[   1     0     1
               0     1     1
               1     1     1
               1     0     1
               1     1     1
               0     1     0
               1     1     1]; 
        

   
    es=[0 0 0 1 2 2 4];
    
    skill=numel(worker(1,:));
    mode=numel(tmax(:,1));
    

    
    
    CW=[   360     0   235
             0   367   277
           264   411   476
           485     0   388
           485   321   356
             0   250     0
           319   265   206];
      
      
    QW=[      0.6100         0    0.6800
                   0    0.6900    0.6800
              0.5200    0.6000    0.7300
              0.7800         0    0.9400
              0.7800    0.6300    0.9100
                   0    0.8800         0
              0.8400    0.8500    0.6400];
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