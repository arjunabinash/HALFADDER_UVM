class half_adder_agent extends uvm_agent;
  `uvm_component_utils(half_adder_agent)
  
  half_adder_driver drv;
  half_adder_monitor mon;
  half_adder_sequencer sqncr;
  
  function new(string name = "half_adder_agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("AGENT_CLASS", "Inside constructor!", UVM_LOW)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_CLASS", "build_phase!", UVM_LOW)
    
    drv= half_adder_driver :: type_id :: create ("drv",this);
    mon= half_adder_monitor :: type_id :: create ("mon",this);
    sqncr= half_adder_sequencer :: type_id :: create ("sqncr",this);
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS", "connect_phase!", UVM_LOW)
    
    drv.seq_item_port.connect(sqncr.seq_item_export);
    
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
  endtask: run_phase
  
  
endclass:half_adder_agent