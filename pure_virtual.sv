Pure Virtual Methods:

A virtual method inside an abstract class can be declared with the keyword pure and is called a pure virtual method. Such methods only require a prototype to be specified within the abstract class and the implementation is left to defined within the sub-classes.

Pure Method Example:

virtual class BaseClass;
  int data;
  pure virtual function int getData();
endclass

class ChildClass extends BaseClass;
  virtual function int getData();
    data = 32'hcafe_cafe;
    return data;
  endfunction
endclass

module tb;
  ChildClass child;
  initial begin
    child = new();
    $display("data = 0x%0h", child.getData());
  end
endmodule

The pure virtual method prototype and its implementation should have the same arguments and return type.

Simulation Log Output:

ncsim> run
data = 0xcafecafe
ncsim: *W,RNQUIE: Simulation is complete.

