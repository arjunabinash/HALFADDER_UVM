class half_adder_sequencer extends uvm_sequencer#(half_adder_sequence_item);
  `uvm_component_utils(half_adder_sequencer)
  
  function new(string name = "half_adder_sequencer",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SQUNCR_CLASS", "Inside constructor!", UVM_LOW)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SQNCR_CLASS", "build_phase!", UVM_LOW)
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SQNCR_CLASS", "connect_phase!", UVM_LOW)
  endfunction: connect_phase
  
endclass:half_adder_sequencer