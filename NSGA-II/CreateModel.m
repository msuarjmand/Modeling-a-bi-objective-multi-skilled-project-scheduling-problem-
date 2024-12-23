function model=CreateModel()
%% first sample

%     PredList={[],[],1,2};
%     
%     t=[2 5 3 3];
% 
%     N=numel(t);
%     
%     activity=[0 1 1
%               1 0 1
%               2 1 0
%               0 1 0];
%           
%     worker=[0 1 1
%             1 0 1
%             1 0 0
%             1 0 1]; 
% %     worker=[1 1 1
% %             1 1 1
% %             1 1 1
% %             1 1 1]; 
%         
%     es=[0 0 2 5];
    
    
%% second sample

    PredList={[],[],[],[1 2],[2 3],[1 2 4],[1 2 3 4 5],[2 3 5],[1 2 3 4 5 6 7],[1 2 3 4 5 7 8]};

    t=[3 6 8 4 7 5 3 7 4 8];
    N=numel(t);
    activity=[2 1 0 1 0
              1 1 0 1 1
              2 0 0 0 1
              1 2 0 0 1
              1 0 0 3 0
              1 1 2 0 0
              0 0 0 2 2
              0 1 2 1 0
              0 0 3 1 0
              0 3 1 1 0];
          
%      worker=[1 1 0 0 0
%              0 1 1 0 0
%              0 0 1 1 0
%              0 0 0 1 1
%              1 0 0 0 1
%              1 0 0 0 0
%              0 1 0 0 0
%              0 0 1 0 0
%              0 0 0 1 0
%              0 0 0 0 1
%              0 1 0 1 0
%              0 1 1 1 0];


         worker=[0     1     1     1     1
                 0     0     1     1     1
                 0     0     0     0     1
                 1     0     0     0     1
                 0     0     0     0     1
                 0     1     0     0     0
                 0     1     1     1     1
                 0     1     0     0     1
                 0     1     1     0     1
                 0     1     1     0     0
                 0     0     1     1     1
                 1     0     1     1     0
                 0     0     1     0     0
                 0     0     1     0     0
                 1     1     1     1     1
                 0     0     0     0     0
                 0     0     0     0     1
                 0     1     0     1     0
                 1     1     0     0     0
                 0     0     0     1     1];

   es=[0 0 0 6 8 10 15 15 18 22];   

%% Third Sample

%   PredList={[],[],1,[2,3],[2,3],5,3,[5,6],[2,4],10,8,[5,10],[4,9],[9,11],4,[7,12,16],[7,11,16],[15,17,18],[13,14,18],[6,18,19]};
%       t=[7 10 2 6 8 1 8 1 7 4 6 4 9 10 1 7 8 6 2 5];
% 
% 
%     N=numel(t);
%     
%    activity=[ 2 1 1 2 0
%               1 1 0 1 1
%               2 0 1 0 1
%               1 2 0 2 1
%               2 1 0 3 0
%               1 1 2 0 1
%               1 1 0 2 2
%               0 1 2 1 1
%               2 0 3 1 0
%               1 3 1 1 0
%               2 1 1 0 2
%               0 2 3 0 1
%               1 1 1 2 3
%               1 0 1 0 3
%               2 2 1 0 1
%               3 0 2 2 1
%               1 3 2 0 2
%               2 0 3 3 1
%               1 1 1 1 2
%               2 2 1 1 1];
%          
%  
%  worker=[0     0     1     1     1
%          1     1     0     1     1
%          0     1     0     1     1
%          1     0     1     1     1
%          0     1     1     1     0
%          0     0     1     1     0
%          0     1     0     0     1
%          1     0     0     1     1
%          1     1     0     1     1
%          0     1     0     0     1
%          0     1     0     0     0
%          1     1     0     1     1
%          1     0     1     1     0
%          0     1     1     1     1
%          0     1     1     0     0
%          1     1     0     1     0
%          1     0     0     1     1
%          1     1     1     0     1
%          0     1     0     0     0
%          1     1     1     1     1
%          1     0     1     1     1
%          0     1     1     1     0
%          1     0     0     1     1
%          1     0     0     1     0
%          0     0     1     0     0
%          1     0     1     0     1
%          1     1     0     1     1
%          0     1     1     1     1
%          1     1     1     1     1
%          0     0     1     0     1
%          0     1     1     0     1
%          1     0     1     1     1
%          1     0     0     1     0
%          0     1     1     1     1
%          0     0     0     1     0
%          0     1     0     1     1
%          0     1     0     0     1
%          1     0     1     1     1
%          0     1     0     0     1
%          0     1     0     0     1
%          1     1     0     1     0
%          1     1     0     0     0
%          0     1     1     0     1
%          1     0     0     1     1
%          0     0     0     0     0
%          1     1     1     0     1
%          0     0     0     1     1
%          1     1     0     1     0
%          1     1     1     1     1
%          1     1     0     1     1];
% 
% 
% %    es=[0 0 0 6 8 10 15 15 18 12 15 15 14 21 24 24 27 28 30 32];
%    
%     es=zeros(1,20);
    
    
    %% Forth example
    
%     PredList={[],[],1,[2,3],[2,3],5,3,[5,6],[2,4],10,8,[5,10],[4,9],[9,11],4,[7,12,16],[7,11,16],[15,17,18],[13,14,18],[6,18,19]};
%       t=[7 10 2 6 8 1 8 1 7 4 6 4 9 10 1 7 8 6 2 5];
% 
% 
%     N=numel(t);
%     
%     
%   activity=[ 0     2     1     3     0     2     0     1     0     2
%              1     2     2     0     0     1     3     2     3     1
%              1     1     0     3     1     0     3     1     1     2
%              3     1     2     3     1     1     3     0     2     1
%              2     3     3     3     1     2     1     1     0     3
%              3     1     2     2     2     0     1     2     1     2
%              3     2     0     1     1     0     3     0     2     0
%              3     3     0     3     0     0     0     1     1     0
%              3     2     0     3     2     0     1     0     1     2
%              1     0     2     3     3     2     1     0     2     2
%              0     2     3     2     2     2     3     3     0     3
%              1     2     1     0     1     1     3     3     3     1
%              1     1     2     2     1     3     1     1     3     2
%              1     3     1     1     3     1     2     0     3     2
%              1     3     0     3     3     0     3     3     3     2
%              2     1     3     0     3     3     3     0     1     0
%              3     2     2     2     1     0     0     0     3     3
%              1     3     3     2     2     0     0     2     3     0
%              1     1     2     2     0     3     0     0     0     0
%              0     3     0     2     2     2     2     1     1     3];
%          
%     worker=[ 0     1     0     1     1     1     0     1     0     1
%              1     1     0     0     0     1     1     1     1     0
%              1     1     0     0     1     1     0     1     1     1
%              1     1     1     1     0     0     0     1     0     0
%              0     0     0     0     1     0     1     1     1     0
%              1     0     0     1     1     1     1     1     1     1
%              0     0     1     1     1     0     1     0     0     1
%              1     1     1     1     1     1     0     0     0     0
%              1     1     0     0     0     1     0     0     1     1
%              1     0     1     1     1     1     0     1     1     1
%              1     0     1     1     0     0     1     1     1     1
%              0     0     0     0     1     0     0     1     0     1
%              1     1     0     1     0     1     1     0     0     1
%              0     0     1     0     0     1     0     1     0     1
%              1     0     0     1     1     0     0     0     1     1
%              0     1     0     0     1     0     1     1     0     1
%              0     1     1     0     0     0     1     1     0     0
%              0     0     0     1     0     0     1     0     0     0
%              0     1     0     1     0     1     1     0     0     1
%              1     0     0     0     1     1     0     1     1     1
%              1     1     0     0     1     0     0     0     1     0
%              1     1     0     0     1     1     0     1     0     1
%              0     1     0     0     1     1     1     0     0     1
%              1     1     1     1     0     0     0     0     0     1
%              0     0     1     1     1     1     1     0     1     0
%              1     1     1     0     1     1     0     1     1     0
%              1     0     1     0     1     0     1     0     0     0
%              1     1     1     1     0     1     1     1     1     0
%              0     1     0     1     0     1     1     0     1     1
%              1     1     1     1     0     1     0     1     0     0
%              0     1     1     1     1     0     1     0     0     0
%              1     0     1     0     0     1     0     0     1     0
%              0     0     1     0     0     1     0     0     1     1
%              0     0     1     1     0     1     0     0     0     0
%              0     0     1     0     0     0     1     0     0     1
%              0     1     1     0     0     1     1     1     1     0
%              1     0     0     1     1     1     1     0     0     0
%              1     0     0     1     0     0     1     0     0     0
%              0     0     1     0     1     0     1     1     1     0
%              0     1     0     0     1     0     1     1     0     1
%              1     0     1     0     1     1     1     1     0     0
%              1     1     0     0     0     1     1     0     0     0
%              1     0     1     1     1     0     0     1     1     1
%              0     0     0     0     1     0     1     1     0     1
%              1     0     1     1     0     0     1     1     1     1
%              0     0     1     0     1     0     0     1     1     0
%              1     1     0     1     0     0     0     1     0     1
%              0     0     0     1     1     1     1     1     1     1
%              1     0     1     0     1     1     1     1     1     1
%              1     0     1     0     0     0     0     1     0     0
%              1     0     0     1     1     0     0     0     0     0
%              0     0     0     0     0     1     0     0     0     0
%              0     0     1     1     1     0     0     0     1     1
%              1     0     1     0     1     0     1     0     0     1
%              0     0     0     0     1     1     1     0     0     1
%              0     0     0     1     0     0     0     0     1     0
%              1     1     1     1     1     1     1     0     0     1
%              0     1     0     1     1     1     0     0     0     0
%              0     0     0     0     0     1     1     1     1     0
%              1     0     0     0     1     0     0     1     0     1
%              0     1     1     1     1     1     1     0     1     1
%              1     1     0     1     1     0     1     1     1     1
%              0     0     1     1     1     1     0     1     0     1
%              1     1     0     0     1     1     0     0     1     0
%              1     1     1     0     0     1     1     0     1     1
%              1     1     0     1     0     0     1     1     1     0
%              0     0     1     0     0     1     1     0     1     0
%              1     1     0     1     1     0     0     1     0     0
%              0     1     0     0     0     1     1     1     0     0
%              0     0     0     1     1     1     1     0     1     1
%              0     0     1     1     0     0     0     1     0     0
%              0     1     0     0     0     1     0     1     1     1
%              1     0     1     1     0     0     1     1     1     0
%              1     1     0     0     0     1     0     0     1     1
%              1     0     1     1     1     1     1     1     1     1
%              0     1     0     0     1     1     1     0     0     0
%              0     1     1     1     0     1     1     1     0     1
%              1     1     0     0     0     0     0     0     0     1
%              1     0     1     0     0     1     0     1     1     0
%              0     1     0     0     0     1     1     1     1     0
%              0     1     0     0     1     0     0     1     1     0
%              1     0     1     1     1     1     0     0     0     0
%              0     0     0     0     1     1     1     1     1     0
%              0     1     0     1     1     0     0     1     1     0
%              0     0     1     0     1     1     0     1     0     1
%              1     1     1     0     1     0     0     0     1     1
%              1     1     1     0     1     1     1     0     1     1
%              1     0     1     0     0     0     0     0     1     1
%              0     1     0     0     0     1     1     1     1     0
%              0     0     1     1     0     1     0     0     1     0
%              0     1     1     1     1     1     1     0     1     0
%              0     0     0     1     1     0     1     1     0     0
%              1     1     1     0     0     0     1     0     0     0
%              1     1     1     1     0     1     1     1     0     1
%              1     1     0     1     1     0     0     1     0     0
%              0     0     0     0     0     0     0     0     1     1
%              1     0     1     1     1     1     1     0     0     1
%              1     1     0     1     0     0     1     1     0     1
%              0     0     0     1     0     0     1     1     0     1
%              0     0     0     1     1     1     1     0     1     1];
% 
% 
%     es=zeros(1,20);
   %%

   skill=numel(worker(1,:));
   
    
    model.PredList=PredList;
    model.N=N;
    model.activity=activity;
    model.worker=worker;
    model.es=es;
    model.t=t;
    model.skill=skill;

end