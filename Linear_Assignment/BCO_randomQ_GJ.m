function [Q, Ans ,state ,long_f ,long_s ] = BCO_randomQ_GJ( size )
    Ans = randi([-10,10],size,1); 
    Q = randi([-10,10],size,size);
    Q = [Q,Q*(Ans)];
    [ans_for,state_for,long_for] = BCO_GJ(Q)
    state = state_for;
    long_f = long_for;
    [ans_spk,state_spk,long_spk]= BCO_GJ_spark(Q)
    long_s = long_spk;
end

