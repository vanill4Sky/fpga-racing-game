----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:26 04/07/2020 
-- Design Name: 
-- Module Name:    adxl345_driver - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adxl345_driver is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           FIFO_DO : in  STD_LOGIC_VECTOR (7 downto 0);
           FIFO_Empty : in  STD_LOGIC;
           FIFO_Full : in  STD_LOGIC;
			  DataRate : in  STD_LOGIC_VECTOR (3 downto 0);
           Busy : in  STD_LOGIC;
           Go : out  STD_LOGIC;
           FIFO_Push : out  STD_LOGIC;
           FIFO_Pop : out  STD_LOGIC;
           FIFO_DI : out  STD_LOGIC_VECTOR (7 downto 0);
			  ReadCnt : out STD_LOGIC_VECTOR (3 downto 0);
           Address : out  STD_LOGIC_VECTOR (7 downto 0);
           Device_ID : out  STD_LOGIC_VECTOR (7 downto 0);
           X : out  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0);
           Z : out  STD_LOGIC_VECTOR (15 downto 0);
           NewData : out  STD_LOGIC);
end adxl345_driver;

architecture Behavioral of adxl345_driver is

	type state_t is (
		Init, 
		PushAddrID, SendAddrID, BusySendAddrID, ReceiveID, BusyReceiveID, ReadID, PopID, StoreID,
		Stop
	);
	
	signal state : state_t;
	signal next_state: state_t;
	
	signal device_id_register : STD_LOGIC_VECTOR (7 downto 0);

begin
	
	fsm_main : process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				state <= Init;
			else
				state <= next_state;
			end if;
		end if;
	end process fsm_main;
	
	fsm_transition : process(state, Busy)
	begin
		next_state <= state;
		
		case state is
			when Init =>
				next_state <= PushAddrID;
			when PushAddrID =>
				next_state <= SendAddrID;
			when SendAddrID =>
				next_state <= BusySendAddrID;
			when BusySendAddrID =>
				if Busy = '0' then
					next_state <= ReceiveID;
				end if;
			when ReceiveID =>
				next_state <= BusyReceiveID;
			when BusyReceiveID =>
				if Busy = '0' then
					next_state <= ReadID;
				end if;
			when ReadID =>
            next_state <= PopID;
         when PopID =>
            next_state <= StoreID;
         when StoreID =>
            if FIFO_Empty = '1' then
					next_state <= Stop;
            else
					next_state <= ReadID;
				end if;
			when Stop =>
				next_state <= Stop;
		end case;
		
	end process fsm_transition;
	
	read_device_id : process(Clk, state, next_state)
	begin
		if rising_edge(Clk) then
			if state = ReadID then
				device_id_register <= FIFO_DO;
			end if;
		end if;
	end process read_device_id;
	
	FIFO_DI 		<=	X"00" when state = PushAddrID or next_state = PushAddrID else
						X"00";
	FIFO_Push 	<= '1' when state = PushAddrID else
						'0';
	Address 		<= X"3A" when state = SendAddrID or next_state = SendAddrID else
						X"3B" when state = ReceiveID or next_state = ReceiveID else
						X"00";
	Go 			<= '1' when state = SendAddrID or state = ReceiveID else
						'0';
	ReadCnt 		<= X"1" when state = ReceiveID or next_state = ReceiveID else
						X"0";
	FIFO_Pop 	<=	'1' when state = PopID else
						'0';
	NewData 		<= '0';


	Device_ID <= device_id_register;
	X <= X"0000";
	Y <= X"0000";
	Z <= X"0000";
	
end Behavioral;

