library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity comb_F_dataflow is 
Port ( A : in  STD_LOGIC; 
B : in  STD_LOGIC; 
C : in  STD_LOGIC; 
F : out STD_LOGIC); 
end comb_F_dataflow; 
architecture dataflow of comb_F_dataflow is 
begin -- F = (not A and B) or (A and C) 
F <= (not A and B) or (A and C); 
end dataflow;
