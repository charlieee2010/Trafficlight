

module clk_e(tc_timebase,testmode,rst,clk);
input clk,rst,testmode;
output reg[1:0] tc_timebase;

reg[27:0] data,q_tc;

always @(testmode)
begin
     if (testmode == 1'b0) 
	    data <= 28'h5f5e0ff;   // 99999999 in decimal, cuz the clock is up to 100MHz
	 else 
	    data <= 28'h0000009;
end

always @(posedge clk or posedge rst)
begin
     if (rst == 1'b1)
     	begin
	    q_tc <= 28'h0000000;
	    tc_timebase <= 1'b0;
		end
	 else
	    begin
	     if(q_tc < data) 
		    begin
		    q_tc <= q_tc +1;
			tc_timebase <= 1'b0; 
			end
		 else 
		     begin
		     q_tc <= 28'h0000000;
			 tc_timebase <= 1'b1;
			 end
		end
end
endmodule
	 
     
