library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity mux8to1_select is 
Port ( 
D : in  STD_LOGIC_VECTOR(7 downto 0); 
SEL : in STD_LOGIC_VECTOR(2 downto 0); 
Y : out STD_LOGIC 
); 
end mux8to1_select; 
architecture Behavioral of mux8to1_select is 
begin 
with SEL select 
Y <= D(0) when "000", 
D(1) when "001", 
D(2) when "002", 
D(3) when "011", 
D(4) when "100", 
D(5) when "101", 
D(6) when "110", 
D(7) when "111", 
'0'  when others; 
end Behavioral;
