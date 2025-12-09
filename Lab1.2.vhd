library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity LAB_B is 
Port ( 
A : in  STD_LOGIC;   
B : in  STD_LOGIC;   
Sel : in STD_LOGIC;  
Y : out STD_LOGIC    
); 
end LAB_B; 
architecture Behavioral of LAB_B is 
begin 
process(A, B, Sel) 
begin 
if Sel = '0' then 
Y <= A; 
else 
Y <= B; 
end if; 
end process; 
end Behavioral;
