module TB_CLK_P();

reg tb_CLK;
reg tb_RST;
reg tb_TC_TIMEBASE;
reg tb_RST_Q;
reg tb_TC_2;
reg tb_TC_10;
reg [3:0] Q;

CLK_P DUT (
    .CLK(tb_CLK),
    .RST(tb_RST),
    .TC_TIMEBASE(tb_TC_TIMEBASE),
    .RST_Q(tb_RST_Q),
    .TC_2(tb_TC_2),
    .TC_10(tb_TC_10)
);

always begin
    #5 tb_CLK <= ~tb_CLK;
end

initial begin
    tb_RST <= 1'b1;
    #113 tb_RST <= 1'b0;
    tb_RST_Q <= 1'b1;
    #1209 tb_RST_Q <= 1'b0;
end

always @(posedge tb_CLK) begin
    if (tb_RST) begin
        Q <= 4'b0;
        tb_TC_TIMEBASE <= 1'b0;
    end else begin
        if (Q < 9) begin
            Q <= Q + 1;
            tb_TC_TIMEBASE <= 1'b0;
        end else begin
            Q <= 4'b0;
            tb_TC_TIMEBASE <= 1'b1;
        end
    end
end

endmodule