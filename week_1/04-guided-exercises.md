# Week 1 · Module 4 — Guided Exercises

Now you build things with your own hands. But read this intro first — it sets
expectations so you don't feel lost.

## What this week's exercises are really for

The circuits this week (XOR, a 2:1 mux, a half adder) are *deliberately
simple*. You are **not** being tested on clever logic. The real skills you are
practising are:

- reading and writing the **entity / architecture** structure,
- **connecting** small blocks together to make bigger ones (this is exactly
  how the CPU is built later),
- running a **simulation** and **reading the waveform**,
- getting comfortable with the **Quartus + ModelSim workflow**.

For the first few exercises you will **not** write full testbenches yourself —
working testbenches are provided. You focus only on the logic and the
workflow. You will learn to write testbenches in Modules 5 and 6, once the
simulator feels natural. This is intentional: learning hardware logic and
testbench syntax at the same time overwhelms beginners.

> Mantra for the week: *"think in blocks, watch the waveform."* Syntax fluency
> comes from repetition over the next weeks — not from this one module.

---

## How to approach every exercise (a repeatable recipe)

1. **Draw it first** on paper. Boxes for blocks, lines for wires. Even for a
   3-gate circuit, drawing it prevents most mistakes.
2. **Write the entity** (the pins: what goes in, what comes out).
3. **Write the architecture** (the internal wiring/logic).
4. **Compile** in Quartus, fix any red errors (re-read Module 2/3 if stuck).
5. **Run the provided testbench** in ModelSim.
6. **Inspect the waveform** and check it against the truth table you expect.
7. Only then look at any reference solution — *after* your own attempt.

Following this same loop every time builds the habit you will rely on for the
whole project.

---

## A brief refresher: how to combine blocks (you'll need this)

Several exercises ask you to build something out of smaller given gates. The
mechanism for "use a block inside another block" is **instantiation**. A quick
illustrative example (this is **not** one of your exercises — it just shows
the technique):

Suppose you have an `and_gate` and an `or_gate` already, and you want a block
`demo` computing `y = (a AND b) OR c`:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demo is
    port ( a, b, c : in std_logic;
           y       : out std_logic );
end demo;

architecture rtl of demo is
    signal and_out : std_logic;          -- an internal wire
begin
    -- use (instantiate) the existing and_gate block:
    g1 : entity work.and_gate
        port map ( a => a, b => b, y => and_out );

    -- use the existing or_gate block:
    g2 : entity work.or_gate
        port map ( a => and_out, b => c, y => y );
end rtl;
```

Key ideas to notice:

- `signal and_out : std_logic;` — an **internal wire** to connect one block's
  output to the next block's input. Internal wires are declared *between*
  `architecture ... is` and `begin`.
- `g1 : entity work.and_gate` — `g1` is just a label (any name). `work` means
  "the current project's compiled library."
- `port map ( a => a, b => b, y => and_out )` — connect the block's pins
  (left of `=>`) to your wires (right of `=>`).

You will use exactly this pattern to build XOR-from-gates and the mux. Refer
back here whenever the wiring syntax is fuzzy.

---

## Provided starter library

You are given these basic components plus working testbenches for each:

- `and_gate`
- `or_gate`
- `not_gate`
- `xor_gate`
- `nand_gate`

Your job across the exercises: instantiate and connect these, simulate,
inspect waveforms, and build intuition for composing hardware from small
blocks.

---

## Exercise 1 — Build XOR from basic gates

Using only `and_gate`, `or_gate`, and `not_gate`, build:

```
entity name: xor_structural
inputs:  a, b
output:  y
```

Hint to think about (don't skip the thinking): XOR is "a or b, but not both."
One classic structure is `y = (a AND (not b)) OR ((not a) AND b)`. You will
need internal signals for the intermediate results — see the instantiation
refresher above.

A working testbench is provided.

**Your tasks:** draw it, build it, compile, simulate, inspect the waveform,
and verify it matches the XOR truth table (`y=1` only when `a` and `b`
differ).

---

## Exercise 2 — Build a 2:1 multiplexer

Using the starter gates, build:

```
entity name: mux2
inputs:  a, b, sel
output:  y
```

Behaviour: when `sel = '0'`, `y` follows `a`; when `sel = '1'`, `y` follows
`b`. (A multiplexer is just a selectable switch — `sel` chooses which input
gets through.)

Think about how to express "pick a or b based on sel" using AND/OR/NOT. A
testbench is provided.

**Focus while simulating:** watch how a change on `sel` re-routes the output,
and how signals propagate through the connected gates in the waveform.

---

## Exercise 3 — Half adder

Build a half adder using XOR and AND:

```
entity name: half_adder
inputs:  a, b
outputs: sum, carry
```

Recall from Module 1/2 thinking: `sum = a XOR b`, `carry = a AND b`. A
reference waveform is provided to check against.

---

## Exercise 4 — Modify a testbench (gentle introduction)

Open one of the provided testbenches and experiment:

- add a couple more input combinations,
- change the `wait for 10 ns;` delays to different values,
- re-run and watch how the waveform changes.

You are **not** expected to understand all testbench syntax yet — Modules 5
and 6 teach that properly. This is just a low-pressure first contact with
stimulus and simulation time.

---

## What to show in the Week 1 check-in

- Your **XOR-from-gates** and **2:1 mux**, compiling and simulating, with a
  waveform screenshot showing correct behaviour.

You do **not** need perfect or elegant VHDL this week. You need to *think in
hardware blocks* and be comfortable simulating. That's the whole goal.

---

## Recommended outside resources for this module

If composing blocks from gates is confusing, these show the exact technique
(structural VHDL / instantiation / `port map`):

**Videos:**

- Search YouTube: `VHDL structural modeling port map beginner` — pick a short
  video that builds, e.g., a half adder or mux from gate instances.
- **Nandland** — structural VHDL / "how to connect modules" tutorials.

**Reading:**

- **GeeksforGeeks** — "Structural modeling in VHDL" and "Half Adder" /
  "Multiplexer" articles (clear truth tables + diagrams).
- **tutorialspoint VHDL** — sections on structural style and `port map`.
- **VHDLwhiz.com** — "How to instantiate a component / use entity work" —
  beginner-friendly with copyable code.

> Search tip: the keyword that finds the right content is **"structural"**
> (as opposed to "behavioral"). Structural = building from connected
> sub-blocks, which is exactly Exercises 1–3.

---

## Common pitfalls

- Forgetting to declare an **internal signal** before using it to connect two
  blocks (declare it between `architecture ... is` and `begin`).
- `port map` connections in the wrong order or with mismatched names — the
  pin name (left of `=>`) must exactly match the sub-block's port.
- Single vs. double quotes again (`'0'` for one bit).
- Trying to "understand every line of the testbench" — that's Modules 5–6,
  not now. Let it be a black box for these exercises.
- Skipping the paper sketch. Draw first. It really does prevent most bugs.

Next: **Module 5 — Understanding Testbenches**.
