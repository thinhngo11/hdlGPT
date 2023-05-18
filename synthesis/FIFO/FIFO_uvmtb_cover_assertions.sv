1. Empty FIFO:

```verilog
cover property (@(posedge clk) disable iff (reset) fifo_empty |-> (read_ptr == write_ptr));
```

2. Full FIFO:

```verilog
cover property (@(posedge clk) disable iff (reset) fifo_full |-> (write_ptr == ($past(read_ptr) - 1) % FIFO_DEPTH));
```

3. Writing to FIFO:

```verilog
cover property (@(posedge clk) disable iff (reset) !fifo_full && write_enable |-> (write_ptr == $past(write_ptr + 1) % FIFO_DEPTH));
```

4. Reading from FIFO:

```verilog
cover property (@(posedge clk) disable iff (reset) !fifo_empty && read_enable |-> (read_ptr == $past(read_ptr + 1) % FIFO_DEPTH));
```

5. Write followed by read:

```verilog
cover property (@(posedge clk) disable iff (reset) !fifo_full && write_enable ##1 !fifo_empty && read_enable);
```

6. Read followed by write:

```verilog
cover property (@(posedge clk) disable iff (reset) !fifo_empty && read_enable ##1 !fifo_full && write_enable);
