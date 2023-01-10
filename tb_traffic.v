module TB_TRAFFIC();
   reg tb_CLK = 0;
   reg tb_RST;
   reg tb_TC_2;
   reg tb_TC_10;
   wire tb_RST_Q;
   wire tb_G_CAR;
   wire tb_Y_CAR;
   wire tb_R_CAR;
   wire tb_G_PEDES;
   wire tb_R_PEDES;
   reg Q10[3:0];
   reg tb_RST_N;

   TRAFFIC DUT(
      .CLK(tb_CLK),
      .RST(tb_RST),
      .TC_2(tb_TC_2),
      .TC_10(tb_TC_10),
      .RST_Q(tb_RST_Q),
      .G_CAR(tb_G_CAR),
      .Y_CAR(tb_Y_CAR),
      .R_CAR(tb_R_CAR),
      .G_PEDES(tb_G_PEDES),
      .R_PEDES(tb_R_PEDES)
   );

   always begin
      #5 tb_CLK = ~tb_CLK;
   end

   initial begin
      tb_RST = 1'b1;
      #113 tb_RST = 1'b0;
      #246 tb_RST = 1'b1;
      #275 tb_RST = 
	  #394 tb_RST = 1'b0;
      #414 tb_RST = 1'b1;
   end

   always @(posedge tb_CLK) begin
      if (tb_RST_N == 1'b0) begin
         Q10 = 4'b0000;
         tb_TC_10 = 1'b0;
      end else if (tb_RST == 1'b1) begin
         Q10 = 4'b0000;
         tb_TC_10 = 1'b0;
      end else begin
         if (Q10 < 9) begin
            Q10 = Q10 + 1;
            tb_TC_10 = 1'b0;
         end else begin
            Q10 = 4'b0000;
            tb_TC_10 = 1'b1;
         end
      end
   end
endmodule
	  
