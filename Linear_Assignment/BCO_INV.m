function [Ans,state,long] = BCO_INV(mat) % "mat" is a input Matrix
    tic;
    Size = size(mat);
    row = Size(1);
    col = Size(2);
    
    
    matG = eye(row);
    
    if row ~= col
        disp('worng dimension!!!');
        state = 0; 
        Ans = 0;
        long = toc;
        return
    end
    mat = [mat eye(row)];
    for i = 1:row 
            temp = i;
            while mat(i,i)==0
%                     disp('it is 0!! ');
                temp = temp + 1;
            
                    if temp > row 
%                             disp('break down!');
                        if mat(i,length(mat))==0 % case multisolution
                                state = -1;
                        else % case no solution
                                state = 0;
                        end
                        Ans = 0;
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
    Ans = mat(:,row+1:length(mat));
    state = 1;
    long = toc;
end %end function

