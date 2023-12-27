class half_adder_driver extends uvm_driver#(half_adder_sequence_item);
  `uvm_component_utils(half_adder_driver)
  
  virtual half_adder_if vif;
  
   half_adder_sequence_item item;
  
  function new(string name = "half_adder_driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("DRIVER_CLASS", "Inside constructor!", UVM_LOW)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "build_phase!", UVM_LOW)
    
    if(!(uvm_config_db #(virtual half_adder_if)::get(this,"*","vif",vif))) begin
      `uvm_error("DRIVER_CLASS","Failed to get VIF from config DB!") 
    end
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS", "connect_phase!", UVM_LOW)
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS", "run_phase!", UVM_LOW)
     reset();
    forever begin
    
      item=half_adder_sequence_item::type_id::create("item");
    
      seq_item_port.get_next_item(item);
      drive(item);
       seq_item_port.item_done();
    end
   
  endtask: run_phase
  
   task reset();
    repeat(2)@(posedge vif.clk)
    vif.ena=1;
    @(posedge vif.clk)
    vif.ena=0;
    endtask
  
  task drive(half_adder_sequence_item item);
    @(posedge vif.clk)
      vif.in_a <= item.in_a;
      vif.in_b <= item.in_b;
      vif.ena  <= item.ena;
      vif.sum  <= item.sum;
      vif.carry <=item.carry;
    
  endtask:drive
  
  
endclass:half_adder_driver