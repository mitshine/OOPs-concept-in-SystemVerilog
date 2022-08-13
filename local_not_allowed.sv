// Accessing local variable outside the class ( Not allowed )

class parent_class;
  local bit [31:0] tmp_addr;
   
  function new(bit [31:0] r_addr);
    tmp_addr = r_addr + 10;
  endfunction
 
  function display();
    $display("tmp_addr = %0d",tmp_addr);
  endfunction
endclass
 
 
//   module
module encapsulation;
  initial begin
    parent_class p_c = new(5);
        
    p_c.tmp_addr = 20;  //Accessing local variable outside the class
    p_c.display();
  end
endmodule

// OUTPUT

// Error- Illegal class variable access
// testbench.sv,
// Local member 'tmp_addr' of class 'parent_class' is not visible to scope 'encapsulation'.

