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
gridfinity_wall_thickness = 3;

// Rails
rail_thickness = 3;
rail_spacing = 5;
rail_direction = horizontal;


difference(){
    cube([gridfinity_x * gridfinity_xy_to_mm - gridfinity_tolerance,
        gridfinity_y * gridfinity_xy_to_mm - gridfinity_tolerance,
        gridfinity_z * gridfinity_z_to_mm],false);
    
    for(i = [gridfinity_wall_thickness:rail_spacing + rail_thickness:gridfinity_x * gridfinity_xy_to_mm ]){
        if(! (i+rail_thickness > gridfinity_x * gridfinity_xy_to_mm - gridfinity_wall_thickness))
        {
            translate( rail_direction==horizontal ? [i,removal + gridfinity_wall_thickness,removal] : 
                    rail_direction==vertical ? [removal,removal + gridfinity_wall_thickness,i] : [0,0,0])
                cube([rail_thickness, gridfinity_y * gridfinity_xy_to_mm - gridfinity_wall_thickness*2 ,gridfinity_z*gridfinity_z_to_mm + addition*2]);
        }
    }
}
