/* [Hidden] */
// Gridfinity

gridfinity_xy_to_mm = 42;
gridfinity_z_to_mm = 7;
gridfinity_tolerance = 0.5;

// rails
rail_depth = 3;
horizontal = 1;
vertical = 2;
rail_slide_depth = 3;

// Offsets to prevent impossibly thin artifacts
removal = -0.01;
addition = 0.01;

// Variables to edit
/* [Gridfinity] */
// Length
gridfinity_x = 1;
// Width
gridfinity_y = 1;
// Height
gridfinity_z = 6;
// How much extra material to leave between exterior and ridges.
gridfinity_wall_thickness = 3;

/* [Rails] */
// How thick are the rails cutouts.
rail_thickness = 3;
// Mini base size
mini_base_size = 35;


difference(){
    cube([gridfinity_x * gridfinity_xy_to_mm - gridfinity_wall_thickness * 2 ,
        gridfinity_y * gridfinity_xy_to_mm - gridfinity_wall_thickness * 2,
        rail_thickness - gridfinity_tolerance],false);
    
    translate([rail_slide_depth * 2, rail_slide_depth, rail_thickness - gridfinity_tolerance*2])
            linear_extrude(4)
                text(str(mini_base_size), size=3);
    
}
