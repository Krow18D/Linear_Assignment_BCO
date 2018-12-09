function [ A_out ,state ,long ] = BCO_INV_spark( A )
    state = 1;
    tic;
  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    %------------------------------------------------------------%

    a01 = laff_invscal( alpha11, a01 );   A02 = laff_ger( -1, a01, a12t, A02 );
    
    a21 = laff_invscal( alpha11, a21 );   A22 = laff_ger( -1, a21, a12t, A22 );
    
    A00 = laff_ger( -1, a01, a10t, A00 ); a01 = laff_scal( -1, a01 );

    A20 = laff_ger( -1, a21, a10t, A20 ); a21 = laff_scal( -1, a21 );

    a12t = laff_invscal( alpha11, a12t );
    
    a10t = laff_invscal( alpha11, a10t );
    
    alpha11 = laff_invscal( alpha11, 1. );
    
    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );
                                         
  end
  A_out = [ ATL, ATR
            ABL, ABR ];
  long = toc;
  ss = size(A_out);
  for i = ss(1)
      for j = ss(2)
          if isnan(A_out(i,j)) == 1
            state = 0;
            return
          end
      end
  end
  
return

