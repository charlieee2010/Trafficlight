

module clk_p(tc_2,tc_10,clk,rst,tc_timebase,rst_q);
input clk,rst,rst_q,tc_timebase;
output reg tc_2,tc_10;

wire q_2;
reg[3:0] q_10;

always @(posedge clk or posedge rst or posedge rst_q)
begin
     if(rst_q == 1'b1) begin
	    q_2 <= 1'b0;
		tc_2 <= 1'b0;
	 end
     else
	     begin
         if(rst == 1'b1) begin	 
            q_2 <= 1'b0;
		    tc_2 <= 1'b0;
		 end
		 else
		     begin
		     if (tc_timebase == 1'b1)
			     begin
				 if (q_2 = 1'b0) begin
				     q_2 <= ~q_2;
					 tc_2 <= 1'b0; end
			     else begin
				      q_2 <= 1'b0;
		              tc_2 <= 1'b1; end
			     end
             end
	   	end
end

always @(posedge clk or posedge rst or posedge rst_q)
begin
     if(rst_q == 1'b0) begin
	    q_10 <= 4'b0;
		tc_10 <= 1'b0;
	 end
     else
	     begin
         if(rst == 1'b1) begin	 
            q_10 <= 4'b0;
		    tc_10 <= 1'b0;
		 end
		 else
		     begin
		     if (tc_timebase == 1'b1)
			     begin
				 if (q_10 < 4'b1001) begin
				     q_10 <= q_10 +1;
					 tc_10 <= 1'b0; end
			     else begin
				      q_2 <= 1'b0;
		              tc_2 <= 1'b1; end
			     end
             end
	   	end
end

endmodule