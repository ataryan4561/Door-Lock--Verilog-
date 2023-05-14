module fsm(input clk,input rst_n,input [15:0] passcode,output ans,output try,output reset_try);
    wire [7:0] ans1 ;
    wire [7:0] try1 ;
    wire [7:0] reset_try1 ;
    fsm1 I1(clk,rst_n,passcode [1:0] ,ans1 [0] ,try1 [0] ,reset_try1 [0]);
    fsm1 I2(clk,rst_n,passcode [3:2] ,ans1 [1] ,try1 [1],reset_try1 [1]);
    fsm1 I3(clk,rst_n,passcode [5:4] ,ans1 [2] ,try1 [2],reset_try1 [2]);
    fsm1 I4(clk,rst_n,passcode [7:6] ,ans1 [3] ,try1 [3],reset_try1 [3]);
    fsm1 I5(clk,rst_n,passcode [9:8] ,ans1 [4] ,try1 [4],reset_try1 [4]);
    fsm1 I6(clk,rst_n,passcode [11:10] ,ans1 [5] ,try1 [5],reset_try1 [5]);
    fsm1 I7(clk,rst_n,passcode [13:12] ,ans1 [6] ,try1 [6],reset_try1 [6]);
    fsm1 I8(clk,rst_n,passcode [15:14] ,ans1 [7] ,try1 [7],reset_try1 [7]);
    assign ans = ans1[0]&ans1[1]&ans1[2]&ans1[3]&ans1[4]&ans1[5]&ans1[6]&ans1[7];
    assign try = try1[0]&try1[1]&try1[2]&try1[3]&try1[4]&try1[5]&try1[6]&try1[7];
    assign reset_try = reset_try1[0]&reset_try1[1]&reset_try1[2]&reset_try1[3]&reset_try1[4]&reset_try1[5]&reset_try1[6]&reset_try1[7];
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
    try_s1 : if(state==s0)
            next_stage_try<=try_s2;
    try_s2 : if(state==s0)
            next_stage_try<=try_s3;
    default : next_stage_try<=try_s0;
    endcase
end
always@(*)
begin
    case(state_r)
    rtry0 : if(rst_n)
            next_state_r<=rtry1;
    rtry1 : if(rst_n)
            next_state_r<=rtry2;
    rtry2 : if(rst_n)
            next_state_r<=rtry3;
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
