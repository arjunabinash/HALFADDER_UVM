class half_adder_test extends uvm_test;
  `uvm_component_utils(half_adder_test)
  
  half_adder_env env;
  half_adder_base_sequence base_sequence;
  half_adder_test_sequence test_sequence; 
  
  
  
  function new(string name = "half_adder_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("TEST_CLASS", "Inside constructor!", UVM_LOW)
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "build_phase!", UVM_LOW)
    
    env= half_adder_env :: type_id :: create ("env",this);
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "connect_phase!", UVM_LOW)
  endfunction: connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST_CLASS", "run_phase!", UVM_LOW)
    
    phase.raise_objection(this);
    
    base_sequence= half_adder_base_sequence::type_id::create(" base_sequence");
    base_sequence.start(env.agnt.sqncr);
    #5;
    
      repeat(100) begin
    test_sequence= half_adder_test_sequence::type_id::create("test_sequence");
    test_sequence.start(env.agnt.sqncr);
      #5;
    end
   
    phase.drop_objection(this);
  endtask: run_phase
  
  
endclass:half_adder_test