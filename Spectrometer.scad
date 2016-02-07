grating_width=51;
grating_height=51;
grating_thickness=1.1;

blade_scale = 1;
blade_thickness=1;
blade_length=61.9*blade_scale;


grating_lines_per_mm=1000;



camera_lens_diameter=8.2;

module blade(){
    scale([blade_scale,blade_scale,1.5]) import("C:/Users/Matthew/Documents/OpenSCAD/Spectrometer/StanleyBlade/StanleyBlade.stl");
}

module slit(){
    difference(){
        translate([0,blade_length/2+1.5,(blade_thickness+1)/2]) cube([grating_width, blade_length+3,blade_thickness+1], center=true);
        translate([-0.5,1.5,0]) blade();
        rotate([0,180,0]) translate([-0.5,1.5,-blade_thickness*1.5]) blade();
        translate([-0.6,1,0]) cube([1.2, blade_length+1,10]);
    }
}

module slide_holder(){
    difference(){
        cube([grating_width+5, blade_length+3,grating_thickness*3], center=true);
        
        margin_x = (grating_width+2)/2;
        margin_y = ((blade_length+3))/2;
        margin_z = ((grating_thickness*3))/2;
        
        cube([grating_width-6, grating_height,grating_thickness*3], center=true);
        translate([0,15,0]) cube([grating_width, grating_height+30+0.75,grating_thickness], center=true);
        
    }
}

rotate([0,180,0]) translate([0,-(blade_length/2+1.5),-grating_thickness*3]) slit();
slide_holder();