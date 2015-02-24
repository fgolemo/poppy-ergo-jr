include <robotis-scad/ollo/ollo_def.scad>
include <robotis-scad/dynamixel/xl320_def.scad>
include <poppy_ergo_jr_def.scad>

use <robotis-scad/dynamixel/xl320.scad>;
use <robotis-scad/frames/base_frame.scad>;
use <robotis-scad/frames/side_to_side_frame.scad>;
use <robotis-scad/frames/three_ollo_to_horn_frame.scad>;
use <robotis-scad/frames/U_horn_to_horn_frame.scad>;
use <robotis-scad/frames/U_three_ollo_to_horn_frame.scad>;

use <MCAD/rotate.scad>;

circular_base_frame(BaseRadius, BaseHeight);
xl320();
translate_to_xl320_top()
  verticalize_U_horn_to_horn_frame(A){
    U_horn_to_horn_frame(A);
    xl320_two_horns();
    translate_to_box_back()
      translate([0,OlloSpacing/2,0])
        rotate([180,90,0])
          add_three_ollo_to_horn_frame(B)
            rotate([0,90,180]) {
              xl320_two_horns();
              translate_to_box_back()
                translate([0,OlloSpacing/2,0])
                  rotate([180,90,0])
                      add_U_three_ollo_to_horn_frame(length=C, radius=OlloLayerThickness/2)
                        rotate([90,0,0])
                          translate([0,0,-MotorHeight/2-OlloLayerThickness]) {
                            xl320();
                            translate([0,-OlloSpacing*3,0])
                              rotate([180,0,0])
                                add_three_ollo_to_horn_frame(D)
                                  rotate([0,90,180]) {
                                    xl320_two_horns();
                                    translate_to_box_back()
                                      translate([0,OlloSpacing/2,0])
                                        rotate([180,90,0])
                                          add_three_ollo_to_horn_frame(E)
                                            rotate([0,90,180]) {
                                              xl320_two_horns();
                                              translate_to_box_back()
                                                translate([0,OlloSpacing/2,0])
                                                  rotate([180,90,0])
                                                    U_three_ollo_to_horn_frame(length=F, radius=OlloLayerThickness/2);
                                            }
                                  }
                          }
            }
  }