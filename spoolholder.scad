//translate([80,-158,20]) rotate([0,0,90]) {  import("The_Ultimate_Spool_Holder_v2.stl", convexity=3);}

bearing_thinkness = 6;
bearing_inner_diameter = 6;
bearing_diameter = 17;
birm_height = 0.3;

case_thickness = 2;
lenght = 110;
height = 20;
margin = 10;
distance = (lenght/2) - margin - bearing_diameter/2;

module birm() {
    cylinder(birm_height,d=bearing_inner_diameter+2,true,$fn=40);
}

module bearingPlug() {
    cylinder(bearing_thinkness/2,d=bearing_inner_diameter,true,$fn=40);
    birm();
}

module cutOuts(){
    diameter = 100;
    translate([-diameter/2,0,-10]) cylinder(40,d=diameter,true,$fn=40);
}
module base(){
     difference() {
            cube(size = [height,lenght,case_thickness], center = true);
            cutOuts();
    }
    
    // Bottom
     translate([height/2-case_thickness/2,distance+margin+8.5,case_thickness])  cube(size = [case_thickness,1,bearing_thinkness], center = true);
    // Bottom
     translate([height/2-case_thickness/2,-distance-margin-8.5,case_thickness])  cube(size = [case_thickness,1,bearing_thinkness-1], center = true);
    translate([height/2-case_thickness/2,0,case_thickness])  cube(size = [case_thickness,1,bearing_thinkness-1], center = true);
}

$fn=30;
minkowski()
{
    translate([0,0,-1]) base();
    cylinder(r=5,h=1);
}



translate([0,-distance,case_thickness/2])  bearingPlug();
translate([0,distance,case_thickness/2])  bearingPlug();



