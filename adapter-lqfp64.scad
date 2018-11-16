
include <config.scad>;
use <mount.scad>;
use <layer.scad>;


module adapter_lqfp64()
{
    // Adjust such that the component lies in the center
    translate([0, -mount_offset_y, 0])
    color("green")
    mount();

    for (i = [1:7])
    {
        translate([0, -mount_offset_y, i*material_z])
        color("blue")
        layer(i < 3);
    }
 }

adapter_lqfp64();
