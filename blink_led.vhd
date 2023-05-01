library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blink_led is
    port(
        clk : in std_logic;
        led : buffer std_logic
    );
end entity;

architecture main of blink_led is
    signal counter : unsigned(32 downto 0) := (others => '0');
    signal one_second : unsigned(32 downto 0) := to_unsigned(50000000, 33);
    signal two_seconds : unsigned(32 downto 0) := to_unsigned(100000000, 33);
    signal three_seconds : unsigned(32 downto 0) := to_unsigned(150000000, 33);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if counter = one_second then
                counter <= (others => '0');
                led <= not led;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
end main;