library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity Comparator4bit is 
Port ( 
A  : in  STD_LOGIC_VECTOR(3 downto 0); 
B  : in  STD_LOGIC_VECTOR(3 downto 0); 
GT : out STD_LOGIC; 
EQ : out STD_LOGIC; 
LT : out STD_LOGIC 
); 
end Comparator4bit; 
architecture Structural of Comparator4bit is 
signal gt_s, eq_s, lt_s : STD_LOGIC_VECTOR(3 downto 0); 
begin -- Bit 3 (MSB) 
gt_s(3) <= A(3) and not B(3); 
lt_s(3) <= not A(3) and B(3); 
eq_s(3) <= not(A(3) xor B(3)); -- Bit 2 
gt_s(2) <= (A(2) and not B(2)) or (eq_s(3) and gt_s(3)); 
lt_s(2) <= (not A(2) and B(2)) or (eq_s(3) and lt_s(3)); 
eq_s(2) <= eq_s(3) and not(A(2) xor B(2)); -- Bit 1 
gt_s(1) <= (A(1) and not B(1)) or (eq_s(2) and gt_s(2)); 
lt_s(1) <= (not A(1) and B(1)) or (eq_s(2) and lt_s(2)); 
eq_s(1) <= eq_s(2) and not(A(1) xor B(1)); -- Bit 0 (LSB) 
gt_s(0) <= (A(0) and not B(0)) or (eq_s(1) and gt_s(1)); 
lt_s(0) <= (not A(0) and B(0)) or (eq_s(1) and lt_s(1)); 
eq_s(0) <= eq_s(1) and not(A(0) xor B(0)); -- Wyjścia końcowe 
GT <= gt_s(0); 
LT <= lt_s(0); 
EQ <= eq_s(0); 
end Structural;
