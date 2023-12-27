class half_adder_base_sequence extends uvm_sequence;
  `uvm_object_utils(half_adder_base_sequence)
  
   half_adder_sequence_item reset_pkt;
  
  function new(string name = "half_adder_base_sequence");
     super.new(name);
    `uvm_info("BASE_SEQUENCE", "Inside constructor!", UVM_LOW)
  endfunction: new
  
      task body();
    `uvm_info("BASE_SEQUENCE", "Inside body task!", UVM_LOW)
 reset_pkt=half_adder_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    assert(reset_pkt.randomize()) else begin
      `uvm_error("BASE_SEQUENCE","randomization fail")
    end;
    
    finish_item(reset_pkt);
  endtask: body
  endclass:half_adder_base_sequence




class half_adder_test_sequence extends half_adder_base_sequence;
  
  `uvm_object_utils( half_adder_test_sequence)
   
  
   half_adder_sequence_item item;
  
  function new(string name = " half_adder_test_sequence");
    super.new(name);
    `uvm_info("TST_SEQUENCE", "Inside constructor!", UVM_LOW)
  endfunction: new
  
  task body();
    `uvm_info("TST_SEQUENCE", "Inside body task!", UVM_LOW)
    
    item= half_adder_sequence_item :: type_id :: create ("item");
    start_item(item);
    assert(item.randomize())else begin
      `uvm_error("TST_SEQUENCE","randomization fail" )
    end;
   
    finish_item(item);
  endtask: body
   
endclass:half_adder_test_sequence
