function [Q, Ans ,state ,long_f,long_s ] = BCO_randomQ_INV( size )
    Q = randi([-10,10],size,size);
    [ans_for,state_for,long_for] = BCO_INV(Q);
    Ans = ans_for;
%     Ans = round(Ans,4);
    state = state_for;
    long_f = long_for;
    
    [ans_spk,state_spk,long_spk] = BCO_INV_spark(Q);
    long_s = long_spk;
    
end


