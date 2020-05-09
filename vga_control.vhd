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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_control is
    Port ( Busy : in  STD_LOGIC;
           NACK : in  STD_LOGIC;
           NewData : in  STD_LOGIC;
           Device_ID : in  STD_LOGIC_VECTOR (7 downto 0);
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
		send_line1_char1, send_line1_char2, send_line1_char3, send_line1_char4, send_newline1,
		send_line2_char1, send_line2_char2, send_line2_char3, send_line2_char4, send_newline2,
		send_line3_char1, send_line3_char2, send_line3_char3, send_line3_char4, send_newline3
	);
	
	constant SET_CURSORON 		: std_logic := '0';
	constant SET_SCROLLEN 		: std_logic := '1';
	constant SET_SCROLLCLEAR 	: std_logic := '1';

	signal state, next_state: state_t;
	
	signal data_register : STD_LOGIC_VECTOR (7 downto 0);
	signal char_value : integer;
	
begin

	--TODO trzeba cos zrobic by na poczatku modul jednokrotnie wszedl w stan init
	fsm_main : process(Clk)
	begin
		if rising_edge(Clk) then
			state <= next_state;
		end if;
	end process fsm_main;
	
	fsm_transition : process(state, Busy, NewData)
	begin
		next_state <= state;
		
		case state is
		-- send lines to vga_txt
			when init =>
				next_state <= send_line1_char1;
			-- line 1
			when send_line1_char1 =>
				next_state <= send_line1_char2;
			when send_line1_char2 =>
				next_state <= send_line1_char3;
			when send_line1_char3 =>
				next_state <= send_line1_char4;
			when send_line1_char4 =>
				next_state <= send_newline1;
			when send_newline1 =>
				if Busy = '0' then
					next_state <= send_line2_char1;
				end if;
			-- line 2
			when send_line2_char1 =>
				next_state <= send_line1_char2;
			when send_line2_char2 =>
				next_state <= send_line1_char3;
			when send_line2_char3 =>
				next_state <= send_line1_char4;
			when send_line2_char4 =>
				next_state <= send_newline2;
			when send_newline2 =>
				if Busy = '0' then
					next_state <= send_line3_char1;
				end if;
			-- line 3
			when send_line3_char1 =>
				next_state <= send_line1_char2;
			when send_line3_char2 =>
				next_state <= send_line1_char3;
			when send_line3_char3 =>
				next_state <= send_line1_char4;
			when send_line3_char4 =>
				next_state <= send_newline3;
			when send_newline3 =>
				if Busy = '0' and NewData = '1' then
					next_state <= send_line1_char1;
				end if;
		end case;
	end process fsm_transition;
	
	store_data : process(Clk, state)
	begin
		if rising_edge(Clk) then
			case state is
			--line 1
				when send_line1_char1 =>
					char_value <= to_integer(unsigned( X(15 downto 12) ));
				when send_line1_char2 =>
					char_value <= to_integer(unsigned( X(11 downto 8) ));
				when send_line1_char3 =>
					char_value <= to_integer(unsigned( X(7 downto 4) ));
				when send_line1_char4 =>
					char_value <= to_integer(unsigned( X(4 downto 0) ));
			-- line 2
				when send_line2_char1 =>
					char_value <= to_integer(unsigned( Y(15 downto 12) ));
				when send_line2_char2 =>
					char_value <= to_integer(unsigned( Y(11 downto 8) ));
				when send_line2_char3 =>
					char_value <= to_integer(unsigned( Y(7 downto 4) ));
				when send_line2_char4 =>
					char_value <= to_integer(unsigned( Y(4 downto 0) ));
			-- line 3
				when send_line3_char1 =>
					char_value <= to_integer(unsigned( Z(15 downto 12) ));
				when send_line3_char2 =>
					char_value <= to_integer(unsigned( Z(11 downto 8) ));
				when send_line3_char3 =>
					char_value <= to_integer(unsigned( Z(7 downto 4) ));
				when send_line3_char4 =>
					char_value <= to_integer(unsigned( Z(4 downto 0) ));
			end case;
			
			if char_value <= 9 then
				char_value <= char_value + 48;	--liczba + kod ascii dla '0'
			elsif char_value > 9 then
				char_value <= char_value + 65;	--liczba + kod ascii dla 'A'
			end if;
			data_register <= std_logic_vector(to_unsigned(char_value, data_register'length));
		end if;
	end process store_data;
	

	CursorOn 		<=	SET_CURSORON when state = init;
	ScrollEn 		<=	SET_SCROLLEN when state = init;
	ScrollClear 	<=	SET_SCROLLCLEAR when state = init;
	
	Char_DI			<= data_register when state = send_line1_char1 or state = send_line1_char2 or state = send_line1_char3 or state = send_line1_char4 or
													 state = send_line2_char1 or state = send_line2_char2 or state = send_line2_char3 or state = send_line2_char4 or
													 state = send_line3_char1 or state = send_line3_char2 or state = send_line3_char3 or state = send_line3_char4;
	
	Char_WE 			<= '1' when state = send_line1_char1 or state = send_line1_char2 or state = send_line1_char3 or state = send_line1_char4 or
										state = send_line2_char1 or state = send_line2_char2 or state = send_line2_char3 or state = send_line2_char4 or
										state = send_line3_char1 or state = send_line3_char2 or state = send_line3_char3 or state = send_line3_char4 else
							'0';	-- trzeba wyslac impuls, jesli vga_txt reaguje na rising eage, a nie na wartosc '1', to rozwiazanie to nie zadziala, bo nie wroci do '0' miedzy stanami
									-- i trzeba bedzie to zmienic
	
	NewLine			<= '1' when state = send_newline1 or state = send_newline2 or state = send_newline3 else
							'0';
	

end Behavioral;















