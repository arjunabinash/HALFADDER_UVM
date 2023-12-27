class half_adder_scoreboard extends uvm_test;
  `uvm_component_utils(half_adder_scoreboard)
  
  uvm_analysis_imp #(half_adder_sequence_item, half_adder_scoreboard) scoreboard_port;
  
  half_adder_sequence_item transactions[$];
  
  function new(string name = "half_adder_scoreboard",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SCOREBOARD_CLASS", "Inside constructor!", UVM_LOW)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "build_phase!", UVM_LOW)
    
    scoreboard_port = new("scoreboard_port",this);
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "connect_phase!", UVM_LOW)
  endfunction: connect_phase
  
 
  function void write(half_adder_sequence_item item);
    transactions.push_back(item);
  endfunction:write
  
 
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_LOW)
    
   forever begin
      half_adder_sequence_item curr_trans;
      wait((transactions.size()!=0));
      curr_trans=transactions.pop_front();
      compare(curr_trans);
    end
    
  endtask: run_phase
  
  task compare(half_adder_sequence_item curr_trans);
    logic  expected_sum;
    logic  expected_carry;
    logic  actual_sum;
    logic  actual_carry;
    
    expected_sum = curr_trans.in_a ^ curr_trans.in_b;
    expected_carry= curr_trans.in_a & curr_trans.in_b;;
    
    
    actual_sum = curr_trans.sum;
    actual_carry= curr_trans.carry;
    
    if((actual_sum != expected_sum) & (actual_carry != expected_carry)) begin
      `uvm_error(get_type_name(),$sformatf("[compare]trasaction failed! actual_sum=%d actual_carry=%d expected_sum=%d expected_carry=%d ",actual_sum,actual_carry,expected_sum,expected_carry))
    end
    else begin
      `uvm_info(get_type_name(), $sformatf("[compare] trasaction passed! actual_sum=%d actual_carry=%d expected_sum=%d expected_carry=%d ",actual_sum,actual_carry,expected_sum,expected_carry), UVM_LOW)
    end
  endtask:compare
  
endclass:half_adder_scoreboard