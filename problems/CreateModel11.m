function model=CreateModel11()
%% first sample

      PredList={[],1,1,1,2,[3,4],[2,3],[4,5],[6,7,8],4,2,[9,10,11],[10,12],[7,9,11],[13 14],[10,12],[15,16],[16,17]};
      tmax=[  43    45    45    43    39    42    45    45    42    42    39    38    45    38    45    41    41    40
              34    35    35    35    32    35    35    32    35    31    34    34    30    34    31    31    31    30
              29    27    28    28    25    25    28    24    25    28    29    26    27    27    29    28    25    25
              16    15    22    20    19    15    16    18    22    16    18    20    22    15    17    21    18    18];
       
      tmin=[ 33    35    35    33    29    32    35    35    32    32    29    28    35    28    35    31    31    30
             24    25    25    25    22    25    25    22    25    21    24    24    20    24    21    21    21    20
             19    17    18    18    15    15    18    14    15    18    19    16    17    17    19    18    15    15
              6     5    12    10     9     5     6     8    12     6     8    10    12     5     7    11     8     8];


    N=numel(tmax(1,:));

    
  activity{1}=[  0     1     1     1     1     0     1
                 1     0     0     0     0     1     1
                 0     1     1     1     0     0     0
                 1     1     1     0     0     0     0
                 1     0     1     0     0     0     1
                 1     1     0     1     1     0     1
                 1     0     0     1     0     1     0
                 0     1     1     1     1     0     1
                 0     0     1     0     1     1     0
                 0     1     0     0     1     0     0
                 1     1     1     1     0     1     0
                 0     0     1     1     0     1     0
                 0     0     0     1     0     0     1
                 0     1     1     1     1     0     1
                 0     0     1     0     1     1     0
                 1     0     1     0     1     1     0
                 1     1     1     1     0     1     1
                 0     0     1     1     0     0     0];
           
  activity{2}=[  0     1     1     1     2     0     1
                 1     0     0     1     0     1     1
                 0     1     1     2     0     0     0
                 1     1     1     0     1     0     0
                 1     0     1     0     1     0     1
                 1     1     0     1     2     0     1
                 2     0     0     1     0     1     0
                 0     1     1     1     1     0     2
                 0     0     1     0     1     1     0
                 0     1     0     1     1     0     0
                 1     1     2     1     0     1     0
                 0     0     1     1     1     1     0
                 0     0     0     2     0     0     1
                 0     1     2     1     1     0     1
                 1     0     1     0     1     1     0
                 1     0     2     0     1     1     0
                 1     1     1     2     0     1     1
                 0     0     1     1     0     0     1];
            
  activity{3}=[  0     2     1     1     2     0     1
                 1     0     1     1     0     1     1
                 1     1     1     2     0     0     0
                 1     1     1     0     1     1     0
                 1     0     1     1     1     0     1
                 1     2     0     1     2     0     1
                 2     0     0     1     1     1     0
                 0     1     1     2     1     0     2
                 1     0     1     0     1     1     0
                 0     1     0     2     1     0     0
                 1     1     2     1     0     1     1
                 0     0     1     1     1     1     1
                 0     0     0     2     1     0     1
                 0     1     2     2     1     0     1
                 1     0     2     0     1     1     0
                 2     0     2     0     1     1     0
                 1     1     1     2     0     1     2
                 0     0     1     1     1     0     1];
             
  activity{4}=[  1     2     1     1     2     0     1
                 2     0     1     1     0     1     1
                 1     1     1     2     1     0     0
                 1     1     1     0     1     1     0
                 1     0     1     1     1     1     1
                 1     2     1     1     2     0     1
                 2     0     0     2     1     1     0
                 1     1     1     2     1     0     2
                 1     0     2     0     1     1     0
                 0     1     0     2     1     1     0
                 1     1     2     1     0     2     1
                 0     0     2     1     1     1     1
                 0     1     0     2     1     0     1
                 0     2     2     2     1     0     1
                 1     0     2     0     2     1     0
                 2     0     2     0     1     2     0
                 1     2     1     2     0     1     2
                 1     0     1     1     1     0     1];


          
    worker=[ 1     0     1     0     0     0     1
             1     0     1     1     1     0     0
             0     0     0     0     1     1     0
             1     1     1     0     1     1     1
             1     1     0     1     0     1     0
             1     1     1     0     0     0     1
             1     1     1     0     1     1     0
             1     1     0     1     1     0     1
             0     1     1     1     0     1     0
             0     1     1     1     0     1     1
             0     1     1     0     0     1     0
             1     1     0     1     1     1     1
             0     0     1     1     1     1     1
             1     1     0     0     1     1     0
             0     0     1     0     1     0     1 ]; 
        

   
    es=zeros(1,18);
    
    skill=numel(worker(1,:));
    mode=numel(tmax(:,1));
    

    
    
    CW=[     948           0         808           0           0           0         889
             977           0        1064         942         882           0           0
               0           0           0           0        1125         900           0
            1170         972         875           0        1023         812         853
             932        1091           0        1023           0         814           0
             873         997         838           0           0           0        1111
             815        1127         954           0         973         932           0
             953         841           0         976         995           0         823
               0         878        1069         974           0         980           0
               0         952         874        1004           0        1141         842
               0         931        1159           0           0         867           0
             821         836           0        1088        1117        1182         971
               0           0        1039         958         838         918        1156
            1018        1172           0           0         900         964           0
               0           0        1056           0        1125           0        1057];
      
      
    QW=[0.5200         0    0.9200         0         0         0    0.6900
        0.6700         0    0.5200    0.5700    0.7500         0         0
             0         0         0         0    0.9100    0.8100         0
        0.7800    0.8500    0.7700         0    0.5100    0.5200    0.5300
        0.9300    0.6100         0    0.8100         0    0.5800         0
        0.6000    0.5400    0.6300         0         0         0    0.8100
        0.9500    0.5200    0.5700         0    0.8800    0.5400         0
        0.5700    0.7500         0    0.7200    0.7600         0    0.5900
             0    0.8700    0.5300    0.8200         0    0.7600         0
             0    0.9400    0.7200    0.5500         0    0.6600    0.6600
             0    0.8000    0.6300         0         0    0.6000         0
        0.7300    0.5500         0    0.7500    0.9500    0.5600    0.5400
             0         0    0.8400    0.8200    0.7000    0.7300    0.8900
        0.6600    0.5900         0         0    0.8100    0.7700         0
             0         0    0.6500         0    0.7800         0    0.8200

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