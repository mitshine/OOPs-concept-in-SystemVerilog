// Accessing a protected variable in the extended class ( allowed )

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
    child_class  c_c = new(10);
     
    c_c.incr_addr();  //Accessing protected variable in extended class
    c_c.display();
  end
endmodule

// OUTPUT

// Addr = 21