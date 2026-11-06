/* Module Name: Monitor class
   Explanation: This file is responsible to collect data from interface as per protocol, and creating packet then send the packet to scoreboard.
*/
class monitor;
  mailbox msmbx;
  virtual apb_interface vif;
  apb_transaction tr;

  function new(mailbox msmbx,virtual apb_interface vif);
    this.msmbx=msmbx;
    this.vif=vif;
  endfunction  

  task run();
    tr=new();
    forever begin
      @(vif.mcb)begin
        if(vif.mcb.psel && !vif.mcb.penable)begin
          @(vif.mcb);
          if(vif.mcb.psel && vif.mcb.penable)begin
             if(!$test$plusargs("zerowaitstate")) wait(vif.mcb.pready);
             tr.psel   = vif.psel;
             tr.penable= vif.penable;
             tr.pwrite = vif.pwrite;
             tr.pwdata = vif.pwdata;
             tr.paddr  = vif.paddr;
             tr.prdata = vif.prdata;
             tr.pready = vif.pready;
             tr.pslverr= vif.pslverr;
          tr.print("MON");
          end
          msmbx.put(tr);
        end
      end
    end
  endtask
endclass
