module TRAFFIC_ALL(
    input CLK,
    input RESET,
    input TESTMODE,
    output reg G_CAR,
    output reg Y_CAR,
    output reg R_CAR,
    output reg G_PEDES,
    output reg R_PEDES
);

reg TC_TIMEBASE;
reg TC_2;
reg TC_10;
reg RST_Q;

CLK_E CLKE (
    .CLK(CLK),
    .RST(RESET),
    .TESTMODE(TESTMODE),
    .TC_TIMEBASE(TC_TIMEBASE)
);

CLK_P CLKP (
    .CLK(CLK),
    .RST(RESET),
    .TC_TIMEBASE(TC_TIMEBASE),
    .RST_Q(RST_Q),
    .TC_2(TC_2),
    .TC_10(TC_10)
);

TRAFFIC ALL (
    .CLK(CLK),
    .RST(RESET),
    .TC_2(TC_2),
    .TC_10(TC_10),
    .RST_Q(RST_Q),
    .G_CAR(G_CAR),
    .Y_CAR(Y_CAR),
    .R_CAR(R_CAR),
    .G_PEDES(G_PEDES),
    .R_PEDES(R_PEDES)
);

endmodule
