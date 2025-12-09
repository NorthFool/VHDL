library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab is
    Port (
        clk           : in  std_logic;
        reset         : in  std_logic;
        sw_hours      : in std_logic;
        sw_minutes    : in std_logic;
        sw_seconds    : in std_logic;

        set_btn       : in std_logic; 
        number        : out std_logic_vector(41 downto 0)
    );
end lab;

architecture Behavioral of lab is
    signal counter   : integer range 0 to 50_000_000 := 0;
    signal tick_1Hz  : std_logic := '0';

    signal seconds : integer range 0 to 59 := 0;
    signal minutes : integer range 0 to 59 := 0;
    signal hours   : integer range 0 to 23 := 0;

    signal digit1, digit2, digit3, digit4, digit5, digit6 : integer range 0 to 9 := 0;

    signal sw_hours_prev   : std_logic := '0';
    signal sw_minutes_prev : std_logic := '0';
    signal sw_seconds_prev : std_logic := '0';

    function to_seven_segment(digit: integer) return std_logic_vector is
    begin
        case digit is
            when 0 => return "1000000";
            when 1 => return "1111001";
            when 2 => return "0100100";
            when 3 => return "0110000";
            when 4 => return "0011001";
            when 5 => return "0010010";
            when 6 => return "0000010";
            when 7 => return "1111000";
            when 8 => return "0000000";
            when 9 => return "0010000";
            when others => return "1111111";
        end case;
    end function;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '0' then
                counter  <= 0;
                tick_1Hz <= '0';
            elsif counter = 50_000_000-1 then
                counter  <= 0;
                tick_1Hz <= '1';
            else
                counter  <= counter + 1;
                tick_1Hz <= '0';
            end if;
        end if;
    end process;

process(clk)
begin
    if rising_edge(clk) then
        if reset = '0' then
            hours <= 0;

        elsif set_btn = '0' then
         
            if sw_hours = '1' and sw_hours_prev = '0' then
                if hours = 23 then
                    hours <= 0;
                else
                    hours <= hours + 1;
                end if;
            end if;

        elsif set_btn = '1' and tick_1Hz = '1' and minutes = 59 and seconds = 59 then
    
            if hours = 23 then
                hours <= 0;
            else
                hours <= hours + 1;
            end if;
        end if;

   
        sw_hours_prev <= sw_hours;
    end if;
end process;
process(clk)
begin
    if rising_edge(clk) then
        if reset = '0' then
            minutes <= 0;

        elsif set_btn = '0' then
            if sw_minutes = '1' and sw_minutes_prev = '0' then
                if minutes = 59 then
                    minutes <= 0;
                else
                    minutes <= minutes + 1;
                end if;
            end if;

        elsif set_btn = '1' and tick_1Hz = '1' then
            if seconds = 59 then
                if minutes = 59 then
                    minutes <= 0;
                else
                    minutes <= minutes + 1;
                end if;
            end if;
        end if;

        sw_minutes_prev <= sw_minutes;
    end if;
end process;
process(clk)
begin
    if rising_edge(clk) then
        if reset = '0' then
            seconds <= 0;

        elsif set_btn = '0' then
            if sw_seconds = '1' and sw_seconds_prev = '0' then
                if seconds = 59 then
                    seconds <= 0;
                else
                    seconds <= seconds + 1;
                end if;
            end if;

        elsif set_btn = '1' and tick_1Hz = '1' then
            if seconds = 59 then
                seconds <= 0;
            else
                seconds <= seconds + 1;
            end if;
        end if;

        sw_seconds_prev <= sw_seconds;
    end if;
end process;

    digit1 <= hours / 10;
    digit2 <= hours mod 10;
    digit3 <= minutes / 10;
    digit4 <= minutes mod 10;
    digit5 <= seconds / 10;
    digit6 <= seconds mod 10;

    number(6 downto 0)   <= to_seven_segment(digit6);
    number(13 downto 7)  <= to_seven_segment(digit5);
    number(20 downto 14) <= to_seven_segment(digit4);
    number(27 downto 21) <= to_seven_segment(digit3);
    number(34 downto 28) <= to_seven_segment(digit2);
    number(41 downto 35) <= to_seven_segment(digit1);

end Behavioral;
