class half_adder_env extends uvm_env;
  `uvm_component_utils(half_adder_env)
  
 virtual  half_adder_if vif;
  
 half_adder_agent agnt;
 half_adder_scoreboard scb;
  
  function new(string name = "half_adder_env",uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV_CLASS", "Inside constructor!", UVM_LOW)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS", "build_phase!", UVM_HIGH)
     agnt= half_adder_agent :: type_id :: create ("agnt",this);
     scb= half_adder_scoreboard :: type_id :: create ("scb",this);
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "connect_phase!", UVM_LOW)
    agnt.mon.monitor_port.connect(scb.scoreboard_port);
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
  endtask: run_phase
  
  
endclass:half_adder_env