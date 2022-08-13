// An abstract class can only be derived, creating an object of a virtual class leads to a compilation error.

// Instantiating virtual class

//abstract class
virtual class packet;
  bit [31:0] addr;
endclass
module virtual_class;
  initial begin
    packet p;
    p = new();
  end
endmodule

// OUTPUT

// virtual_class, "p = new();"
// Instantiation of the object 'p' can not be done because its type 'packet' is an abstract base class.
// Perhaps there is a derived class that should be used.

// Deriving virtual class

//abstract class
virtual class packet;
  bit [31:0] addr;
endclass
  
class extended_packet extends packet;
  function void display;
    $display("Value of addr is %0d", addr);
  endfunction
endclass
  
module virtual_class;
  initial begin
    extended_packet p;
    p = new();
    p.addr = 10;
    p.display();
  end
endmodule

// OUTPUT

// Value of addr is 10