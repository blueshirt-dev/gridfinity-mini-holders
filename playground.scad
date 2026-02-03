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
// How big are the ridges cutouts.
rail_thickness = 3;
// How far between each ridge.
rail_spacing = 5;
// Orientation of the ridges
rail_direction = 2; // [1:horizontal, 2:vertical]


difference(){
    cube([gridfinity_x * gridfinity_xy_to_mm - gridfinity_tolerance,
        gridfinity_y * gridfinity_xy_to_mm - gridfinity_tolerance,
        gridfinity_z * gridfinity_z_to_mm],false);
    
    for(i = [gridfinity_wall_thickness:rail_spacing + rail_thickness:gridfinity_x * gridfinity_xy_to_mm ]){
        if(rail_direction == vertical){
            if(! (i+rail_thickness > gridfinity_x * gridfinity_xy_to_mm - gridfinity_wall_thickness))
            {
                translate([i,removal + gridfinity_wall_thickness,removal])
                    cube(
                        [rail_thickness, 
                        gridfinity_y * gridfinity_xy_to_mm - gridfinity_wall_thickness*2,
                        gridfinity_z*gridfinity_z_to_mm + addition*2]);
            }
        }
        else if(rail_direction == horizontal){
            if(! (i+rail_thickness > gridfinity_z * gridfinity_z_to_mm - gridfinity_wall_thickness)){
                    translate([removal,removal + gridfinity_wall_thickness,i])
                        cube(
                            [ gridfinity_x*gridfinity_xy_to_mm, 
                            gridfinity_y * gridfinity_xy_to_mm - gridfinity_wall_thickness * 2,
                            rail_thickness]);
                }
        }
        else {
            echo("No rail direction set");
        }
    }

    translate([gridfinity_wall_thickness,gridfinity_wall_thickness+rail_depth,removal])
        cube([gridfinity_x * gridfinity_xy_to_mm - gridfinity_tolerance - gridfinity_wall_thickness*2,
            gridfinity_y * gridfinity_xy_to_mm - gridfinity_tolerance- gridfinity_wall_thickness*2 - rail_depth*2,
            gridfinity_z * gridfinity_z_to_mm + addition*2],false);
}
