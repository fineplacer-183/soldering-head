
include <machine_measures.scad>;
include <config.scad>;

/**
 * The mount module describes the plane,
 * which all soldering heads must have in order
 * to fit  into the soldering arm and be held
 * attached to the arm by the latter's two side clamps.
 */
module mount()
{
    // Base plate
    mount_size_x = 63;
    mount_size_y = 58;

    // Hot air window
    hole_size_x = 40;
    hole_size_y = 40;

    hole_offset_y = 11;

    // Side clamps
    clamp_hole_diameter = 3;
    clamp_hole_radius = clamp_hole_diameter/2;
    clamp_hole_inset_x = 3;
    clamp_hole_offset_y = hole_offset_y + hole_size_y/2;

    difference()
    {
        // The base plate
        translate([
            -mount_size_x/2,
            0,
            0
            ])
        cube([
            mount_size_x,
            mount_size_y,
            material_z
            ]);

        // The opening for the hot air flow
        translate([
            -hole_size_x/2,
            hole_offset_y,
            -nothing
            ])
        cube([
            hole_size_x,
            hole_size_y,
            material_z + 2*nothing
            ]);

        // The clamp holes
        for (x=[
                    -mount_size_x/2 + clamp_hole_inset_x,
                    +mount_size_x/2 - clamp_hole_inset_x
                    ])
        {
            translate([
                x,
                clamp_hole_offset_y,
                -nothing
                ])
           cylinder(
                r=clamp_hole_radius,
                h=material_z+2*nothing
                );
        }
    }
}

mount();
