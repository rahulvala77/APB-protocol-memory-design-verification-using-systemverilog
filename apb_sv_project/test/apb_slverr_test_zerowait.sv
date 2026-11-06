class apb_slverr_test_zerowait extends generator;


 function new(mailbox gdmbx);
   super.new(gdmbx);
 endfunction

task run();
  tr=new();
  for(int i=1; i<=2; i++)begin
    if(i==1)begin
      tr.randomize() with {tr.paddr==32'hFFFF_FFFF; tr.pwrite==1;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==2)begin
      tr.randomize() with {tr.paddr==32'hFFFF_FFFF;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
   
   end
 endtask
endclass
