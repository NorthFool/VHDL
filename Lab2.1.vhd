library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity AND2 is 
port ( 
A, B : in bit; 
F1   : out bit 
); 
end AND2; 
architecture beh of AND2 is 
begin 
F1 <= A and B; 
end beh; 
entity OR2 is 
port ( 
X, Y : in bit; 
F2   : out bit 
); 
end OR2; 
architecture beh of OR2 is 
begin 
F2 <= X or Y; 
end beh; 
entity comp1 is 
port ( 
x1, x2, x3 : in bit; 
y1        
); 
 : out bit 
end comp1; 
architecture struct of comp1 is 
component AND2 is 
port (A, B : in bit; F1 : out bit); 
end component; 
component OR2 is 
port (X, Y : in bit; F2 : out bit); 
end component; 
signal mid : bit; 
begin 
Gate1 : AND2 port map (A => x1, B => x2, F1 => mid); 
Gate2 : OR2  port map (X => mid, Y => x3, F2 => y1); 
end struct; 
entity caly_uklad is 
port ( 
x1, x2, x3, x4 : in bit; 
y1             
); 
: out bit 
end caly_uklad; 
architecture struct of caly_uklad is 
component comp1 is 
port (x1, x2, x3 : in bit; y1 : out bit); 
end component; 
component OR2 is 
port (X, Y : in bit; F2 : out bit); 
end component; 
signal t1, t2 : bit; 
begin 
U1 : comp1 port map (x1 => x1, x2 => x2, x3 => x3, y1 => t1); 
U2 : comp1 port map (x1 => x2, x2 => x3, x3 => x4, y1 => t2); 
U3 : OR2  port map (X => t1, Y => t2, F2 => y1); 
end struct;
