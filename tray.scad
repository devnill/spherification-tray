include <parameters.scad>;

module spout(){
    cylinder(h = funnel_h, r1 = hole_r+(wall_thickness*2), r2 = funnel_r);
}
module spout_bore(){
    cylinder(h = funnel_h, r1 = hole_r, r2 = funnel_r-(wall_thickness*2));
}


module section_bore(){
translate([0,0,funnel_h])
cylinder(h=tray_h,r=funnel_r-(wall_thickness*2));
}
module tray_section(){
translate([0,0,funnel_h])
cylinder(h=tray_h,r=funnel_r);
}

module tray(){
        for ( row = [0 : box_rows-1] ){
            translate([0,row*funnel_r,0]){
                for ( col = [0 : box_cols-1] ){
                    if(row % 2 == 0)translate([col*(funnel_id-wall_thickness),0, 0]){
                        tray_section();
                        spout();
                    }    
                    else translate([col*(funnel_id-wall_thickness)+funnel_r,0, 0]){
                        tray_section();
                        spout(); 
                    }     
                }
            }
        }
}

module tray_bore(){
        for ( row = [0 : box_rows-1] ){
            translate([0,row*funnel_r,0]){
                for ( col = [0 : box_cols-1] ){
                    if(row % 2 == 0)translate([col*(funnel_id-wall_thickness),0, 0]){
                        section_bore();
                        spout_bore();
                    }     
                    else translate([col*(funnel_id-wall_thickness)+funnel_r,0, 0]){
                        section_bore();
                        spout_bore();
                    }     
                }
            }
        }
}


difference(){
    tray();
    tray_bore();
}
