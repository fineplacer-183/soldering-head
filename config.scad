
$fn = 200;
material_z = 3;
nothing = 0.1;

// Base plate
mount_size_x = 63;
mount_size_y = 57.5;

mount_offset_y = 31;

// Layer size
layer_size_x = 42;
layer_size_y = 52;

/*
 * Hot air window: 4x4cm - border metal width: 1.2mm
 *
 * The size of the hot air hole can be adjusted
 * to fit different IC package sizes.
 */
hole_size_x = 40 - 2*1.2;
hole_size_y = 40 - 2*1.2;
//hole_size_x = 24;
//hole_size_y = 24;

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

// Screw top left
baseplate_screw1_x = 20;
baseplate_screw1_y = 8;

// Screw bottom right
baseplate_screw2_x = 43;
baseplate_screw2_y =8;

baseplate_tap_hole_diameter = 2.5;
baseplate_screw_hole_diameter = 3;
