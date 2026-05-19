# Week 1 · Module 5 — Understanding Testbenches

So far you have *described* hardware. Now you need to *test* it. This module
explains what a testbench is, why it exists, and how to read one — in much
more depth than "here is the code," because for a first-timer the testbench is
often more confusing than the design itself.

No new exercises here — this is a reading/understanding module. Module 6 is
where you write one yourself.

---

## 1. What is a testbench, really?

Imagine you built a small electronic gadget. To check it works, you'd connect
a power supply, flip its switches in different combinations, and watch its
LEDs. You would not solder the gadget into a final product before testing it.

A **testbench** is that test setup, but in software/simulation:

- it **provides inputs** to your design (flips the switches),
- it lets you **observe outputs** (watch the LEDs, via the waveform),
- it lets you **verify** the design behaves correctly.

Crucial point: a testbench is **only for simulation**. It is **never turned
into real hardware**. It is throwaway scaffolding — like the scaffolding
around a building under construction. This is why testbenches are allowed to
use "non-hardware" tricks like `wait for 10 ns;` that would make no sense in
a real circuit.

> **Design file = the thing you build. Testbench = the virtual lab bench you
> test it on.**

---

## 2. Why can't I just "run" my design?

Beginners often ask: "Why do I need a separate file? Can't I just run the AND
gate?"

No — because a design like `and_gate` has **inputs** (`a`, `b`). On its own,
nothing is driving those inputs, so there is nothing to simulate. The
testbench's job is to *be the thing that drives the inputs* and to give the
simulation something to do over time. Without a testbench, the simulator has
no stimulus and produces a flat, empty waveform.

---

## 3. The three ingredients of every testbench

Every basic testbench has exactly three parts. Learn this skeleton; it never
really changes.

1. **An (empty) entity** — a testbench has **no ports**, because nothing is
   outside it. It is the whole experiment.
2. **Signals** — internal wires that connect the testbench to your design.
3. **A DUT instantiation** — a copy of your design ("Design Under Test")
   wired to those signals.
4. **A stimulus process** — the part that changes the inputs over time.

(That's "three" conceptually: empty entity, the DUT + its wires, and the
stimulus. People count it slightly differently — don't worry about the
number, learn the shape.)

---

## 4. A full testbench, dissected line by line

Here is a complete testbench for the AND gate. Every line is explained.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and_gate is
end tb_and_gate;

architecture sim of tb_and_gate is

    signal a, b, y : std_logic;

begin

    uut : entity work.and_gate
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

        wait;            -- stop here forever
    end process;

end sim;
```

Now the dissection:

- `library IEEE; use IEEE.STD_LOGIC_1164.ALL;` — same standard imports as
  always.
- `entity tb_and_gate is end tb_and_gate;` — the testbench's entity. Notice
  there is **no `port (...)`**. A testbench has no inputs or outputs because
  it *is* the whole sealed experiment. (`tb_` is just a naming convention for
  "testbench.")
- `architecture sim of tb_and_gate is` — the implementation. `sim` is just a
  name (people use `sim`, `behav`, `tb`...).
- `signal a, b, y : std_logic;` — three internal wires. These will connect to
  the AND gate's `a`, `b`, `y`. They are how the testbench "holds the
  controls."
- `begin` — implementation starts.
- `uut : entity work.and_gate` — create one instance of your design.
  - `uut` = "Unit Under Test" (a label; could be any name).
  - `entity work.and_gate` = "use the `and_gate` we compiled into this
    project (`work`)."
- `port map ( a => a, b => b, y => y )` — wire the design's pins to the
  testbench signals. Left of `=>` is the **design's port name**; right of
  `=>` is the **testbench's signal**. Here they share names, which is allowed
  and common, but they are still two different things being connected.
- `stimulus : process begin ... end process;` — the **stimulus process**:
  the script that drives the inputs over time.
  - `a <= '0'; b <= '0';` — set both inputs low.
  - `wait for 10 ns;` — hold these values for 10 nanoseconds of *simulation
    time*, so you can see the result in the waveform.
  - …repeat for every input combination (this tests the full truth table:
    00, 01, 10, 11)…
  - `wait;` — a bare `wait` with nothing after it means "pause this process
    **forever**." This stops the test from looping back to the top. Without
    it, the process restarts endlessly and your waveform repeats forever.
- `end sim;` — done.

If you understand this one file, you understand 90% of every testbench you'll
write this whole project.

---

## 5. Simulation time is *not* real time

`wait for 10 ns;` does **not** make your computer pause for 10 nanoseconds.
Simulation uses a *virtual clock*. "10 ns" is just a label on the waveform's
time axis so you can space events apart and see them clearly. The simulation
might compute those "10 ns" in a microsecond of real time, or take a second —
real wall-clock time is unrelated.

Think of it like a movie timeline: "10 ns later" is a position on the film
strip, not how long you waited to watch it.

Why space things out at all? So that in the waveform you can clearly see
"inputs were 0,0 *here*, then 0,1 *there*" instead of everything piled on top
of each other at time zero.

---

## 6. The `wait` family (you'll see these a lot)

| Statement | Meaning |
|---|---|
| `wait for 10 ns;` | advance simulation time by 10 ns, then continue |
| `wait;` | stop this process permanently (used at the end of stimulus) |
| `wait until rising_edge(clk);` | pause until the next clock rising edge (used in clocked testbenches, later weeks) |

For Week 1 you mostly use `wait for ... ns;` and a final `wait;`.

---

## 7. Why `uut` / `DUT`?

It's just terminology. **DUT** = "Device/Design Under Test", **UUT** = "Unit
Under Test". They mean the same thing: *the design you are currently testing*.
You'll see both in textbooks and online. We label the instance `uut` by
convention so anyone reading the testbench instantly knows "that's the thing
being tested."

---

## 8. The beginner workflow (memorize this loop)

For **every** design from now on:

1. Compile the **design** file.
2. Compile the **testbench** file.
3. Run the **simulation** (RTL Simulation in Quartus → ModelSim).
4. **Inspect the waveform** — do the outputs match what you expect from the
   truth table / behaviour?
5. If not, **debug**: look at which signal is wrong and when, fix the design
   (or the testbench), repeat.

This 5-step loop is the rhythm of the entire project. By Week 8 you will have
done it hundreds of times.

---

## 9. Recommended outside resources for this module

Testbenches confuse almost every beginner — a video where someone writes and
runs one is extremely helpful:

- **Nandland (YouTube)** — *"How to make a VHDL testbench"* — clear and aimed
  at newcomers.
- **GeeksforGeeks** — search *"VHDL Test Bench"* for a written walkthrough
  with simple examples.

> Search tip: include the words **"testbench"** and **"beginner"**, and prefer
> examples that test a basic gate (not a CPU or UART — too advanced for now).

Next: **Module 6 — Writing Your First Testbench**.
