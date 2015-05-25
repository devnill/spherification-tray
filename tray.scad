hole_r=2.5;
wall_thickness=1;
funnel_h=30;
funnel_r=10;
funnel_id=funnel_r*2;
funnel_od= funnel_id+(wall_thickness*2);
box_rows=5;
box_cols=5;
box_x=90;
box_y=185;
tray_h=30;

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
        for ( row = [1 : box_rows] ){
            translate([0,row*funnel_r,0]){
                for ( col = [1 : box_cols] ){
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
        for ( row = [1 : box_rows] ){
            translate([0,row*funnel_r,0]){
                for ( col = [1 : box_cols] ){
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
    
