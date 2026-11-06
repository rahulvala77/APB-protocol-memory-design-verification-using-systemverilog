class apb_read_test_zerowait extends generator;


 function new(mailbox gdmbx);
   super.new(gdmbx);
 endfunction

task run();
  tr=new();
  for(int i=1; i<=10; i++)begin
    if(i==1)begin
      tr.randomize() with {tr.paddr==32'h20; tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==2)begin
      tr.randomize() with {tr.paddr==25;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==3)begin
      tr.randomize() with {tr.paddr==30;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==4)begin
      tr.randomize() with {tr.paddr==35;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==5)begin
      tr.randomize() with { tr.paddr==40;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==6)begin
      tr.randomize() with {tr.paddr==40; tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==7)begin
      tr.randomize() with {tr.paddr==45;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==8)begin
      tr.randomize() with {tr.paddr==50;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==9)begin
      tr.randomize() with {tr.paddr==55;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end
    if(i==10)begin
      tr.randomize() with {tr.paddr==60;tr.pwrite==0;};
      gdmbx.put(tr); tr.print("GEN");
      @ev;
    end

   end
 endtask
endclass
