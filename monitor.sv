class half_adder_monitor extends uvm_monitor;
  `uvm_component_utils(half_adder_monitor)
  
  virtual half_adder_if vif;
  
   half_adder_sequence_item item;
  
  uvm_analysis_port #(half_adder_sequence_item) monitor_port;
  
  function new(string name = "half_adder_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MONITOR_CLASS", "Inside constructor!", UVM_LOW)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "build_phase!", UVM_LOW)
    
    monitor_port = new("monitor_port",this);
    

        if(!(uvm_config_db #(virtual half_adder_if)::get(this,"*","vif",vif))) begin
      `uvm_error("DRIVER_CLASS","Failed to get VIF from config DB!") 
    end
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "connect_phase!", UVM_LOW)
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS", "run_phase!", UVM_LOW)
    
     forever begin
    
       item=half_adder_sequence_item:: type_id::create("item");
  
      @(posedge vif.clk)
       
     item.in_a = vif.in_a;
     item.in_b =  vif.in_b;
     item.ena=vif.ena;
     item.sum  = vif.sum ;
     item.carry= vif.carry ;
      
     monitor_port.write(item);
       
     end
    
  endtask: run_phase
  
  
endclass:half_adder_monitor