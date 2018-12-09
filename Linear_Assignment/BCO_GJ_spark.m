% Copyright 2018 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: BCO
%                BCO@BCO.co.op

function [ B_out ,state ,long ] = BCO_GJ_spark( mat )
    B = mat(:,length(mat));
    A = mat(:,1:length(mat)-1);
    state = 1;
    tic;
  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ BT, ...
    BB ] = FLA_Part_2x1( B, ...
                         0, 'FLA_TOP' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ B0, ...
      b1t, ...
      B2 ] = FLA_Repart_2x1_to_3x1( BT, ...
                                    BB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    a01 = a01/alpha11;
    a21 = a21/alpha11;
    A02 = A02- a01*a12t;
    A22 = A22 - a21*a12t;
    B0 = B0 - b1t*a01;
    B2 = B2 - b1t*a21;
    a01 = zeros(size(a01));
    a21 = zeros(size(a21));
    
%     b1t = b1t/alpha11;
%     if alpha11== 0 
%         state = 0;
%     end
%     alpha11 = 1;
    
    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ BT, ...
      BB ] = FLA_Cont_with_3x1_to_2x1( B0, ...
                                       b1t, ...
                                       B2, ...
                                       'FLA_TOP' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

  B_out = [ BT
            BB ] ;
        for i  = 1: length(A_out)
            if A_out(i,i) == 0
                state = 0;
            end
            B_out(i,1) = B_out(i,1)/A_out(i,i);
            A_out(i,i) = A_out(i,i)/A_out(i,i);
        end
    long = toc;
return
