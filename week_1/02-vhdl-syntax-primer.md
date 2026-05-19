# Week 1 · Module 2 — VHDL Syntax Primer

This is your first real look at VHDL code. Because this may be the first
hardware language you have ever seen, we explain **every part of every
example** instead of assuming anything. Take it slowly. By the end you will be
able to read a basic VHDL file and understand what each line is doing.

There is more here than you can memorize in one sitting — and that is fine.
The goal is *recognition*, not memorization. You will see these patterns
dozens of times.

---

## 1. The big picture: every VHDL design has two halves

Every hardware block you describe in VHDL has exactly two parts:

1. **Entity** — the **interface**. It lists the inputs and outputs (called
   *ports*). Think of it as the **pinout of a chip** — the metal legs sticking
   out, labelled, without saying anything about what's inside.
2. **Architecture** — the **implementation**. This is what the block actually
   *does* internally — the wiring and logic.

A real-world analogy: the **entity** is the outside of a microwave (the door,
the buttons, the power cord — how you interact with it). The **architecture**
is everything inside that makes it actually heat food.

You always write the entity first (define the interface), then the
architecture (define the behaviour).

---

## 2. Library imports — the "include" lines

Almost every VHDL file begins with these lines:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;   -- gives std_logic and std_logic_vector
use IEEE.NUMERIC_STD.ALL;      -- gives unsigned, signed, and arithmetic
```

If you know C, this is similar in spirit to `#include`. You are telling the
tool "I want to use these standard, pre-written definitions."

| Line | What it gives you | Plain meaning |
|---|---|---|
| `library IEEE;` | access to the IEEE standard libraries | "I want to use the official standard stuff" |
| `use IEEE.STD_LOGIC_1164.ALL;` | the `std_logic` and `std_logic_vector` types | the basic wire types |
| `use IEEE.NUMERIC_STD.ALL;` | `unsigned`, `signed`, `+`, `-`, `resize`, `to_integer` | the ability to do math on wires |

You will paste these three lines at the top of basically every file. For now,
just always include them.

> Note: there is an old non-standard library called `std_logic_arith`. We do
> **not** use it in this project. Always use `numeric_std` for arithmetic.

---

## 3. Your first complete VHDL file, explained line by line

Here is a 2-input AND gate — the simplest possible real circuit. We will
dissect **every single line**.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        y : out std_logic
    );
end and_gate;

architecture rtl of and_gate is
begin
    y <= a and b;
end rtl;
```

Now line by line:

- `library IEEE;` and `use IEEE.STD_LOGIC_1164.ALL;` — bring in the standard
  wire type `std_logic` (we don't need `numeric_std` here because there is no
  math).
- `entity and_gate is` — "I am about to define the interface of a block called
  `and_gate`."
- `port ( ... );` — the list of pins.
  - `a : in std_logic;` — a pin named `a`, it is an **input**, and it is a
    single wire (`std_logic`).
  - `b : in std_logic;` — same, another input wire.
  - `y : out std_logic;` — a pin named `y`, an **output**, single wire.
- `end and_gate;` — end of the interface definition.
- `architecture rtl of and_gate is` — "here is the implementation of
  `and_gate`." (`rtl` is just a name; people commonly call architectures
  `rtl` or `behavioral` — the name itself has no special power.)
- `begin` — implementation starts here.
- `y <= a and b;` — **this single line is the entire circuit**. Read it as:
  "continuously drive wire `y` with the logical AND of `a` and `b`." It is
  always active. The moment `a` or `b` changes, `y` updates. There is no
  "when" — it is a permanent piece of wiring.
- `end rtl;` — done.

That's it. That `y <= a and b;` line *is* an AND gate. Sit with how little
code describes real hardware.

---

## 4. Ports: `in`, `out`, `inout`

Every port has a **direction**:

| Direction | Meaning | Everyday picture |
|---|---|---|
| `in` | data flows **into** the block | a microphone (signal comes in) |
| `out` | data flows **out of** the block | a speaker (signal goes out) |
| `inout` | bidirectional — sometimes in, sometimes out | a walkie-talkie / a USB port |

You will use `in` and `out` constantly. `inout` appears later for the CPU's
shared data bus (`dBus`) — ignore it for now, just know it exists.

---

## 5. The two wire types you must know

### `std_logic` — a single wire

One wire, one bit. Its everyday values are `'0'` and `'1'` (note the single
quotes — single bits use single quotes). It can technically hold other values
like `'Z'` (disconnected / high-impedance) and `'X'` (unknown/error), which
matter later.

```vhdl
signal enable : std_logic;
```

### `std_logic_vector` — a bundle of wires (a "bus")

Many wires grouped together, like a ribbon cable. You declare the width with
a range:

```vhdl
signal data : std_logic_vector(7 downto 0);   -- 8 wires: bit 7 down to bit 0
```

`(7 downto 0)` means bit 7 is the leftmost (most significant) and bit 0 the
rightmost (least significant). Multi-bit values use **double** quotes:
`"1010"`.

> **Single bit → single quotes `'1'`. Multi-bit → double quotes `"1010"`.**
> Mixing these up is the most common beginner syntax error. Watch for it.

---

## 6. Writing constant values (literals)

You will need to write fixed values. Here is the cheat sheet:

```vhdl
'0'   '1'              -- a single bit (single quotes)
"1010"                 -- a 4-bit value in binary (double quotes)
x"1A"                  -- a value in hexadecimal: x"1A" = "00011010" (8 bits)
x"1005"                -- 16 bits in hex = "0001 0000 0000 0101"
(others => '0')        -- "every bit is 0", whatever the width is
(others => '1')        -- "every bit is 1"
(others => 'Z')        -- "every bit is disconnected" (used much later)
```

`x"..."` is extremely handy: instead of typing sixteen `0`s and `1`s you
write four hex digits. `x"F"` = `1111`, `x"A"` = `1010`, etc. We will use hex
heavily for the CPU's 16-bit instructions.

`(others => '0')` is a very common idiom meaning "fill the whole thing with
zeros." It saves you from writing `"0000000000000000"`.

---

## 7. Operators you will use

### Logic operators (work on bits / vectors)

```vhdl
and   or   not   xor   nand   nor
```

Example:

```vhdl
y <= (a and b) or (not c);
```

### Concatenation `&` — glue wires together

`&` joins vectors/bits end to end. Super common in the CPU.

```vhdl
result <= "0000" & data;   -- if data is 12 bits, result is now 16 bits
                           -- (four 0s on the left, then data)
```

### Arithmetic `+ - *` — only on numeric types

You **cannot** directly add `std_logic_vector`s (more on this in Week 2). Math
works on `unsigned`/`signed` from `numeric_std`. You will learn the exact
conversion pattern next week; just know addition needs a little ceremony.

### Comparison

```vhdl
=    /=    <    >    <=    >=
```

`/=` means "not equal" (in many languages this is `!=`).

> **A famous gotcha:** `<=` is used for **two completely different things**:
> (1) signal assignment (`y <= a and b;`) and (2) the comparison
> "less-than-or-equal" (`if count <= 10 then`). VHDL figures out which from
> context. It feels confusing for about a day, then becomes invisible.

---

## 8. Concurrent statements vs. processes (a first look)

This connects back to Module 1's "hardware is parallel."

### Concurrent statements — parallel wiring

Statements written directly in the architecture body are **all active at
once**, like independent wires. Order does not matter.

```vhdl
architecture rtl of demo is
begin
    y <= a and b;     -- these three are
    z <= c or  d;     -- all live
    w <= not a;       -- simultaneously
end rtl;
```

This describes three separate gates existing in parallel.

### Processes — a grouped block (preview only)

Sometimes you need statements that are considered together, especially for
clocked memory. That is a **process**. You will use these heavily from Week 2.
A tiny preview so the word isn't scary later:

```vhdl
process (clk)
begin
    if rising_edge(clk) then
        q <= d;        -- q remembers d, updated once per clock tick
    end if;
end process;
```

Do not worry about fully understanding this yet — just recognize the shape.
Module 1's rule applies: stuff inside `rising_edge(clk)` has memory.

---

## 9. A second full example

Module 2's earlier example was an AND gate. Here is a different small circuit
so you see the pattern again on fresh logic: a block that outputs `'1'` only
when input `a` is `1` **and** input `b` is `0` (an "a-but-not-b" detector).

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a_not_b is
    port (
        a : in  std_logic;
        b : in  std_logic;
        y : out std_logic
    );
end a_not_b;

architecture rtl of a_not_b is
begin
    y <= a and (not b);
end rtl;
```

Walk yourself through it without looking at the explanation in section 3 —
can you say what each line does? If yes, this module worked. If not, re-read
section 3; it is the same skeleton.

(You will *not* be asked to build this exact block in the exercises — it is
purely a reading example.)

---

## 10. Recommended outside resources for this module

If the syntax still feels foreign, these teach the **exact same basics**
(entity, architecture, ports, std_logic, simple gates):

- **Nandland (YouTube)** — *"VHDL Tutorial 1/2/3"* — slow, beginner-focused,
  uses the same entity/architecture structure.
- **GeeksforGeeks** — search *"VHDL programming"* / *"Structural modeling in
  VHDL"* — entity/architecture and gate examples with code.

Next: **Module 3 — Toolchain Setup (Quartus)**.
