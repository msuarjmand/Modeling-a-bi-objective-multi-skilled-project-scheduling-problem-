function [z ,sol]=MyCost(sol,model)

   
    global NFE;
    NFE=NFE+1;

    z=[0 0];


if ~isfield(sol,'Cmax')

    sol=ParseSolution2(sol,model);
end




    W=sol.W;
    Cmax=sol.Cmax;
    A=zeros(numel(W(:,1)),Cmax-1);
    
    
    for i=1:Cmax-1
        for j=1:numel(W(:,1))
           
            A(j,i)=abs(W(j,i)-W(j,i+1));
            
        end
    end

   
    z(1)=sol.Cmax;
    z(2)=sum(sum(A));

 z=[z(1) z(2)]';
    


    
end