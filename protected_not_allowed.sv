// Accessing a protected variable outside the class ( Not allowed )

class parent_class;
  protected bit [31:0] tmp_addr;
   
  function new(bit [31:0] r_addr);
    tmp_addr = r_addr + 10;
  endfunction
 
  function display();
    $display("tmp_addr = %0d",tmp_addr);
  endfunction
endclass
 
class child_class extends parent_class;
  function new(bit [31:0] r_addr);
    super.new(r_addr);
  endfunction
   
  function void incr_addr();
    tmp_addr++;
  endfunction 
endclass
 
//   module
module encapsulation;
  initial begin
    parent_class p_c = new(5);
    child_class  c_c = new(10);
         
    // variable declared as protected cannot be accessed outside the class
    p_c.tmp_addr = 10;
    p_c.display();
    
    c_c.incr_addr();  //Accessing protected variable in extended class
    c_c.display();
  end
endmodule

// OUTPUT

// Error- Illegal class variable access
// testbench.sv,
// Protected member 'tmp_addr' of class 'parent_class' is not visible to scope 'encapsulation'.
