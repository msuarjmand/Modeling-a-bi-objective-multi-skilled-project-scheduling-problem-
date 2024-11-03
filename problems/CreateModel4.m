function model=CreateModel4()
%% first sample


  PredList={[],1,1,1,3,[4,5],3,[5,7]};
  
      tmax=[20, 18, 17, 24, 30, 15, 33, 24
            17, 14, 14, 20, 27, 12, 30, 19];
  
      tmin=[14, 11, 13, 12, 21, 10, 27, 17
            12, 10, 10,  9, 20,  7, 20, 11];

    N=numel(tmax(1,:));

    
  activity{1}=[ 0     1     1
                0     2     1
                0     1     0
                0     1     0
                1     0     2
                2     0     0
                0     0     1
                0     0     1];
           
  activity{2}=[ 0     1     2
                0     2     1
                1     2     0
                0     1     0
                1     1     2
                2     1     0
                0     0     2
                1     0     1];

          
    worker=[   1     0     1
               0     1     1
               1     1     1
               1     0     1
               1     1     1
               0     1     0]; 
        

   
    es=[0 0 0 1 2 2 4 4];
    
    skill=numel(worker(1,:));
    mode=numel(tmax(:,1));
    

    
    
    CW=[     410     0   337
               0   499   305
             215   478   268
             356     0   340
             393   476   275
               0   433     0];
      
      
    QW=[   0.9200         0    0.7600
                0    0.8100    0.7000
           0.7400    0.5800    0.6500
           0.7100         0    0.9400
           0.8500    0.9000    0.7700
                0    0.7300         0];
            
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