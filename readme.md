# Input Labs CAD models

*3D-printed models for Alpakka and Kapybara controllers reference designs.*

## Project links
- [Alpakka Manual](https://inputlabs.io/devices/alpakka/manual).
- [Firmware](https://github.com/inputlabs/alpakka_firmware).
- [PCB](https://github.com/inputlabs/alpakka_pcb).
- [CAD](https://github.com/inputlabs/alpakka_case). _(you are here)_
- [Input Labs Roadmap](https://github.com/orgs/inputlabs/projects/2/views/2).

## Previews
<span><img width='250px' src='./preview/print_A.png'/></span>
<span><img width='250px' src='./preview/print_B.png'/></span>
<span><img width='250px' src='./preview/print_C.png'/></span>
<span><img width='250px' src='./preview/print_D.png'/></span>
<span><img width='250px' src='./preview/print_E.png'/></span>
<span><img width='250px' src='./preview/print_F.png'/></span>
<br>*(Previews might be outdated)*

## Dependencies
- Git LFS.
- Blender >= 4.5
- `make install`
    - BPY `4.5.3`
    - Build123d `0.9.1`
- OCP CAD viewer (VSCode Build123d editor). *[optional]*

## LFS and file download
If you only want to download the Blender and STL files `DO NOT USE download ZIP` GitHub button, since it is not compatible with LFS (Large File Storage), but instead get the files from the [latest release](https://github.com/inputlabs/alpakka_case/releases/latest) package.

To use Git with this project it is required to install Git [Large File Storage](https://git-lfs.github.com).


## Parts hierarchy

```
.blend => Blender
.py => Build123d
```

### Main assembly
- `alpakka.blend` - Alpakka controller assembly.

### Case
- `case_front.blend` - Front case + cutouts.
- `case_back.blend` - Back case + cutouts.
- `case_cover.py` - Rear bay cover.
- `anchor.blend` - Anchors holding the cases together.
- `lock.blend` - Screws holding the cases together.

### Buttons
- `button_dpad.py` - Dpad buttons.
- `button_abxy.py` - ABXY buttons.
- `button_select.py` - Select/start buttons.
- `button_home.blend` - Home button.

### Triggers
- `trigger_R1.py` - L1 and R1 shoulder triggers.
- `trigger_R2.blend` - L2 and R2 triggers.
- `trigger_R4.blend` - L4 and R4 triggers.

### Control widgets
- `hexagon.py` - Touch sensitive surface.
- `thumbstick.blend` - Left thumbstick cap.
- `thumbstick_right.py` - Right thumbstick cap.
- `scrollwheel.py` - Scrollwheel, core, and holder.

### Additional
- `soldering_stand.blend` - Tool to hold the PCB while soldering.
- `shared.blend` - Common geometry nodes / modifiers shared by all parts.


## Exported filename labels
- `015mm`: 0.15mm layer height, default for most prints.
- `007mm`: 0.07mm layer height, for parts that require extra finesse.
- `020mm`: 0.20mm layer height, for tools that we want to print fast.
- `2x`, `4x`: To be printed multiple times.
- `CONDUCTIVE`: Electrically conductive filament.

It is very recommended to follow these indications, and to check the [Manual](https://inputlabs.io/devices/alpakka/manual/diy_case) for more details.


## Migration to Build123d
We are in the process of migrating 3D modelling from Blender to [Build123D](https://build123d.readthedocs.io), we decided to make the migration gradually, one part at a time.

The original Blender parts are still located in `blender/` folder.

While parts that are already ported into Build123D are located in `build123d/` folder.

The export script will create `STL` for all Blender and Build123D parts, and `STEP` only for Build123d parts.


## Developer commands
- `make alpakka_release` - Create `blender.zip`, `stl.zip` and `step.zip`.
- `make alpakka_blender` - Export only Blender files.
- `make alpakka_build123d` - Export only Build123d files.
- `make kapybara_release`
- `make kapybara_blender`
- `make kapybara_build123d`
- `make clean` - Remove all export files and leftovers.
