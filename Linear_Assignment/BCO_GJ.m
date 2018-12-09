function [ ANS,state,long] = BCO_GJ(mat) % "mat" is a input Matrix
    tic;
%     disp('wooowoowowowowowow');
    Size = size(mat);
    row = Size(1);
    col = Size(2);
    
    if row < col-1
%         disp('row!=col-1 so, we return!!!');
        state = 0; 
        ANS = 0;
        long = toc;
        return
    else
%         disp('the dimension is okay row >= col-1');
    end
%     col-1 > row --- > multi solution
    for i = 1:row 
        if i == col
           break 
        end
                temp = i;
                while mat(i,i)==0
%                     disp('e chip haiya it is 0!! ');
                    temp = temp + 1;
                    
                        if temp > row 
%                             disp('break down!');
                            if mat(i,length(mat))==0 % case multisolution
                                state = -1;
                            else % case no solution
                                state = 0;
                            end
                            ANS = 0;
                            long = toc;
                            return
                            
                        end
                    mat([i,temp],:) = mat([temp,i],:);
                    
                end
%                   disp('that is right');
                    matG = eye(row);
                    for k = 1:row
                        if k ~= i 
                            matG(k,i) = -1*mat(k,i)/mat(i,i);
                        else
                            matG(k,i) = 1/mat(i,i);
                        end
                    end % loop make guass matrix
                    mat = matG*mat ;
    end % end for i in row
    ANS = mat(1:col-1,col);
    state = 1;
    long = toc;
end %end function

