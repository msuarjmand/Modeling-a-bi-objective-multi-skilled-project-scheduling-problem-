function model=CreateModel10()
%% first sample

      PredList={[],1,1,1,2,[3,4],[2,3],[4,5],[6,7,8],4,2,[9,10,11]};
      tmax=[40    31    27    34    36    30    28    30    32    37    32    40
            27    20    20    20    29    28    20    25    23    24    24    27
            18    19    16    15    15    15    16    20    17    11    20    17];
      
      tmin=[30    21    17    24    26    20    18    16    22    30    22    24
            17    10    10    10    19    18    16    12    19    14    18    17
             8     7    12     9     5     8    11    11    12     5    11     8];

    N=numel(tmax(1,:));

    
  activity{1}=[  0     1     1     1     0
                 1     0     1     0     0
                 1     0     0     1     1
                 1     0     0     1     0
                 1     0     0     0     1
                 1     0     1     0     0
                 0     0     1     1     1
                 1     0     1     1     1
                 0     0     0     1     0
                 0     1     1     0     1
                 0     1     0     1     1
                 0     1     0     1     1];
           
  activity{2}=[  0     1     2     1     0
                 1     1     1     0     0
                 1     0     1     1     1
                 1     0     0     1     1
                 1     0     0     0     2
                 1     0     2     0     0
                 0     0     1     2     1
                 2     0     1     1     1
                 0     1     0     1     0
                 0     2     1     0     1
                 0     1     0     2     1
                 0     2     0     1     1];
            
  activity{3}=[  1     1     2     1     0
                 1     2     1     0     0
                 2     0     1     1     1
                 2     0     0     1     1
                 1     0     1     0     2
                 1     0     2     1     0
                 1     0     1     2     1
                 2     0     2     1     1
                 0     1     0     2     0
                 1     2     1     0     1
                 0     2     0     2     1
                 1     2     0     1     1];

          
    worker=[ 1     1     0     1     1
             1     1     0     1     1
             0     1     1     0     1
             0     1     0     1     0
             1     0     1     1     1
             1     0     1     1     0
             0     1     0     1     1
             1     1     1     0     0
             1     1     0     1     1
             0     0     0     1     0
             0     1     0     0     1
             1     1     1     1     0 ]; 
        

   
    es=zeros(1,12);
    
    skill=numel(worker(1,:));
    mode=numel(tmax(:,1));
    

    
    
    CW=[   266   394     0   321   484
           382   221     0   281   469
             0   478   449     0   266
             0   290     0   470     0
           388     0   481   241   456
           249     0   417   430     0
             0   392     0   498   379
           204   467   468     0     0
           453   211     0   267   419
             0     0     0   280     0
             0   315     0     0   427
           286   288   219   350     0];
      
      
    QW=[0.7000    0.5200         0    0.9200    0.9000
        0.8200    0.5700         0    0.5000    0.9300
             0    0.9400    0.7300         0    0.5500
             0    0.7000         0    0.5800         0
        0.9400         0    0.7800    0.5800    0.6900
        0.7500         0    0.7500    0.5100         0
             0    0.7200         0    0.7800    0.6800
        0.8300    0.7300    0.9300         0         0
        0.7900    0.8900         0    0.8500    0.7900
             0         0         0    0.5200         0
             0    0.8400         0         0    0.5700
        0.7000    0.9300    0.5400    0.5000         0
];
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