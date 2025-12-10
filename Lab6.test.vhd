LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY state_machine IS
    PORT(
        clk      : IN  std_logic;                    
        slider   : IN  std_logic_vector(2 downto 0);
        leds     : OUT std_logic_vector(2 downto 0);
        display  : OUT std_logic_vector(6 downto 0)
    );
END state_machine;

ARCHITECTURE behavior OF state_machine IS

    TYPE State_type IS (RED, YELLOW, GREEN, BLINKING, RED_YELLOW);
    SIGNAL state : State_type := RED;

    SIGNAL blink_led : std_logic := '0';

    CONSTANT CLK_FREQ     : integer := 50000000;    
    CONSTANT BLINK_HALF   : integer := CLK_FREQ / 2; 
    SIGNAL blink_counter  : integer := 0;

BEGIN

    PROCESS(slider)
    BEGIN
        CASE slider IS
            WHEN "000" => state <= RED;
            WHEN "001" => state <= YELLOW;
            WHEN "010" => state <= GREEN;
            WHEN "011" => state <= BLINKING;
            WHEN "100" => state <= RED_YELLOW;
            WHEN OTHERS => state <= RED_YELLOW;
        END CASE;
    END PROCESS;

    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF state = BLINKING THEN
                IF blink_counter = BLINK_HALF THEN
                    blink_counter <= 0;
                    blink_led <= NOT blink_led;
                ELSE
                    blink_counter <= blink_counter + 1;
                END IF;
            ELSE
                blink_counter <= 0;
                blink_led <= '0';
            END IF;
        END IF;
    END PROCESS;

    PROCESS(state, blink_led)
    BEGIN
        CASE state IS

            WHEN RED =>
                leds    <= "100";
                display <= "0000001";

            WHEN YELLOW =>
                leds    <= "010";
                display <= "1001111";

            WHEN GREEN =>
                leds    <= "001";
                display <= "0010010";

            WHEN BLINKING =>
                leds    <= blink_led & blink_led & '0';  -- dwa mrugające LEDy
                display <= "0000110";

            WHEN RED_YELLOW =>
                leds    <= "110";
                display <= "1110001";
        END CASE;
    END PROCESS;

END behavior;
