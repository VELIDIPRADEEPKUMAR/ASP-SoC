-------------------------------------------------------------------------------
-- Title       : Signal Delay Left and Right
-- Author      : Michael Wurm <michael.wurm@students.fh-hagenberg.at>
-------------------------------------------------------------------------------
-- Description : Testing registers and function of unit
-------------------------------------------------------------------------------

entity tbDelay is
end entity tbDelay;

architecture bhv of tbDelay is
    ---------------------------------------------------------------------------
    -- Constants
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- Signals
    ---------------------------------------------------------------------------

begin

    ---------------------------------------------------------------------------
    -- Signal assignments
    ---------------------------------------------------------------------------
    Clk <= not Clk after 10 ns;

    ---------------------------------------------------------------------------
    -- Instantiations
    ---------------------------------------------------------------------------

end architecture bhv;
