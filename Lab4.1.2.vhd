library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity comb_F_behavioral is 
Port ( A : in  STD_LOGIC; 
B : in  STD_LOGIC; 
C : in  STD_LOGIC; 
F : out STD_LOGIC); 
end comb_F_behavioral; 
architecture behavioral of comb_F_behavioral is 
begin 
process(A, B, C) 
begin 
if ( (not A and B) = '1' ) then 
F <= '1'; 
elsif ( (A and C) = '1' ) then 
F <= '1'; 
else 
F <= '0'; 
end if; 
end process; 
end behavioral;
