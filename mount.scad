
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
    mount_size_y = 57.5;

    // Hot air window: 4x4cm - border metal width: 1.2mm
    hole_size_x = 40 - 2*1.2;
    hole_size_y = 40 - 2*1.2;

    hole_offset_y = 12.5;

    // Vacuum outlet    
    vacuum_outlet_y = hole_offset_y + hole_size_y/2;

    // Vacuum pipe mount
    vacuum_pipe_outer_diameter = 3;
    vacuum_pipe_mount_width = 6;
    vacuum_pipe_mount_height = vacuum_outlet_y + vacuum_pipe_outer_diameter;

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
