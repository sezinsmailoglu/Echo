
%%lastversion
function dtfmtrans = DTMFTRA(Number)
   dt = 1/16384; 
   t = 0:dt:(length(Number)*0.25)-dt; 
   FreqComp1 = [697 770 852 941];
   FreqComp2 = [1209 1336 1477 1633]; 
   for i = 1 : length(Number)
        if (Number(i) == '1' |'2' | '3'|'4'| '5'| '6'| '7'| '8'| '9')
            num = mod(Number(i),3);
            if num == 0
                num = 3;
            end 
            high = FreqComp2(num);
            inputnum = str2num(Number(i));
            lownum = idivide(inputnum - 1 ,uint32(3))
            low = FreqComp1(lownum + 1 );
            dtfmtrans(0.25/dt*(i-1)+1:0.25/dt*i) = ((cos(2*pi*low*t(0.25/dt*(i-1)+1:0.25/dt*i))+cos(2*pi*high*t(0.25/dt*(i-1)+1:0.25/dt*i))));
        elseif (Number(i) == 'A' | 'B' | 'C' | 'D')
            high = 1633;
            low = FreqComp1(str2num(Number(i))- 64 );
            dtfmtrans(0.25/dt*(i-1)+1:0.25/dt*i) = ((cos(2*pi*low*t(0.25/dt*(i-1)+1:0.25/dt*i))+cos(2*pi*high*t(0.25/dt*(i-1)+1:0.25/dt*i))));
        
        %no numerical relation on the last row    
        elseif Number(i) == '0'  
            dtfmtrans(0.25/dt*(i-1)+1:0.25/dt*i) = ((cos(2*pi*941*t(0.25/dt*(i-1)+1:0.25/dt*i))+cos(2*pi*1336*t(0.25/dt*(i-1)+1:0.25/dt*i))));
        elseif Number(i) == '#'
            dtfmtrans(0.25/dt*(i-1)+1:0.25/dt*i) = ((cos(2*pi*941*t(0.25/dt*(i-1)+1:0.25/dt*i))+cos(2*pi*1477*t(0.25/dt*(i-1)+1:0.25/dt*i))));
        elseif Number(i) == '*'
            dtfmtrans(0.25/dt*(i-1)+1:0.25/dt*i) = ((cos(2*pi*941*t(0.25/dt*(i-1)+1:0.25/dt*i))+cos(2*pi*1209*t(0.25/dt*(i-1)+1:0.25/dt*i))));
        else 
            dtfmtrans(0.25/dt*(i-1)+1:0.25/dt*i) = 0;
        end 
   end 
end
