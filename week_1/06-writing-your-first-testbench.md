# Week 1 · Module 6 — Writing Your First Testbench

In Module 5 you learned to *read* a testbench. Now you write one yourself,
slowly, building it up piece by piece. We go one small step at a time, and we
fully work a complete example *different* from your exercise so you have a
model to follow without copying.

---

## The plan

You will write a testbench for the **`or_gate`** (a 2-input OR gate, part of
your starter library). We build it in five small steps, compiling along the
way. Then there's a fully worked example for a *different* gate (a NOT gate)
so you can see the whole process end to end on something you are *not*
submitting.

Remember the three ingredients from Module 5: an empty entity, signals + DUT,
and a stimulus process.

---

## Step 1 — The empty shell

Start with just the skeleton. It does nothing yet, but it should compile.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_or_gate is
end tb_or_gate;

architecture sim of tb_or_gate is
begin
end sim;
```

Compile it. Getting an empty testbench to compile confirms your project setup
is sane before you add complexity. (It won't simulate to anything useful yet —
that's expected.)

---

## Step 2 — Declare the connecting signals

The testbench needs internal wires to connect to the OR gate's ports
(`a`, `b`, `y`). Declare them **between `architecture ... is` and `begin`**:

```vhdl
architecture sim of tb_or_gate is

    signal a, b, y : std_logic;

begin
end sim;
```

Why here? Anything declared between `is` and `begin` is a local declaration —
internal wires, in this case. This is the same place you declared internal
signals in Module 4's instantiation example.

---

## Step 3 — Instantiate the DUT

Now place a copy of the design and wire it to your signals:

```vhdl
begin

    uut : entity work.or_gate
        port map (
            a => a,
            b => b,
            y => y
        );

end sim;
```

- `uut` — label for "Unit Under Test."
- `entity work.or_gate` — the `or_gate` compiled in this project.
- `port map (...)` — connect the gate's pins (left) to your testbench signals
  (right).

Compile again. If `or_gate` is in the project, this should be clean.

---

## Step 4 — Add the stimulus process

This is the part that actually *does* something — it drives the inputs through
every combination over time:

```vhdl
    stimulus : process
    begin
        a <= '0'; b <= '0';
        wait for 10 ns;

        a <= '0'; b <= '1';
        wait for 10 ns;

        a <= '1'; b <= '0';
        wait for 10 ns;

        a <= '1'; b <= '1';
        wait for 10 ns;

        wait;          -- stop forever; don't loop
    end process;
```

For an OR gate you expect `y = 1` in every case **except** `0,0`. You will
verify that in the waveform.

---

## Step 5 — The complete file

Putting it all together:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_or_gate is
end tb_or_gate;

architecture sim of tb_or_gate is

    signal a, b, y : std_logic;

begin

    uut : entity work.or_gate
        port map (
            a => a,
            b => b,
            y => y
        );

    stimulus : process
    begin
        a <= '0'; b <= '0';
        wait for 10 ns;

        a <= '0'; b <= '1';
        wait for 10 ns;

        a <= '1'; b <= '0';
        wait for 10 ns;

        a <= '1'; b <= '1';
        wait for 10 ns;

        wait;
    end process;

end sim;
```

Compile, run RTL simulation, open the waveform, and check: is `y` low only at
the very first step (`0,0`) and high for the other three? If yes — you just
wrote and verified your first testbench. That is a real milestone.

## Your exercise

Write testbenches **yourself** for:

- the **XOR gate**,
- the **NAND gate**,
- the **half adder** (remember it has two outputs, `sum` and `carry` — your
  signal list and `port map` must include both).

For each: think about how many inputs/cases there are, write the testbench
using the five-step skeleton, simulate, inspect the waveform, and verify the
truth table.

> The half adder is the interesting one: two inputs (4 combinations) and
> **two** outputs. Make sure you declare signals for `sum` and `carry` and
> connect both in the `port map`. Check both outputs in the waveform.

That completes Week 1. You now understand hardware thinking, basic VHDL
syntax, the toolchain, how to build small circuits from blocks, and how to
write and run a testbench. Everything from Week 2 onward builds directly on
these foundations. Make sure all six modules genuinely click before moving on
— the ramp gets steeper, but it's climbable if this base is solid.
