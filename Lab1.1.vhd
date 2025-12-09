library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity LAB_A is 
Port ( 
A : in  STD_LOGIC; 
B : in  STD_LOGIC; 
Y : out STD_LOGIC 
); 
end LAB_A; 
architecture Behavioral of LAB_A is 
begin 
process(A, B) 
begin 
if (A = '1' and B = '0') then 
Y <= '1'; 
elsif (A = '0' and B = '1') then 
Y <= '1'; 
else 
Y <= '0'; 
end if; 
end process; 
end Behavioral;
