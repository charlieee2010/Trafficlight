module TB_CLK_E();
   reg tb_CLK = 0;
   reg tb_RST;
   reg tb_TESTMODE;
   wire tb_TC_TIMEBASE;

   CLK_E DUT(
      .CLK(tb_CLK),
      .RST(tb_RST),
      .TESTMODE(tb_TESTMODE),
      .TC_TIMEBASE(tb_TC_TIMEBASE)
   );

   initial begin
      forever #5 tb_CLK = ~tb_CLK;
   end

   initial begin
      tb_RST = 1'b1;
      #113 tb_RST = 1'b0;
      #250 tb_RST = 1'b1;
      #275 tb_RST = 1'b0;
   end

   initial begin
      tb_TESTMODE = 1'b1;
      #300 tb_TESTMODE = 1'b0;
   end

endmodule
