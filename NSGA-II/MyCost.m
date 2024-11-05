function [z ,sol]=MyCost(sol,model)


    z=[0 0 0 0];


if ~isfield(sol,'Cmax')

    sol=ParseSolution(sol,model);
end

    M=model.M;
    W=sol.W;
    Cmax=sol.Cmax;
    MCmax=sol.MCmax;
    A=cell(1,M);
    AA=zeros(1,M);
    
    for m=1:M
        A{m}=zeros(numel(W{m}(:,1)),Cmax(m)-1);


        for i=1:Cmax(m)-1
            for j=1:numel(W{m}(:,1))

                A{m}(j,i)=abs(W{m}(j,i)-W{m}(j,i+1));

            end
        end
        AA(m)=sum(sum(A{m}(:,:)));
    end
    
    TCW=sol.TCW;
    TQW=sol.TQW;
    A2=sol.A2;
    
    z(3)=TCW;
    
    
    z(4)=1/(TQW/sum(A2(:)));
 
    
    
   %% output
    
    
    
   
    z(1)=MCmax;
    z(2)=mean(AA);

 z=[z(1) z(2) z(3) z(4)];
    


    
end