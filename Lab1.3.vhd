library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
 
entity LAB_C is 
    Port ( 
        A   : in  STD_LOGIC_VECTOR(3 downto 0); 
        B   : in  STD_LOGIC_VECTOR(3 downto 0); 
        Sel : in  STD_LOGIC_VECTOR(1 downto 0); 
        Y   : out STD_LOGIC_VECTOR(3 downto 0); 
        CarryOut : out STD_LOGIC 
    ); 
end LAB_C; 
 
architecture Behavioral of LAB_C is 
    signal carry : STD_LOGIC_VECTOR(4 downto 0); 
begin 
    process(A, B, Sel) 
        variable tempY : STD_LOGIC_VECTOR(3 downto 0); 
    begin 
        carry(0) <= '0'; 
 
         
        for i in 0 to 3 loop 
            tempY(i) := (A(i) xor B(i)) xor carry(i); 
            carry(i+1) <= (A(i) and B(i)) or (A(i) and carry(i)) or (B(i) and carry(i)); 
        end loop; 
 
        case Sel is 
            when "00" =>   
                Y <= A and B; 
                CarryOut <= '0'; 
            when "01" =>   
                Y <= A or B; 
                CarryOut <= '0'; 
            when "10" =>   
                Y <= A xor B; 
                CarryOut <= '0'; 
            when "11" =>   
                Y <= tempY; 
                CarryOut <= carry(4); 
            when others => 
                Y <= (others => '0'); 
                CarryOut <= '0'; 
        end case; 
    end process; 
end Behavioral;
