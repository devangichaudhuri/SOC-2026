# Week 1 · Module 3 — Toolchain Setup (Quartus)

This module gets your tools working. The entire project uses **Intel Quartus
Prime** and its bundled **ModelSim** (sometimes called Questa) simulator.
Everything — writing VHDL, compiling, simulating, and looking at waveforms —
happens through Quartus. There is nothing else to install.

This is the one module where the goal is purely practical: by the end you
should be able to take a tiny VHDL file, compile it, run it in the simulator,
and see a waveform. If you can do that, your environment is ready for the
whole project.

> Setting up FPGA tools for the first time is genuinely fiddly for everyone.
> If it takes an afternoon, that is normal. Do not be discouraged.

---

## 1. Some vocabulary first (so the steps make sense)

You will see these words a lot. Quick definitions:

- **Quartus Prime** — the main software suite from Intel. Think of it as the
  "workbench."
- **ModelSim / Questa** — the **simulator** that comes bundled with Quartus.
  It runs your design as a virtual experiment and produces waveforms. This is
  what you'll use most.
- **Compile / Analyze** — checking your VHDL for errors and turning it into
  something the tools understand. (Like a spell-check + build step.)
- **Synthesize** — turning VHDL into actual gate-level hardware. We mostly
  *simulate* in this project, not synthesize to a real chip, but Quartus does
  this in the background.
- **Testbench** — a special VHDL file whose only job is to feed inputs to
  your design and let you watch the outputs. (Whole modules 5 and 6 are about
  this.)
- **Waveform** — a graph of how each signal's value changes over time. Your
  primary debugging tool.
- **DUT / UUT** — "Design Under Test" / "Unit Under Test." The thing your
  testbench is poking at.

---

## 2. Install Quartus Prime (with the simulator)

1. Go to Intel's FPGA software download portal (search:
   `Intel Quartus Prime Lite download`). Choose **Quartus Prime Lite
   Edition** — it is **free** and needs no license.
2. **During installation, make sure the "ModelSim - Intel FPGA Edition"
   component is ticked/selected.** This is the simulator you will use for
   every single testbench in the project. If you skip it, nothing later will
   work and you'll have to reinstall. Double-check this box.
3. If asked to install a device family, any one is fine (e.g. Cyclone) — we
   only simulate, we don't target a physical board, so the exact chip family
   does not matter.

Quartus Lite runs on Windows and Linux. It is a large download and install —
allow plenty of disk space (tens of GB) and time.

> If your laptop is low on space, ask the mentor — there are lighter
> simulation paths, but Quartus + ModelSim is the supported default for this
> project and what you'll be helped with.

---

## 3. Create your first project (step by step)

A "project" in Quartus is just a folder + settings that group your files.

1. Open Quartus → **File → New Project Wizard**.
2. Click through the intro page.
3. **Working directory:** pick (or create) an empty folder, e.g.
   `week1_basics`. **Project name:** something simple like `week1_basics`.
4. Project type: **Empty project**.
5. Add files: skip for now (we'll add them next), click Next.
6. **Device:** pick literally any device (e.g. any Cyclone part). We only
   simulate; this choice is irrelevant here.
7. **EDA Tool Settings:** find the **Simulation** row. Set the tool to
   **ModelSim-Intel FPGA** and the format to **VHDL**. This step is
   important — it links Quartus to the simulator.
8. Finish.

You now have an (empty) project.

---

## 4. Add a VHDL file and compile it

1. **File → New → VHDL File**. A blank editor opens.
2. Type or paste a small design. Use the AND gate from Module 2 as your test
   subject:

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

3. **Save it as `and_gate.vhd`** — the file name should match the entity name
   (`and_gate`). When prompted, **add it to the project**.
4. Run **Processing → Start → Start Analysis & Elaboration** (a quick syntax
   check) or **Start Compilation** (the full thing).
5. Watch the **Messages** window at the bottom. Green/info is fine. Red errors
   must be fixed before you continue — read the message, it usually points to
   the line.

> First-timer tip: the most common early errors are a missing semicolon, a
> mismatched `end`, or single vs. double quotes (`'1'` vs `"1"`). Re-read
> Module 2 section 5 if you hit these.

---

## 5. Add a testbench and simulate

You will fully understand testbenches in Modules 5–6. For now, treat the
testbench as "the file that pushes buttons on your design so you can watch
what happens."

1. Create another VHDL file (the testbench, e.g. `tb_and_gate.vhd`) and add
   it to the project. (Modules 5–6 teach you to write these; for setup
   testing you can use a provided one.)
2. **Assignments → Settings → Simulation:** confirm the simulation tool is
   **ModelSim-Intel FPGA** and set the testbench as the **top-level
   simulation entity** (the "NativeLink"/"compile test bench" setting — the
   mentor will demo this; it's a one-time fiddly step).
3. Run **Tools → Run Simulation Tool → RTL Simulation**.
4. ModelSim launches, compiles everything, runs the simulation, and opens a
   **Wave** window.

If ModelSim opens and you see signals with values changing over time —
**congratulations, your toolchain works.** That is the entire goal of this
module.

---

## 6. Reading a waveform (your main debugging skill)

The Wave window shows time flowing **left → right**, with each signal drawn as
a line that steps between values.

- Click a signal in the **Objects** pane → add it to the Wave window (drag,
  or right-click → Add to Wave).
- Use the **zoom-fit** button to see the whole run at once.
- For multi-bit signals, **right-click → Radix → Hexadecimal** makes 16-bit
  CPU values readable later (`x"1005"` instead of sixteen bits).
- A signal that only changes at clock edges is a **register** (memory). One
  that changes the instant its inputs change is **combinational**. Recognising
  this at a glance is a skill you build all project.

Spend a few minutes just clicking around and zooming. Comfort with this window
pays off enormously in Weeks 7–8.

---

## 7. Common setup problems (and fixes)

| Symptom | Likely cause / fix |
|---|---|
| No "Run Simulation Tool" option, or it errors immediately | ModelSim component was not installed — re-run the Quartus installer and **tick ModelSim - Intel FPGA** |
| `Error: entity "tb_xxx" not found` | Testbench file not added to the project, or the wrong top-level simulation entity is set |
| Wave window opens but is empty | Testbench has no stimulus yet, or you didn't add signals into the Wave view |
| `Error: unit "ieee" not found` | You forgot the `library IEEE;` line at the top of the file |
| Code changed but simulation shows old behaviour | Recompile — ModelSim caches the compiled "work" library; re-run the simulation |
| Lots of red `'X'` or `'U'` on signals | Uninitialised or conflicting signals — normal early on; you'll learn to read these |

If you get stuck for more than ~20 minutes on a setup error, copy the exact
error text and ask in the group/mentor channel. Setup problems are universal
and quick for someone who's seen them before.

---

## 8. Recommended outside resources for this module

Watching someone click through Quartus + ModelSim once makes it click much
faster than reading steps:

- **YouTube** — search *"Quartus Prime VHDL simulation ModelSim tutorial
  beginner"* and pick a recent video showing: new project → add VHDL → run
  RTL simulation → waveform.
- **Intel's official "Quartus Prime Getting Started"** documentation — the
  authoritative source for installation and project setup.

> Because tool UIs change between versions, prefer videos/articles from the
> last couple of years and match the steps to *your* installed version. The
> concepts (new project → add file → compile → simulate → waveform) never
> change even if menus move.

---

## 9. Deliverable / done-criteria for this module

You are done with Module 3 when you can:

- [ ] open Quartus, create a project,
- [ ] add the `and_gate.vhd` design, compile it with no errors,
- [ ] run RTL simulation in ModelSim with a testbench,
- [ ] see the AND gate's behaviour in the Wave window and explain what you're
      looking at.

Do not move to the exercises until the toolchain works end-to-end on this
trivial example. Debugging real exercises while *also* fighting the tools is
miserable — get the tools solid first.

Next: **Module 4 — Guided Exercises**.
