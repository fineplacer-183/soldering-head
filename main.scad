
use <adapter-lqfp64.scad>;

import("LQFP-64.stl");

// TODO: This is a guessed number... measure it
mount_offset_z = 30;

translate([0,0,mount_offset_z])
rotate([180,0,0])
adapter_lqfp64();
