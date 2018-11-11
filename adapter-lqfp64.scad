
include <config.scad>;
use <mount.scad>;

module adapter_lqfp64()
{
    mount_offset_y = 31;

    // Adjust such that the component lies in the center
    translate([0, -mount_offset_y, 0])
    mount();
}

adapter_lqfp64();
