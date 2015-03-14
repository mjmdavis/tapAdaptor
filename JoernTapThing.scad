

module key()
polygon(points=[[1,0],[-1,0],[0,2]]);

module bit()
union(){
    circle(4.4);
for (z = [0:18:360]) {
rotate([0,0,z])
translate([0,4,0])
key();
}
}

module innerbit()
union(){
    circle(2);
for (z = [0:18:360]) {
rotate([0,0,z])
translate([0,1.5,0])
key();
}
}

module innerThingy()
translate([0,0,-1])
linear_extrude(height = 10, convexity=20){
    innerbit();
}

module outerThingy()
linear_extrude(height = 10, convexity=20){
    bit();
}

module solidThingy()
union(){
translate([0,0,2])
outerThingy();
cylinder(2,15/2,15/2);
}

module gappyThingy()
translate([0,0,-1])
for (z = [0:90:180]) {
    rotate([0,0,z])
translate([-10,-0.5,0])
cube([20,1,10]);
}

module wholeThingy()
difference(){
    solidThingy();
    gappyThingy();;
}

difference(){
difference(){
    wholeThingy();
innerThingy();
    }
    cylinder(20,2,2,$fn=20);
}