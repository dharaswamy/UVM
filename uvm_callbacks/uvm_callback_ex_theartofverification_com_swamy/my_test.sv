typedef uvm_callbacks #(my_driver,driver_cb) bus_driver_cbs_t;

class my_test extends uvm_test;
  `uvm_component_utils (my_test)
 
  my_sequencer sqr;
  my_driver    drv;
  my_dri_cb    cb;
 
  function new (string name="my_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
 
    sqr = my_sequencer :: type_id :: create("sqr", this);
    drv = my_driver    :: type_id :: create("drv", this);
    cb  = my_dri_cb    :: type_id :: create("cb");
  endfunction : build_phase
 
  function void connect_phase (uvm_phase phase);
    super.connect_phase (phase);
    drv.seq_item_port.connect (sqr.seq_item_export);
 
  endfunction : connect_phase
 
  task run_phase(uvm_phase phase);
    my_seq seq;
    phase.raise_objection(this);
    #5;
    seq = my_seq::type_id::create ("seq");
    seq.start(sqr);
 
    #50;
    bus_driver_cbs_t::add(drv, cb);
    `uvm_info (get_name(),
               "----------------------Added Callback----------------------",
               UVM_LOW)
    seq = my_seq::type_id::create ("seq");
    seq.start(sqr);
    bus_driver_cbs_t::delete(drv, cb);
    `uvm_info (get_name(),
               "----------------------Deleted Callback--------------------",
               UVM_LOW)
 
    #50;
    seq = my_seq::type_id::create ("seq");
    seq.start(sqr);
    phase.drop_objection(this);
  endtask
endclass
 