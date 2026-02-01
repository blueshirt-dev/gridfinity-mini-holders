// Constants to leave the same
// gridfinity
gridfinity_xy_to_mm = 42;
gridfinity_z_to_mm = 7;
gridfinity_tolerance = 0.5;

// rails
rail_depth = 3;
horizontal = 1;
vertical = 2;

// Offsets to prevent impossibly thin artifacts
removal = -0.01;
addition = 0.01;

// Variables to edit
// gridfinity
gridfinity_x = 1;
gridfinity_y = 1;
gridfinity_z = 6;

// Rails
rail_thickness = 3;
rail_spacing = 4;
rail_direction = horizontal;


difference(){
    cube([gridfinity_x * gridfinity_xy_to_mm - gridfinity_tolerance,
        gridfinity_y * gridfinity_xy_to_mm - gridfinity_tolerance,
        gridfinity_z * gridfinity_z_to_mm],false);
    
    for(i = [1:rail_spacing + rail_thickness:gridfinity_x * gridfinity_xy_to_mm ]){
        translate( rail_direction==horizontal ? [i,removal,removal] : 
        rail_direction==vertical ? [removal,removal,i] : [0,0,0])
            cube([rail_thickness, gridfinity_y * gridfinity_xy_to_mm,rail_depth]);
    }
}
