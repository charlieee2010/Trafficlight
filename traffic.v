`module TRAFFIC(
  input CLK,
  input RST,
  input TC_2,
  input TC_10,
  output reg RST_Q,
  output reg G_CAR,
  output reg Y_CAR,
  output reg R_CAR,
  output reg G_PEDES,
  output reg R_PEDES
);

reg TC;

typedef enum {s_1,s_2,s_3,s_4} StateType;
reg Current_state, Next_state;

always @(posedge CLK) begin
   if (RST) 
     Current_state <= s_1;
   else 
       if (TC) 
          Current_state <= Next_state;
        else 
          Current_state <= Current_state;

    end
end

always @(Current_state, TC_10, TC_2) begin
   case (Current_state)
      s_1: begin
         R_CAR <= 1'b1;
         Y_CAR <= 1'b0;
         G_CAR <= 1'b0;
         R_PEDES <= 1'b0;
         G_PEDES <= 1'b1;
         TC <= TC_10;
         RST_Q <= 1'b1;
         Next_state <= s_2;
        end
      s_2: begin
         R_CAR <= 1'b1;
         Y_CAR <= 1'b1;
         G_CAR <= 1'b0;
         R_PEDES <= 1'b1;
         G_PEDES <= 1'b0;
         TC <= TC_2;
         RST_Q <= 1'b0;
         Next_state <= s_3;
        end
       s_3: begin
         R_CAR <= 1'b0;
         Y_CAR <= 1'b0;
         G_CAR <= 1'b1;
         R_PEDES <= 1'b1;
         G_PEDES <= 1'b0;
         TC <= TC_10;
         RST_Q <= 1'b1;
         Next_state <= s_4;
         end
       s_4: begin
         R_CAR <= 1'b0;
         Y_CAR <= 1'b1;
         G_CAR <= 1'b0;
         R_PEDES <= 1'b1;
         G_PEDES <= 1'b0;
         TC <= TC_2;
         RST_Q <= 1'b0;
         Next_state <= s_1;
         end
    endcase
end

endmodule