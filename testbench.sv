`include "uvm_macros.svh"
 import uvm_pkg::*;


`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
`include "timescale.sv"



module tb;
  
  logic clk;

  half_adder_if inter_face(.clk(clk));
  
     half_adder dut (
     .clk(inter_face.clk),
     .in_a(inter_face.in_a),
     .in_b(inter_face.in_b),
     .ena(inter_face.ena),
     .sum(inter_face.sum),
     .carry(inter_face.carry) );
  
  
 initial begin
    uvm_config_db #(virtual half_adder_if)::set(null,"*","vif",inter_face);
  end
  
initial begin
    run_test("half_adder_test");
  end
  
  initial begin
    clk=0;
   forever #5 clk=~clk;
  end

  initial begin
    #500 $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule:tb