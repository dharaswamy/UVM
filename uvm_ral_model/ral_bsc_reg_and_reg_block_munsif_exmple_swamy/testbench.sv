// ( swamy ) please copy the code but don't change/modify the code here.



 `include "uvm_macros.svh"					// will give an access to uvm macros
 import uvm_pkg::*;							// will give an access to uvm pkg(to all uvm classes)
 


// ------------------- register class ---------------------




class reg0 extends uvm_reg;

	`uvm_object_utils(reg0)				// as part of RAL all class are objects

	rand uvm_reg_field  f0;				// all field of reg, here only 1 field
	
	
	function new(input string name = "reg0");
      super.new(name, 8, UVM_NO_COVERAGE);	// 8 -> width of reg, & no seperate coverage for it
	endfunction: new


	// build method for fields creation and configuration method for configuration information for register

	virtual function void build();

      f0   = uvm_reg_field::type_id::create("f0");	
		
		f0.configure(					// by name
          
				.parent(this), 			// current class	
        	 	.size(8), 				// width
				.lsb_pos(0), 			// lsb postion
				.access("RW"), 			// type of an access	
				.volatile(0), 			// volatile -> 1 means field can't change between consecutive access		
				.reset(0), 				// reset value(power on reset value for field)
				.has_reset(1), 			// field support reset
				.is_rand(1),			// field can be randomize
				.individually_accessible(1)	// field is individually accessible 

				); 						// 9 arguments // psl avr hii


	endfunction: build

endclass: reg0





// ----------------------- register block ---------------------





class reg_blk extends uvm_reg_block;


	`uvm_object_utils(reg_blk)

	
	rand reg0  reg0_h;					// instances for all registers
	


	
	function new(input string name = "reg_blk");
		super.new(name, UVM_NO_COVERAGE);
	endfunction: new


	virtual function void build();

		reg0_h = reg0::type_id::create("reg0_h");
		reg0_h.build();							// calling the build method of reg0
		reg0_h.configure(this);					// configure instance of reg0, this -> parent i.e here reg_blk



		// adding address map for all registers, using create_map with 4 arguments

      default_map = create_map("default_map", 0, 1, UVM_LITTLE_ENDIAN);	// instance, base_address, size in byte(i.e 1*8 = 8), endian
															// UVM_LITTLE_ENDIAN -> Least-significant bytes first in consecutive addresses
		
		// adding register to map using add_reg method with 3 arguments
	
		default_map.add_reg(reg0_h, 'h0, "RW");				// instance of register, offset addr, access, generally here "RW"
	


		lock_model();										// mandatory to lock the model
															// Lock a model and build the address map.(it will build the map)
	endfunction: build
										// Once locked, no further structural changes, such as adding registers or memories, can be made.
										// It is not possible to unlock a model.

endclass: reg_blk



// --------------- tb top ---------------


module top_tb();


	reg_blk  reg_blk_h;					// instance for reg block

	initial begin: B1
		
		//reg_blk_h = new("reg_blk_h");
      reg_blk_h = reg_blk::type_id::create("reg_blk_h");
		reg_blk_h.build();				// calling a build method of reg block
      reg_blk_h.print();
	end: B1
  
 
endmodule: top_tb