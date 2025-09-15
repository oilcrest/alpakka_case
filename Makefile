# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2022, Input Labs Oy.

BLENDER := 'blender'
ifeq ($(shell uname), Darwin)
	BLENDER := '/Applications/Blender.app/Contents/MacOS/Blender'
endif

default: release

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
	$(BLENDER) alpakka/blender/case_front.blend      --background --python scripts/export_blender.py
	$(BLENDER) alpakka/blender/case_back.blend       --background --python scripts/export_blender.py
	$(BLENDER) alpakka/blender/trigger_R2.blend      --background --python scripts/export_blender.py
	$(BLENDER) alpakka/blender/trigger_R4.blend      --background --python scripts/export_blender.py
	$(BLENDER) alpakka/blender/anchor.blend          --background --python scripts/export_blender.py
	$(BLENDER) alpakka/blender/thumbstick.blend      --background --python scripts/export_blender.py
	$(BLENDER) alpakka/blender/button_home.blend     --background --python scripts/export_blender.py
	$(BLENDER) alpakka/blender/soldering_stand.blend --background --python scripts/export_blender.py
	# Variants.
	mv alpakka/stl/007mm_thumbstick_L_loose.stl  alpakka/stl/007mm_thumbstick_L.stl
	mv alpakka/stl/007mm_thumbstick_L_tight.stl  alpakka/stl/variants/007mm_thumbstick_L_tight.stl

alpakka_build123d:
	mkdir -p alpakka/stl
	mkdir -p alpakka/stl/variants
	mkdir -p alpakka/step
	mkdir -p alpakka/step/variants
	python3 scripts/export_b123d_alpakka.py

alpakka_release: clean alpakka_blender alpakka_build123d
	mkdir -p alpakka/release/
	zip -u alpakka/release/blender.zip           alpakka/blender/*.blend
	zip -u alpakka/release/stl.zip stl/*.stl     alpakka/stl/**/*.stl
	zip -u alpakka/release/step.zip step/*.step  alpakka/step/**/*.step
