`timescale 1ns/1ns
`include "d.v"
module stimulus;
reg clk;
reg rst;
reg [15:0] x;
wire z;
wire try;
wire reset_try;
integer k=0;
integer k1=0;
integer k2=0;
integer k3=0;
integer k4=0;
integer k5=0;
integer k6=0;
integer k7=0;
integer k8=0;
integer k9=0;
integer k10=0;
integer k11=0;
integer k12=0;
integer k13=0;
integer k14=0;
integer k15=0;
fsm UUT(clk,rst,x,z,try,reset_try);
initial
  begin
    $dumpfile("stimulus_tb2.vcd");
    $dumpvars;
  end

initial
    clk=1'b0;
always
    #5 clk =~clk;
initial
begin
    rst=1'b1;
    x=16'b1111111111111111;
    #10 rst=1'b0;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    x=16'b1111111111111110;
    #10 x=16'b1111011111111111;
    rst=1'b1;
    #10 x=16'b1101101111111111;
    // rst=1'b0;
    #10 x=16'b1101111101101111;
    rst=1'b0;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b0000000000000000;
    #10 x=16'b1101111101101111;
    #10 x=16'b1101111101101111;
    #10 x=16'b1101111101101111;
    #10 x=16'b1101111101101111;
    #10 x=16'b1111110110101111;
    #10 x=16'b1101011011111111;
    #10 x=16'b1111011011011011;
    #10 x=16'b1111110110101111;
    #10 x=16'b1101011011111111;
    #10 x=16'b1111011011011011;
    #10 x=16'b0000000000000000;
        for(k=0; k<16; k=k+1)
        begin
            for(k1=0; k1<16; k1=k1+1)
            begin
                for(k2=0; k2<16; k2=k2+1)
                begin
                    for(k3=0; k3<16; k3=k3+1)
                    begin
                        for(k4=0; k4<16; k4=k4+1)
                        begin
                            for(k5=0; k5<16; k5=k5+1)
                            begin
                                for(k6=0; k6<16; k6=k6+1)
                                begin
                                    for(k7=0; k7<16; k7=k7+1)
                                    begin
                                        for(k8=0; k8<16; k8=k8+1)
                                        begin
                                            for(k9=0; k9<16; k9=k9+1)
                                            begin
                                                for(k9=0; k9<16; k9=k9+1)
                                                begin
                                                    for(k10=0; k10<16; k10=k10+1)
                                                    begin
                                                        for(k11=0; k11<16; k11=k11+1)
                                                        begin
                                                            for(k12=0; k12<16; k12=k12+1)
                                                            begin
                                                                for(k13=0; k13<16; k13=k13+1)
                                                                begin
                                                                    for(k14=0; k14<16; k14=k14+1)
                                                                    begin
                                                                    x[k14]=1;
                                                                    if(k14>0)
                                                                    begin
                                                                        x[k14-1]=0;
                                                                    end
                                                                    #10;
                                                                    end
                                                                x[k13]=1;
                                                                if(k13>0)
                                                                begin
                                                                    x[k13-1]=0;
                                                                end
                                                                #10;
                                                                end
                                                            x[k12]=1;
                                                            if(k12>0)
                                                            begin
                                                                x[k12-1]=0;
                                                            end
                                                            #10;
                                                            end
                                                        x[k11]=1;
                                                        if(k11>0)
                                                        begin
                                                            x[k11-1]=0;
                                                        end
                                                        #10;
                                                        end
                                                    x[k10]=1;
                                                    if(k10>0)
                                                    begin
                                                        x[k10-1]=0;
                                                    end
                                                    #10;
                                                    end
                                                x[k9]=1;
                                                if(k9>0)
                                                begin
                                                    x[k9-1]=0;
                                                end
                                                #10;
                                                end
                                            x[k9]=1;
                                            if(k9>0)
                                            begin
                                                x[k9-1]=0;
                                            end
                                            #10;
                                            end
                                        x[k8]=1;
                                        if(k8>0)
                                        begin
                                            x[k8-1]=0;
                                        end
                                        #10;
                                        end
                                    x[k7]=1;
                                    if(k7>0)
                                    begin
                                        x[k7-1]=0;
                                    end
                                    #10;
                                    end
                                x[k6]=1;
                                if(k6>0)
                                begin
                                    x[k6-1]=0;
                                end
                                #10;
                                end
                            x[k5]=1;
                            if(k5>0)
                            begin
                                x[k5-1]=0;
                            end
                            #10;
                            end
                        x[k4]=1;
                        if(k4>0)
                        begin
                            x[k4-1]=0;
                        end
                        #10;
                        end
                    x[k3]=1;
                    if(k3>0)
                    begin
                        x[k3-1]=0;
                    end
                    #10;
                    end
                x[k2]=1;
                if(k2>0)
                begin
                    x[k2-1]=0;
                end
                #10;
                end
            x[k1]=1;
            if(k1>0)
            begin
                x[k1-1]=0;
            end
            #10;
            end
            x[k]=1;
            if(k>0)
            begin
                x[k-1]=0;
            end
            #10;
        end
    #20 $finish;
end
initial
    $monitor($time," Output z= %d and input x=%d and try=%d and reset_try=%d",z,x,try,reset_try);
endmodule