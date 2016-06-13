library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vga_pixel_gen is
	port(
		reset: in std_logic;
		f_clk: in std_logic; -- 50MHz
		f_on: in std_logic; -- indica a região ativa do frame
		f_row: in std_logic_vector(8 downto 0);
		f_col: in std_logic_vector(9 downto 0);
		r_out: out std_logic_vector(4 downto 0); -- componente R
		g_out: out std_logic_vector(5 downto 0); -- componente G
		b_out: out std_logic_vector(4 downto 0); -- componente B
		rdaddress: out std_logic_vector(14 downto 0); -- mem
		q: in std_logic_vector(15 downto 0)
	);
end entity;

architecture behv of vga_pixel_gen is
	signal h_cmp: std_logic := '0';
	signal v_cmp: std_logic := '0';

	signal rgb_now: std_logic_vector(15 downto 0);
	signal rgb_next: std_logic_vector(15 downto 0);
	
	signal rdaddress_now: std_logic_vector(14 downto 0);
	signal rdaddress_next: std_logic_vector(14 downto 0);
	
begin
	r_out <= rgb_now(15 downto 11);
	g_out <= rgb_now(10 downto 5);
	b_out <= rgb_now(4 downto 0);
	rdaddress <= rdaddress_now;
	
	process(f_clk, reset)
	begin
		if reset = '0' then
			rdaddress_now <= (others => '0');
			rgb_now <= (others => '0');
		elsif rising_edge(f_clk) then
			rdaddress_now <= rdaddress_next;
			rgb_now <= rgb_next;
		end if;
	end process;
	
	h_cmp <= '1' when f_col > 175 else '0';
	v_cmp <= '1' when f_row > 143 else '0';
	
	rdaddress_next <= (others => '0') when v_cmp = '1' else rdaddress_now when h_cmp = '1'  else rdaddress_now + 1;
	rgb_next <= (others => '0') when (h_cmp or v_cmp) = '1' else q;
	
end architecture;