----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:23:19 05/09/2020 
-- Design Name: 
-- Module Name:    vga_control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_control is
    Port ( Reset : in  STD_LOGIC;
			  Busy : in  STD_LOGIC;
           NewData : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : in  STD_LOGIC_VECTOR (15 downto 0);
           Z : in  STD_LOGIC_VECTOR (15 downto 0);
           Clk : in  STD_LOGIC;
           Char_DI : out  STD_LOGIC_VECTOR (7 downto 0);
           Char_WE : out  STD_LOGIC;
           Home : out  STD_LOGIC;
           NewLine : out  STD_LOGIC;
           Goto00 : out  STD_LOGIC;
           CursorOn : out  STD_LOGIC;
           ScrollEn : out  STD_LOGIC;
           ScrollClear : out  STD_LOGIC);
end vga_control;

architecture Behavioral of vga_control is

	type state_t is (
		init,
		busy_wait,
		store_id_nibble, convert_id_nibble, write_id_char, fetch_id_nibble, check_id_nibble, inc_id,
		store_data_nibble, convert_data_nibble, write_data_char, fetch_data_nibble, check_data_nibble,
		break_line
	);
	
	constant SET_CURSORON 		: std_logic := '1';
	constant SET_SCROLLEN 		: std_logic := '0';
	constant SET_SCROLLCLEAR 	: std_logic := '0';

	signal state, next_state: state_t;
	
	signal measurements_cnt : integer range 0 to 2**12 - 1 := 15;
	signal measurements_cnt_vector : std_logic_vector(11 downto 0);
	signal char_count : integer range 0 to 15 := 0;
	signal end_of_data : std_logic := '0';
	signal current_data_nibble : std_logic_vector(3 downto 0);
	signal current_character : std_logic_vector(7 downto 0);	
	
begin

	fsm_main : process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				state <= init;
			else
				state <= next_state;
			end if;
		end if;
	end process fsm_main;
	
	fsm_transition : process(state, NewData, end_of_data)
	begin
		next_state <= state;
		
		case state is
			when init =>
				next_state <= busy_wait;
			when busy_wait =>
				if NewData = '1' then
					next_state <= store_id_nibble;
				end if;
			when store_id_nibble =>
				next_state <= convert_id_nibble;
			when convert_id_nibble =>
				next_state <= write_id_char;
			when write_id_char =>
				next_state <= fetch_id_nibble;
			when fetch_id_nibble =>
				next_state <= check_id_nibble;
			when check_id_nibble =>
				if end_of_data = '1' then
					next_state <= inc_id;
				else
					next_state <= store_id_nibble;
				end if;
			when inc_id =>
				next_state <= store_data_nibble;
			when store_data_nibble =>
				next_state <= convert_data_nibble;
			when convert_data_nibble =>
				next_state <= write_data_char;
			when write_data_char => 
				next_state <= fetch_data_nibble;
			when fetch_data_nibble => 
				next_state <= check_data_nibble;
			when check_data_nibble =>
				if end_of_data = '1' then
					next_state <= break_line;
				else
					next_state <= store_data_nibble;
				end if;
			when break_line =>
				next_state <= busy_wait;
		end case;
	end process fsm_transition;
	
	measurements_cnt_vector <= std_logic_vector(to_unsigned(measurements_cnt, measurements_cnt_vector'length));
	
	store_nibble : process(Clk, state, next_state)
	begin
		if rising_edge(Clk) then
			if state = store_id_nibble then
				case char_count is
					when 0 =>
						current_data_nibble <= measurements_cnt_vector(11 downto 8);
					when 1 =>
						current_data_nibble <= measurements_cnt_vector(7 downto 4);
					when 2 =>
						current_data_nibble <= measurements_cnt_vector(3 downto 0);
					when others =>
						current_data_nibble <= X"0";
				end case;
			elsif state = store_data_nibble then
				case char_count is
					when 0 =>
						current_data_nibble <= X(15 downto 12);
					when 1 =>
						current_data_nibble <= X(11 downto 8);
					when 2 =>
						current_data_nibble <= X(7 downto 4);
					when 3 =>
						current_data_nibble <= X(3 downto 0);
					when 4 =>
						current_data_nibble <= Y(15 downto 12);
					when 5 =>
						current_data_nibble <= Y(11 downto 8);
					when 6 =>
						current_data_nibble <= Y(7 downto 4);
					when 7 =>
						current_data_nibble <= Y(3 downto 0);
					when 8 =>
						current_data_nibble <= Z(15 downto 12);
					when 9 =>
						current_data_nibble <= Z(11 downto 8);
					when 10 =>
						current_data_nibble <= Z(7 downto 4);
					when 11 =>
						current_data_nibble <= Z(3 downto 0);
					when others =>
						current_data_nibble <= X"0";
				end case;
			end if;
		end if;
	end process store_nibble;
	
	convert_hex_to_char : process(Clk, state, next_state)
	begin
		if rising_edge(Clk) then
			if state = convert_id_nibble or state = convert_data_nibble then
				if to_integer(unsigned(current_data_nibble)) < 10 then
					current_character <= X"3" & current_data_nibble;
				else
					current_character <= std_logic_vector(X"37" + unsigned(current_data_nibble));
				end if;
			end if;
		end if;
	end process convert_hex_to_char;
	
	count_character : process(Clk, state, next_state)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				char_count <= 0;
			end if;
			if state = fetch_id_nibble then
				if char_count = 2 then
					char_count <= 0;
					end_of_data <= '1';
				else
					char_count <= char_count + 1;
					end_of_data <= '0';
				end if;
			elsif state = fetch_data_nibble then
				if char_count = 11 then
					char_count <= 0;
					end_of_data <= '1';
				else
					char_count <= char_count + 1;
					end_of_data <= '0';
				end if;	
			end if;
		end if;
	end process count_character;
	
	increment_measurements_cnt : process(Clk, state, next_state)
	begin
		if rising_edge(Clk) then
			if state = inc_id then
				measurements_cnt <= measurements_cnt + 1;
			end if;
		end if;
	end process increment_measurements_cnt;

	CursorOn 		<=	SET_CURSORON;
	ScrollEn 		<=	SET_SCROLLEN;
	ScrollClear 	<=	SET_SCROLLCLEAR;
	
	Char_DI			<= current_character when state = write_id_char or state = write_data_char else
							"00000000";
	
	Char_WE 			<= '1' when state = write_id_char or state = write_data_char else
							'0';
	
	Home				<= '0';
	
	Goto00			<= '1' when state = init else
							'0';
	
	NewLine			<= '1' when state = break_line else
							'0';
	

end Behavioral;















