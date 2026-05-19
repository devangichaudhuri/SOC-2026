# Week 1 · Module 1 — Thinking in Hardware

Welcome. This is very likely your first time seeing VHDL, so we are going to
go slowly. Do **not** rush this module. It contains no code you have to write
— instead it rewires *how you think*, and that mental shift is the single most
important thing in the entire project. People who skip this struggle for
weeks; people who absorb it find everything afterwards much easier.

Read it once, take a break, then read it again.

---

## 1. What even is VHDL?

VHDL stands for **VHSIC Hardware Description Language** (VHSIC = "Very High
Speed Integrated Circuit"). The key words are **Hardware Description**.

VHDL is **not** a programming language in the way C, Python, or Java are.
Those languages give a list of instructions to a processor that *already
exists*. VHDL is different: with VHDL you are **describing a piece of
electronic hardware** — a circuit made of wires, logic gates, and memory
elements — that does not exist yet. A tool then either *simulates* that
circuit on your computer or *builds* it onto a real chip.

A simple analogy:

- Writing C is like **writing a recipe** that a chef (the CPU) follows step
  by step.
- Writing VHDL is like **drawing the blueprint of a building**. Every wall,
  pipe, and wire on the blueprint exists *at the same time*. Nothing is
  "done first."

Hold that building-blueprint image in your head. It explains almost everything
strange about VHDL.

---

## 2. The core difference: sequential vs. concurrent

This is the idea that trips up every single beginner. Read this section twice.

### Software is sequential

In Python:

```python
a = 5
b = a + 1
a = 10
print(b)   # prints 6
```

The computer does line 1, **then** line 2, **then** line 3, **then** line 4.
Order matters. `b` is `6` because line 2 ran *before* line 3 changed `a`. This
is **sequential execution** — one thing after another, in time.

### Hardware is concurrent

Now imagine three light switches each wired directly to a light bulb. Flip
switch 1 and bulb 1 changes. Flip switch 2 and bulb 2 changes. They do not
"take turns." All three switch-and-bulb circuits are **live at the same
time**, always. There is no "line 1 then line 2."

VHDL is like the switches and bulbs. When you write:

```vhdl
y <= a and b;
z <= c or  d;
```

these are **not** "step 1" and "step 2." They are two pieces of wiring that
are **both always active, simultaneously, forever**. If `a` or `b` changes,
`y` updates. *At the same time*, if `c` or `d` changes, `z` updates. Their
order in the file does not matter at all — you could swap the two lines and
the circuit would be identical.

This is called **concurrent execution**, and it is the heart of hardware
thinking.

> **Mental model:** every "statement" in the main body of a VHDL design is a
> separate little machine, all running in parallel, all the time. You are not
> writing a sequence of commands; you are describing a collection of
> simultaneously-living wires and gates.

---

## 3. Signals vs. variables — the classic trap

You will hear two words constantly: **signal** and **variable**. Beginners
confuse them and lose hours. Let us kill that confusion now.

### A signal is a wire

A **signal** represents a physical wire in the circuit. You assign to it with
`<=` (think of the arrow as "drive this wire with..."):

```vhdl
y <= a and b;
```

A crucial property: a signal does **not** change the instant you assign it.
The new value is *scheduled*. In a clocked circuit, the change becomes visible
on the **next clock tick**, not immediately. This feels weird now; it will
make sense in Module 2 and especially Week 2. For now, just file away:

> **A signal is a wire. `<=`. Its update is scheduled, not instant.**

### A variable is a scratchpad

A **variable** behaves like a normal programming variable: it updates
**immediately**, the moment you assign it with `:=`. Variables live only
inside a "process" (you will meet processes soon) and are used for temporary
calculation.

> **A variable is a scratchpad value. `:=`. Updates instantly.**

### Why it matters (a tiny preview)

Consider swapping two values:

```vhdl
-- signals: this CORRECTLY swaps a and b
a <= b;
b <= a;
```

Because signals update *together, later* (not immediately), when `b <= a`
runs, `a` is still the old `a`. Both swap cleanly — exactly like real
hardware registers. If these were variables, the second line would use the
*already-changed* value and the swap would fail. We will demonstrate this
hands-on in Week 2. For now you only need the slogan:

> **`<=` is a wire (scheduled). `:=` is a scratchpad (instant).**

---

## 4. The clock: the heartbeat

Most useful digital circuits are **synchronous**, meaning they march in step
with a **clock** — a signal that ticks `0,1,0,1,0,1...` at a steady rate,
like a metronome or a heartbeat.

Things that need to *remember* (registers, counters, the CPU's state) only
change on a **clock edge** — usually the moment the clock goes from `0` to
`1` (a "rising edge"). In VHDL that moment is written:

```vhdl
if rising_edge(clk) then
    -- everything in here happens once per heartbeat
end if;
```

Rule of thumb you will rely on all project long:

- Logic **inside** `if rising_edge(clk)` has **memory** (it is sequential —
  flip-flops, registers).
- Logic **outside**, in plain concurrent statements, has **no memory** (it is
  combinational — gates).

---

## 5. Combinational vs. sequential logic

These two terms describe the two kinds of digital logic. You will build both.

### Combinational logic — "no memory"

Output depends **only** on the inputs *right now*. Change the inputs, the
output instantly reflects the change. It does not remember anything.

Everyday analogy: a **light switch**. The bulb's state depends only on the
switch's current position. The switch does not "remember" you flipped it
yesterday.

Examples: AND/OR/NOT gates, a multiplexer (a selector switch), an adder.

### Sequential logic — "has memory"

Output depends on the inputs **and** on stored history (state). It remembers.

Everyday analogy: a **digital counter on a turnstile**. Each push adds one —
the displayed number depends on how many people came *before*, not just the
current push. It has memory.

Examples: a register (stores a value), a counter, a finite state machine.

### Where this project lives

The WashU-2 CPU you build later is mostly **sequential** — it has registers
(memory like `ACC`, `PC`) and a finite state machine controlling everything.
It also uses **combinational** helpers (the ALU computing a result, address
math). You will build small versions of both kinds during the bootcamp before
combining them into the CPU.

---

## 6. Recommended outside resources for this module

If the text above did not fully click, one of these covers *exactly* these
concepts (concurrency, combinational vs sequential, what an HDL is):

- **Nandland (YouTube)** — *"Introduction to VHDL"* / *"Combinational vs
  Sequential Logic"* — short, beginner-paced, made for exactly this audience.
- **GeeksforGeeks** — search *"Difference between Combinational and Sequential
  Circuits"* — clear quick reference with tables and diagrams.

Next: **Module 2 — VHDL Syntax Primer**.
