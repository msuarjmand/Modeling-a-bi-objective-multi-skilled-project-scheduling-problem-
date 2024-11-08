clc;
clear;
close all;
tic;
%% Problem Definition

model=CreateModel();

CostFunction=@(q,model) MyCost(q,model);

 
%% NSGA-II Settings

MaxIt=100;
nPop=70;

pCrossover=0.5;
nCrossover=round(pCrossover*nPop/2)*2;

pMutation=0.5;
nMutation=round(pMutation*nPop);


%% Initialization

individual.Position=[];
individual.Cost=[];
individual.sol=[];
individual.Rank=[];
individual.CrowdingDistance=[];
individual.DominationSet=[];    
individual.DominatedCount=[];   

pop=repmat(individual,nPop,1);


for i=1:nPop
  
    % Initialize Position
    pop(i).Position=CreateRandomSolution2(model);
    
    % Evaluation
    [pop(i).Cost pop(i).sol]=CostFunction(pop(i).Position,model);
    
end  
  

[pop F]=NonDominatedSorting(pop);

pop=CalcCrowdingDistance(pop,F);

figure(1);
PlotFronts(pop,F);


%% NSGA-II Main Loop

for it=1:MaxIt
    
     %Crossover
    popc=repmat(individual,nCrossover/2,1);
    for k=1:nCrossover/2
        
        i1=BinaryTournamentSelection(pop);
        i2=BinaryTournamentSelection(pop);
        
        p1=pop(i1);
        p2=pop(i2);
        
       [popc(k,1).Position popc(k,2).Position]=...
           Crossover2(p1.Position,p2.Position);
  
          [popc(k,1).Cost popc(k,1).sol]=CostFunction(popc(k,1).Position,model);
          [popc(k,2).Cost popc(k,2).sol]=CostFunction(popc(k,2).Position,model);
        
    end
    popc=popc(:);
    
    % Mutation
    popm=repmat(individual,nMutation,1);
    
    for k=1:nMutation
        
        i=BinaryTournamentSelection(pop);
        p=pop(i);
        
        popm(k).Position=Mutate2(p.Position);
        
        [popm(k).Cost popm(k).sol]=CostFunction(popm(k).Position,model);
        
        
    end
    
    
    % Merge Populations
    pop=[pop
         popc
         popm
         ];  %#ok
    
    % Non-Dominated Sorting
    [pop F]=NonDominatedSorting(pop);

    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);
    
    % Sort
    pop=SortPopulation(pop);
    
    % Delete Extra Members
    pop=pop(1:nPop);
    
    % Non-Dominated Sorting
    [pop F]=NonDominatedSorting(pop);
    
    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);
    
    % Plot Fronts
    figure(1);
    PlotFronts(pop,F);
    
    % Display Results
    disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F{1}))]);
    toc;
end



