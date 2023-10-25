----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.10.2023 23:45:00
-- Design Name: 
-- Module Name: control - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port (
    clk, rst : in std_logic;
    init : in std_logic;
    img_number : in std_logic_vector(7 downto 0);
    
    --TO DATAPATH
    starter_address : out std_logic_vector(11 downto 0); --img memory
    
    address_enables : out std_logic_vector(3 downto 0); --[mem, w2, w1, p]
    address_resets : out std_logic_vector(3 downto 0); --[mem, w2, w1, p]
    
    counter_enables : out std_logic_vector(3 downto 0); --[mem, w2, w1, p]
    counter_resets : out std_logic_vector(3 downto 0); --[mem, w2, w1, p]
    
    muxpsel : out std_logic_vector(1 downto 0); --select which 8 bits are read
    muxw2sel : out std_logic_vector(1 downto 0); --same
    
    reg_rst: out std_logic; --global reset
    write_enable: out std_logic_vector(1 downto 0); --[accum_layer2,accum_layer1]
    --FROM DATAPATH
    cp : in std_logic_vector(4 downto 0);
    cw1 : in std_logic_vector(1 downto 0);
    cw2 : in std_logic_vector(2 downto 0);
    cmem : in std_logic_vector(1 downto 0)
    );
end control;


architecture Behavioral of control is
    type fsm_states is (s_init, s_layer1, s_layer2);
    signal curr_state, next_state : fsm_states;
    
begin
    
    
    state_reg : process (clk, rst)
    begin
        if clk'event and clk='1' then
            if rst='1' then
                curr_state <= s_init;
            else
                curr_state <= next_state;
            end if;
        end if;
    end process;
    
    
    comb_reg : process (curr_state, img_number, init)
    begin
        next_state <= curr_state; --base case
        
        case curr_state is 
        when s_init =>
            if init='1' then 
                next_state <= s_layer1;                 
            end if;
            --RESETS EM TUDO, ENABLES A ZERO
        when s_layer1 =>
            
        when s_layer2 =>
        
        end case;
    end process;
    

end Behavioral;
