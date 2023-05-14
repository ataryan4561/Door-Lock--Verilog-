module flipflop(input d1,input clk1,output reg q1);
   always @(posedge clk1)
begin
    q1<=d1;0
end
endmodule
module fsm(input clk,input rst_n,input [15:0] passcode,output ans,output try,output reset_try);
    wire [7:0] ans1 ;
    wire [7:0] try1 ;
    wire [7:0] reset_try1;
    wire [15:0] passcode1;
    wire ans2;
    wire try2;
    wire reset_try2;
    wire ro;
    flipflop I11 (rst_n,clk,ro);
    flipflop I12 (passcode[0],clk,passcode1[0]);
    flipflop I13 (passcode[1],clk,passcode1[1]);
    flipflop I14 (passcode[2],clk,passcode1[2]);
    flipflop I15 (passcode[3],clk,passcode1[3]);
    flipflop I16 (passcode[4],clk,passcode1[4]);
    flipflop I17 (passcode[5],clk,passcode1[5]);
    flipflop I18 (passcode[6],clk,passcode1[6]);
    flipflop I19 (passcode[7],clk,passcode1[7]);
    flipflop I191 (passcode[8],clk,passcode1[8]);
    flipflop I192 (passcode[9],clk,passcode1[9]);
    flipflop I193 (passcode[10],clk,passcode1[10]);
    flipflop I194 (passcode[11],clk,passcode1[11]);
    flipflop I195 (passcode[12],clk,passcode1[12]);
    flipflop I196 (passcode[13],clk,passcode1[13]);
    flipflop I197 (passcode[14],clk,passcode1[14]);
    flipflop I198 (passcode[15],clk,passcode1[15]);
    fsm1 I1(clk,ro,passcode1 [1:0] ,ans1 [0] ,try1 [0] ,reset_try1 [0]);
    fsm1 I2(clk,ro,passcode1 [3:2] ,ans1 [1] ,try1 [1],reset_try1 [1]);
    fsm1 I3(clk,ro,passcode1 [5:4] ,ans1 [2] ,try1 [2],reset_try1 [2]);
    fsm1 I4(clk,ro,passcode1 [7:6] ,ans1 [3] ,try1 [3],reset_try1 [3]);
    fsm1 I5(clk,ro,passcode1 [9:8] ,ans1 [4] ,try1 [4],reset_try1 [4]);
    fsm1 I6(clk,ro,passcode1 [11:10] ,ans1 [5] ,try1 [5],reset_try1 [5]);
    fsm1 I7(clk,ro,passcode1 [13:12] ,ans1 [6] ,try1 [6],reset_try1 [6]);
    fsm1 I8(clk,ro,passcode1 [15:14] ,ans1 [7] ,try1 [7],reset_try1 [7]);
    assign ans2 = ans1[0]&ans1[1]&ans1[2]&ans1[3]&ans1[4]&ans1[5]&ans1[6]&ans1[7];
    assign try2 = try1[0]&try1[1]&try1[2]&try1[3]&try1[4]&try1[5]&try1[6]&try1[7];
    assign reset_try2 = reset_try1[0]&reset_try1[1]&reset_try1[2]&reset_try1[3]&reset_try1[4]&reset_try1[5]&reset_try1[6]&reset_try1[7];
    flipflop I20 (ans2,clk,ans);
    flipflop I21 (try2,clk,try);
    flipflop I22 (reset_try2,clk,reset_try);
endmodule
module fsm1(input clk,input rst_n,input [1:0] passcode,output reg ans,output reg try,output reg reset_try);
parameter s0 = 1'b0;
parameter s1 = 1'b1;
parameter try_s0 = 2'b00;
parameter try_s1 = 2'b01;
parameter try_s2 = 2'b10;
parameter try_s3 = 2'b11;
parameter rtry0 = 2'b00;
parameter rtry1 = 2'b01;
parameter rtry2 = 2'b10;
parameter rtry3 = 2'b11;
reg [1:0] state_r,next_state_r;
reg state,next_stage;
reg [1:0] state_try,next_stage_try;
reg [1:0] stored_passcode=2'b11;
always @(posedge clk)
begin
        state_r<=next_state_r;
end
always @(posedge clk or negedge rst_n)
begin
    if(rst_n)
        state_try<=try_s0;
    else
        state_try<=next_stage_try;
end
always @(posedge clk or negedge rst_n)
begin
    if(rst_n)
        state<=s0;
    else
        state<=next_stage;
end
always@(*)
begin
    case(state_try)
    try_s0 : if(state==s0)
            next_stage_try<=try_s1;
            else
            next_stage_try<=try_s0;
    try_s1 : if(state==s0)
            next_stage_try<=try_s2;
            else
            next_stage_try<=try_s0;
    try_s2 : if(state==s0)
            next_stage_try<=try_s3;
            else
            next_stage_try<=try_s0;
    default : next_stage_try<=try_s0;
    endcase
end
always@(*)
begin
    case(state_r)
    rtry0 : if(rst_n)
            next_state_r<=rtry1;
            else
            next_state_r<=rtry0;
    rtry1 : if(rst_n)
            next_state_r<=rtry2;
            else
            next_state_r<=rtry0;
    rtry2 : if(rst_n)
            next_state_r<=rtry3;
            else
            next_state_r<=rtry0;
    default : next_state_r<=rtry0;
    endcase
end
always@(*)
begin
    case(state)
    s0: if(passcode[1:0]==stored_passcode[1:0])
        next_stage<=s1;
        else
        next_stage<=s0;
    default :  next_stage<=s0;
    endcase
end
always@(*)
begin
    case(state)
    s0 : ans=1'b0;
    s1 : ans=1'b1;
    default : ans=1'b0;
    endcase
end
always@(*)
begin
    case(state_r)
    rtry0 : reset_try=1'b0;
    rtry1 : reset_try=1'b0;
    rtry2 : reset_try=1'b0;
    rtry3 : reset_try=1'b1;
    default : reset_try=1'b0;
    endcase
end
always@(*)
begin
    case(state_try)
    try_s0 : try=1'b0;
    try_s1 : try=1'b0;
    try_s2 : try=1'b0;
    try_s3 : try=1'b1;
    default : try=1'b0;
    endcase
end
endmodule
