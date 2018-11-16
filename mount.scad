
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

        // Baseplate to layer screw hole, top left
        translate([
            -mount_size_x/2 + baseplate_screw1_x,
            baseplate_screw1_y,
            -nothing
            ])
        cylinder(
            r=baseplate_tap_hole_diameter/2,
            h=material_z + 2*nothing
            );

        // Baseplate to layer screw hole, bottom right
        translate([
            -mount_size_x/2 + baseplate_screw2_x,
            baseplate_screw2_y,
            -nothing
            ])
        cylinder(
            r=baseplate_tap_hole_diameter/2,
            h=material_z + 2*nothing
            );
    }

    // Vacuum pipe mount
    difference()
    {
        // The middle suppor
        translate([-vacuum_pipe_mount_width/2, 0, 0])
        cube([
            vacuum_pipe_mount_width,
            vacuum_pipe_mount_height,
            material_z
            ]);

        // A hole for the vacuum pipe
        translate([0, vacuum_outlet_y, -nothing])
        cylinder(r=vacuum_pipe_outer_diameter/2, h=material_z+2*nothing);
    }
}

mount();
