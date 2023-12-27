class half_adder_sequence_item extends uvm_sequence_item;
  
  `uvm_object_utils(half_adder_sequence_item)
  
  rand bit in_a;
  rand bit in_b;
  bit ena;
  bit sum;
  bit carry;
 
  constraint data_c{in_a dist {0:/ 50 , 1:/50};
                   in_b dist {0:/ 50 , 1:/50};}
  
  function new(string name = "half_adder_sequence_item");
    super.new(name);
  endfunction: new
  
endclass:half_adder_sequence_item