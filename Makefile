# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2022, Input Labs Oy.

PYTHON_BLENDER := 'python3.11'
PYTHON_B123D := 'python3.13'

default: release

install:
	sh scripts/install.sh

clean:
	rm -rf alpakka/stl
	rm -rf alpakka/step
	rm -rf alpakka/release
	rm -rf kapybara/stl
	rm -rf kapybara/step
	rm -rf kapybara/release

alpakka_blender:
	mkdir -p alpakka/stl
	mkdir -p alpakka/stl/variants
	$(PYTHON_BLENDER) scripts/export_blender_alpakka.py alpakka/blender/case_front.blend
	$(PYTHON_BLENDER) scripts/export_blender_alpakka.py alpakka/blender/case_back.blend
	$(PYTHON_BLENDER) scripts/export_blender_alpakka.py alpakka/blender/trigger_R2.blend
	$(PYTHON_BLENDER) scripts/export_blender_alpakka.py alpakka/blender/trigger_R4.blend
	$(PYTHON_BLENDER) scripts/export_blender_alpakka.py alpakka/blender/anchor.blend
	$(PYTHON_BLENDER) scripts/export_blender_alpakka.py alpakka/blender/thumbstick.blend
	$(PYTHON_BLENDER) scripts/export_blender_alpakka.py alpakka/blender/button_home.blend
	$(PYTHON_BLENDER) scripts/export_blender_alpakka.py alpakka/blender/soldering_stand.blend
	# Variants.
	mv alpakka/stl/007mm_thumbstick_L_loose.stl  alpakka/stl/007mm_thumbstick_L.stl
	mv alpakka/stl/007mm_thumbstick_L_tight.stl  alpakka/stl/variants/007mm_thumbstick_L_tight.stl

kapybara_blender:
	mkdir -p kapybara/stl
	$(PYTHON_BLENDER) scripts/export_blender_kapybara.py


alpakka_build123d:
	mkdir -p alpakka/stl
	mkdir -p alpakka/stl/variants
	mkdir -p alpakka/step
	mkdir -p alpakka/step/variants
	$(PYTHON_B123D) scripts/export_b123d_alpakka.py

alpakka_release: clean alpakka_blender alpakka_build123d
	mkdir -p alpakka/release/
	cd alpakka && zip    release/alpakka_blender.zip  blender/*.blend
	cd alpakka && zip -r release/alpakka_stl.zip   stl/
	cd alpakka && zip -r release/alpakka_step.zip  step/

kapybara_release: clean kapybara_blender
	mkdir -p kapybara/release/
	cd kapybara && zip -r release/kapybara_blender.zip  blender/
	cd kapybara && zip -r release/kapybara_stl.zip      stl/
