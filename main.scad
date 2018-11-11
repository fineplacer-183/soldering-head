
use <adapter-lqfp64.scad>;

import("LQFP-64.stl");

// TODO: This is a guessed number... measure it
mount_offset_z = 20;

translate([0,0,mount_offset_z])
rotate([0,0,180])
adapter_lqfp64();
