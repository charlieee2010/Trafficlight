module TB_TRAFFIC_ALL;
    reg tb_CLK;
    reg tb_RST;
    reg tb_TESTMODE;
    wire tb_G_CAR;
    wire tb_Y_CAR;
    wire tb_R_CAR;
    wire tb_G_PEDES;
    wire tb_R_PEDES;
    
    // Instantiate the DUT
    TRAFFIC_ALL DUT (
        .CLK(tb_CLK),
        .RST(tb_RST),
        .TESTMODE(tb_TESTMODE),
        .G_CAR(tb_G_CAR),
        .Y_CAR(tb_Y_CAR),
        .R_CAR(tb_R_CAR),
        .G_PEDES(tb_G_PEDES),
        .R_PEDES(tb_R_PEDES)
    );
    
    initial begin
        tb_CLK = 0;
        tb_RST = 1;
        tb_TESTMODE = 1;
        #5 tb_CLK = !tb_CLK;
        #113 tb_RST = 0;
        #5 tb_CLK = !tb_CLK;
    end
    
endmodule
