/*Module Name: Top file
//Explanation: This file is responsible for generating clk, applying initial reset, and connecting design to testbench. Top is also responsible to start task inside test file.
*/
module apb_top;
import apb_pkg::*;

apb_interface vif();

apb_slave dut(.dif(vif));
apb_test testh;
initial begin
  vif.pclk=1'b0;
  forever #10 vif.pclk= ~vif.pclk;   // pclk frequency 50 MHz
end

initial begin
  testh=new(vif);
  testh.run();
  #2000 $finish;
end
final begin
  $display("FINAL COVERAGE=%0.2f",testh.env.sco.apb_cov1.get_coverage());
end
endmodule
