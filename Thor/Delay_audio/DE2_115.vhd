--- CÓDIGO PADRÃO PARA A PLACA DE2_115 IMPLEMENTADO POR EDSON MANOEL DA SILVA
--- AS IMPLEMENTAÇOES DE ALGUNS BLOCOS DE CONTROLE DOS COMPONENETES SECUNDÁRIOS SÃO BASEADOS NO PROJETO
--- D:\Edson\Quartus\PLACA_DE2_115\DE2_115_demonstrations\DE2_115_Default

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY DE2_115 IS
	PORT
		(
		--//////////// CLOCK //////////
			CLOCK_50 : IN STD_LOGIC;
			CLOCK2_50: IN STD_LOGIC;
			CLOCK3_50: IN STD_LOGIC;
		--//////////// Sma //////////
			SMA_CLKIN : IN STD_LOGIC;
			SMA_CLKOUT: OUT STD_LOGIC;
		--//////////// LED //////////
			LEDG	   : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
			LEDR	   : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		--//////////// KEY //////////
			KEY		   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		--//////////// EX_IO //////////
			EX_IO	   : inout STD_LOGIC_VECTOR(6 DOWNTO 0);
		--////////// GPIO  //////////
			GPIO	: out std_LOGIC;
		--//////////// SW //////////
			SW		   : IN	STD_LOGIC_VECTOR(17 DOWNTO 0);

		--//////////// SEG7 //////////
			HEX0	   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1	   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX2	   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3	   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4	   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX5	   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX6	   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX7	   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		--//////////// LCD //////////
			LCD_BLON	: OUT STD_LOGIC;
			LCD_DATA	: inout STD_LOGIC_VECTOR(7 DOWNTO 0);
			LCD_EN 		: OUT STD_LOGIC;
			LCD_ON		: OUT STD_LOGIC;
			LCD_RS		: OUT STD_LOGIC;
			LCD_RW		: OUT STD_LOGIC;
			
		--//////////// RS232 //////////
			UART_CTS	: OUT STD_LOGIC;
			UART_RTS	: IN  STD_LOGIC;
			UART_RXD	: IN  STD_LOGIC;
			UART_TXD	: OUT STD_LOGIC;
		--//////////// PS2 for Keyboard and Mouse //////////
			PS2_CLK		: inout STD_LOGIC;
			PS2_CLK2	: inout STD_LOGIC;
			PS2_DAT 	: inout STD_LOGIC;
			PS2_DAT2 	: inout STD_LOGIC;
		--//////////// SDCARD //////////
			SD_CLK		: OUT	STD_LOGIC;
			SD_CMD		: inout STD_LOGIC;
			SD_DAT		: inout STD_LOGIC_VECTOR(3 DOWNTO 0);
			SD_WP_N		: IN 	STD_LOGIC;
		--//////////// VGA //////////
			VGA_B		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			VGA_BLANK_N	: OUT STD_LOGIC;
			VGA_CLK		: OUT STD_LOGIC;
			VGA_G		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			VGA_HS		: OUT STD_LOGIC;
			VGA_R		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			VGA_SYNC_N	: OUT STD_LOGIC;
			VGA_VS		: OUT STD_LOGIC;

		--//////////// Audio //////////
			AUD_ADCDAT	: IN STD_LOGIC;
			AUD_ADCLRCK	: inout STD_LOGIC;
			AUD_BCLK	: inout STD_LOGIC;
			AUD_DACDAT	: OUT STD_LOGIC;
			AUD_DACLRCK	: inout STD_LOGIC;
			AUD_XCK		: OUT STD_LOGIC;

		--//////////// I2C for EEPROM //////////
			EEP_I2C_SCLK: OUT STD_LOGIC;
			EEP_I2C_SDAT: inout STD_LOGIC;

		--//////////// I2C for Audio Tv-Decoder  //////////
			I2C_SCLK	: OUT STD_LOGIC;
			I2C_SDAT 	: inout STD_LOGIC;

		--//////////// Ethernet 0 //////////
			ENET0_GTX_CLK: OUT STD_LOGIC;
			ENET0_INT_N	 : IN  STD_LOGIC;
			ENET0_LINK100: IN  STD_LOGIC;
			ENET0_MDC	 : OUT STD_LOGIC;
			ENET0_MDIO	 : inout STD_LOGIC;
			ENET0_RST_N	 : OUT	STD_LOGIC;
			ENET0_RX_CLK : IN STD_LOGIC;
			ENET0_RX_COL : IN STD_LOGIC;
			ENET0_RX_CRS : IN STD_LOGIC;
			ENET0_RX_DATA: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			ENET0_RX_DV	 : IN STD_LOGIC;
			ENET0_RX_ER	 : IN STD_LOGIC;
			ENET0_TX_CLK : IN STD_LOGIC;
			ENET0_TX_DATA: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			ENET0_TX_EN	 : OUT STD_LOGIC;
			ENET0_TX_ER	 : OUT STD_LOGIC;
			ENETCLK_25	 : IN STD_LOGIC;

		--//////////// Ethernet 1 //////////
			ENET1_GTX_CLK: OUT STD_LOGIC;
			ENET1_INT_N	 : IN  STD_LOGIC;
			ENET1_LINK100: IN  STD_LOGIC;
			ENET1_MDC	 : OUT STD_LOGIC;
			ENET1_MDIO	 : inout STD_LOGIC;
			ENET1_RST_N	 : OUT STD_LOGIC;
			ENET1_RX_CLK : IN STD_LOGIC;
			ENET1_RX_COL : IN STD_LOGIC;
			ENET1_RX_CRS : IN STD_LOGIC;
			ENET1_RX_DATA: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			ENET1_RX_DV	 : IN STD_LOGIC;
			ENET1_RX_ER	 : IN STD_LOGIC;
			ENET1_TX_CLK : IN STD_LOGIC;
			ENET1_TX_DATA: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			ENET1_TX_EN	 : OUT STD_LOGIC;
			ENET1_TX_ER	 : OUT STD_LOGIC;

		--//////////// TV Decoder //////////
			TD_CLK27	: IN STD_LOGIC;
			TD_DATA		: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			TD_HS		: IN STD_LOGIC;
			TD_RESET_N	: OUT STD_LOGIC;
			TD_VS		: IN STD_LOGIC;

		--//////////// USB 2.0 OTG //////////
			OTG_ADDR	: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			OTG_CS_N	: OUT STD_LOGIC;
			OTG_DACK_N	: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			OTG_DATA	: inout STD_LOGIC_VECTOR(15 DOWNTO 0);
			OTG_DREQ	: IN STD_LOGIC_VECTOR(1 DOWNTO 0);	
			OTG_FSPEED	: inout STD_LOGIC;
			OTG_INT		: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			OTG_LSPEED	: inout STD_LOGIC;
			OTG_RD_N	: OUT STD_LOGIC;
			OTG_RST_N	: OUT STD_LOGIC;
			OTG_WE_N	: OUT STD_LOGIC;

		--//////////// IR Receiver //////////
			IRDA_RXD	: IN STD_LOGIC;

		--//////////// SDRAM //////////
			DRAM_ADDR	: OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
			DRAM_BA		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);	
			DRAM_CAS_N	: OUT STD_LOGIC;
			DRAM_CKE	: OUT STD_LOGIC;
			DRAM_CLK	: OUT STD_LOGIC;
			DRAM_CS_N	: OUT STD_LOGIC;
			DRAM_DQ		: inout STD_LOGIC_VECTOR(31 DOWNTO 0);
			DRAM_DQM	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			DRAM_RAS_N	: OUT STD_LOGIC;
			DRAM_WE_N	: OUT STD_LOGIC;

		--//////////// SRAM //////////
			SRAM_ADDR	: OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
			SRAM_CE_N	: OUT STD_LOGIC;
			SRAM_DQ		: inout STD_LOGIC_VECTOR(15 DOWNTO 0);
			SRAM_LB_N   : OUT STD_LOGIC;
			SRAM_OE_N	: OUT STD_LOGIC;
			SRAM_UB_N	: OUT STD_LOGIC;
			SRAM_WE_N	: OUT STD_LOGIC;

		--//////////// Flash //////////
			FL_ADDR		: OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
			FL_CE_N		: OUT STD_LOGIC;
			FL_DQ		: inout STD_LOGIC_VECTOR(7 DOWNTO 0);
			FL_OE_N		: OUT STD_LOGIC;
			FL_RST_N	: OUT STD_LOGIC;
			FL_RY		: IN STD_LOGIC;
			FL_WE_N		: OUT STD_LOGIC;
			FL_WP_N		: OUT STD_LOGIC
		);
END ENTITY;


ARCHITECTURE FUNCIONAMENTO OF DE2_115 IS

COMPONENT DISPLAY7SEG
	PORT
	(
		iDIG		:	 IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		oSEG		:	 OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT TESTE_LCD
	PORT
		(
		--//	Host Side
		iCLK,iRST_N : IN STD_LOGIC;
		--//	LCD Side
		LCD_DATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)	;
		LCD_RW,LCD_EN,LCD_RS : OUT STD_LOGIC
		);
END COMPONENT;

COMPONENT RESET_DELAY
	PORT
	(
		iCLK		:	 IN STD_LOGIC;
		oRESET		:	 OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT audio_codec_controller
	PORT
	(
		RESET				:	 IN STD_LOGIC;
		CLOCK				:	 IN STD_LOGIC;
		i2cClock20KHz		:	 IN STD_LOGIC;
		SCL					:	 OUT STD_LOGIC;
		SDA					:	 INOUT STD_LOGIC;
		dacLIN				:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		dacRIN				:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		adcLOUT				:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		adcROUT				:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		adcData				:	 IN STD_LOGIC;
		dacData				:	 OUT STD_LOGIC;
		RL_DATA_OUT_VALID	:	 OUT STD_LOGIC;
		audioClock			:	 IN STD_LOGIC;
		adcLRSelect			:	 OUT STD_LOGIC;
		dacLRSelect			:	 OUT STD_LOGIC;
		dacLRSelect_ACK		:	 OUT STD_LOGIC
	);
END COMPONENT;

component PLL1
	PORT
	(
		inclk0	: IN STD_LOGIC  := '0'; -- 50 MHZ
		c0		: OUT STD_LOGIC 		-- 18.433180 MHZ
	);
end component;


component PLL2
	PORT
	(
		inclk0	: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC 
	);
end component;

component FIFO_test IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (25 DOWNTO 0);
		rdreq		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (25 DOWNTO 0);
		usedw		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
END component;

--------------------------------------- DECLARAÇÃO DE SINAIS -------------------------------
SIGNAL UNIDADE : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DEZENA  : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LCD_ON_1: STD_LOGIC;
SIGNAL LCD_BLON_1:STD_LOGIC;
SIGNAL LCD_D_1 : STD_LOGIC_VECTOR(7 DOWNTO 0) ;
SIGNAL LCD_RW_1: STD_LOGIC;
SIGNAL LCD_EN_1: STD_LOGIC;
SIGNAL LCD_RS_1: STD_LOGIC;
SIGNAL RST : STD_LOGIC;
SIGNAL SCL_SIG,AUDIO_CLOCK_SIG,CLOCK_50_DELAY,I2C_CLOCK20khz,RL_DATA_OUT_VALID_SIG : STD_LOGIC := '0';
SIGNAL adcLRC,adcdat,dacLRC,dacDat : STD_LOGIC := '0';
SIGNAL dacLIN_SIG,dacRIN_SIG,adcLOUT_SIG,adcROUT_SIG : STD_LOGIC_VECTOR(15 DOWNTO 0);


SIGNAL out_left_int : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL out_right_int : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL out_o : STD_LOGIC;

Signal Enb_read: std_logic:='0';
Signal fifo_empty,fifo_full,Enb_write: std_logic;
Signal in_fifo,in_codec: std_logic_vector(25 downto 0);
Signal FIFO_read:std_logic:='0';

Signal DelayLeft,DelayRight,Leftin_codec,Rightin_codec: std_logic_vector(15 downto 0);
Signal counter: std_logic_vector(16 downto 0);

Constant Delay: integer := 100000; -- Máx 131072
Constant atenuacao: integer := 4;
--------------------------------------------------------------------------------------------

BEGIN

--------------------------------------- INSTANCIAÇÃO DE COMPONENETES -----------------------

	
INST_DISP0:DISPLAY7SEG
	PORT MAP
		(
			iDIG => UNIDADE(3 DOWNTO 0),
			oSEG => HEX0		
		);


INST_DISP1:DISPLAY7SEG
	PORT MAP
		(
			iDIG => DEZENA(3 DOWNTO 0),
			oSEG => HEX1		
		);

INST_DISP2:DISPLAY7SEG
	PORT MAP
		(
			iDIG => X"0",
			oSEG => HEX2		
		);

INST_DISP3:DISPLAY7SEG
	PORT MAP
		(
			iDIG => X"0",
			oSEG => HEX3		
		);

INST_DISP4:DISPLAY7SEG
	PORT MAP
		(
			iDIG => X"0",
			oSEG => HEX4		
		);
		
INST_DISP5:DISPLAY7SEG
	PORT MAP
		(
			iDIG => X"0",
			oSEG => HEX5		
		);
		
INST_DISP6:DISPLAY7SEG
	PORT MAP
		(
			iDIG => X"0",
			oSEG => HEX6		
		);
		
INST_DISP7:DISPLAY7SEG
	PORT MAP
		(
			iDIG => X"0",
			oSEG => HEX7		
		);

INST_TESTE_LCD:TESTE_LCD
	PORT MAP
	(
		--//	Host Side
		iCLK 	 => CLOCK_50,
		iRST_N	 => SW(17),--RST,
		--//	LCD Side
		LCD_DATA => LCD_D_1,
		LCD_RW	 => LCD_RW_1,
		LCD_EN	 => LCD_EN_1,
		LCD_RS	 => LCD_RS_1	
	);

INST_DELAY_RESET:RESET_DELAY
	PORT MAP	
	(
		iCLK	=> CLOCK_50, 
		oRESET	=> RST   
	);

PLL1_inst : PLL1 
	PORT MAP 
	(
		inclk0	 => CLOCK_50,        -- 50 MHZ
		c0	 	 => AUDIO_CLOCK_SIG  -- 12 MHZ
	);
	
PLL2_inst : PLL2 
	PORT MAP
	(
		inclk0	 => CLOCK_50,
		c0	 	 => I2C_CLOCK20khz
	);	
	
AUDIO_CODEC_INST : AUDIO_CODEC_CONTROLLER	
	PORT MAP
	(
		RESET			=> RST,--SW(17),
		CLOCK			=> CLOCK_50,
		i2cClock20KHz	=> I2C_CLOCK20khz,
		SCL				=> SCL_SIG,
		SDA				=> I2C_SDAT,
		dacLIN			=> in_codec(25) & in_codec(25) & in_codec(25) & in_codec(25 downto 13),
		dacRIN			=> in_codec(12) & in_codec(12) & in_codec(12) & in_codec(12 downto 0),
		adcLOUT			=> adcLOUT_SIG,
		adcROUT			=> adcROUT_SIG,
		adcData			=> adcDat,
		dacData			=> dacDat,
		RL_DATA_OUT_VALID	=>	 RL_DATA_OUT_VALID_SIG,
		audioClock		=> AUDIO_CLOCK_SIG,
		adcLRSelect		=> adcLRC,
		dacLRSelect		=> dacLRC,
		dacLRSelect_ACK	=> open
	);
--	

-------------------------------------------------------------------------------------------

	process(AUDIO_CLOCK_SIG)
	begin
		if rising_edge(AUDIO_CLOCK_SIG) then
			if RST = '0' then
				FIFO_read <= '0';
				Enb_read <= '0';
				Enb_write <= '0';
				
			elsif RL_DATA_OUT_VALID_SIG = '1' then -- Tem dados validos para a placa
					
					Enb_write <= SW(0);
					
					if fifo_full = '1' then
							FIFO_read <= '1';
					elsif fifo_empty = '1' then
							FIFO_read <= '0';
					end if;

					if FIFO_read = '1' then
						Enb_read <= '1';
					else
						Enb_read <= '0';
					end if;
			else
					Enb_write <= '0';
					Enb_read <= '0';
			end if;
		end if;
	end process;
	
MemFIFO: FIFO_test port map
	(
		clock		=> AUDIO_CLOCK_SIG,
		data		=> dacLIN_SIG(15 downto 3) & dacRIN_SIG(15 downto 3),
		rdreq		=> Enb_read,
		wrreq		=> Enb_write,
		empty		=> fifo_empty,
		full		=> fifo_full,
		q		=> in_codec,
		usedw		=> counter
	);

LEDR(0) <= fifo_full;
LEDR(1) <= fifo_empty;	
	
LCD_DATA <= LCD_D_1;
LCD_RW   <= LCD_RW_1;
LCD_EN   <= LCD_EN_1;
LCD_RS   <= LCD_RS_1; 
LCD_ON   <= '1';
LCD_BLON <= '0'; --//not supported;

-- send out the clocks
I2C_SCLK <= SCL_SIG;
AUD_BCLK <= NOT(AUDIO_CLOCK_SIG);
AUD_XCK  <= NOT(AUDIO_CLOCK_SIG);


-- output assignments
AUD_ADCLRCK <= adcLRC;
AUD_DACLRCK <= dacLRC;


--EX_IO(0) <= NOT(AUDIO_CLOCK_SIG);
--EX_IO(1) <= AUD_ADCDAT;
--EX_IO(2) <= dacDat;
--EX_IO(3) <= RL_DATA_OUT_VALID_SIG;
--EX_IO(4) <= dacLRC;


	PROCESS(CLOCK_50, RST)
	BEGIN
		IF (RST) = '0' THEN
			adcDat <= '0';
			AUD_DACDAT <= '0';
			dacLIN_SIG <= (OTHERS => '0');
			dacRIN_SIG <= (OTHERS => '0');
		ELSIF (RISING_EDGE(CLOCK_50)) THEN
		-- output from adc
			adcDat <= AUD_ADCDAT;
		-- input of dac
			AUD_DACDAT  <= dacDat;
		--- BYPASS ----
			dacLIN_SIG <= adcLOUT_SIG;
			dacRIN_SIG <= adcROUT_SIG;
--			dacLIN_SIG <= out_left_int;
--			dacRIN_SIG <= out_right_int;
		---------------
		END IF;
	END PROCESS;



 	PROCESS(CLOCK_50,SW(17))
	VARIABLE i : INTEGER := 0;
	BEGIN
		IF SW(17) = '0' THEN
			LEDG <= (OTHERS => '1');
			LEDR(17 downto 2) <= (OTHERS => '0');
			UNIDADE <= (OTHERS => '0');
			DEZENA  <= (OTHERS => '0');
		ELSIF RISING_EDGE(CLOCK_50) THEN
			
			IF(i < 50000000) THEN -- PARA DAR 1 SEGUNDO
				i := i+1;
			ELSIF(UNIDADE < X"0009") THEN
				i := 0;
				UNIDADE <= UNIDADE + '1';
			ELSIF(DEZENA < X"0009") THEN
				i:= 0;
				UNIDADE <= (OTHERS => '0');
				DEZENA  <= DEZENA + '1';
			ELSE
				i:= 0;
				UNIDADE <= (OTHERS => '0');
				DEZENA  <= (OTHERS => '0');
			END IF;
			
			LEDG <= (OTHERS => '0');
			LEDR(17 downto 2) <= SW(17 downto 2);
		END IF;
	END PROCESS;



END ARCHITECTURE;