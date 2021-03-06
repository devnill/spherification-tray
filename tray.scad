include <parameters.scad>;

module spout(){
    cylinder(h = funnel_h, r1 = hole_r+wall_thickness, r2 = funnel_r+wall_thickness);
}
module spout_bore(){
    cylinder(h = funnel_h, r1 = hole_r, r2 = funnel_r);
}

module tray_section(){
translate([0,0,funnel_h+section_connector_h])
cylinder(h=tray_h,r=tray_section_r+wall_thickness);
}
module tray_section_bore(){
translate([0,0,funnel_h+section_connector_h])
cylinder(h=tray_h,r=tray_section_r);

    }

module section_connector(){
translate([0,0,funnel_h])
cylinder(h=section_connector_h,r1=funnel_r+wall_thickness,r2=tray_section_r+wall_thickness);

}

module section_connector_bore(){
translate([0,0,funnel_h])
cylinder(h=section_connector_h,r1=funnel_r,r2=tray_section_r);

}

module tray(){
    module section(){
        
                        tray_section();
                        section_connector();
                        spout();
                        
        }
    union(){    
    for ( row = [0 : box_rows-1] ){
            
            translate([0,row*(tray_section_r-wall_thickness),0]){
            union(){
                for ( col = [0 : box_cols-1] ){
                    if(row % 2 == 0)translate([col*(tray_section_id-wall_thickness*2),0, 0]){
                        section();
                    }    
                   else translate([col*(tray_section_id-wall_thickness*2)+tray_section_r-wall_thickness,0, 0]){
                       section();
                    }   
                }
            }
        }
    }
}}

module overflow_tube(){
    translate([0,0,funnel_h]){
    union(){    
    for ( row = [0 : box_rows-1] ){
            
            translate([0,row*(tray_section_r-wall_thickness),0]){
            union(){
                for ( col = [0 : box_cols-1] ){
                    if(row % 2 == 0)translate([col*(tray_section_id-wall_thickness*2),0, 0]){
           difference(){
            cylinder(h = section_connector_h, r = funnel_r+wall_thickness);
            cylinder(h = section_connector_h, r = funnel_r);
        }
        }    
                   else translate([col*(tray_section_id-wall_thickness*2)+tray_section_r-wall_thickness,0, 0]){
        
                       difference(){
            cylinder(h = section_connector_h, r = funnel_r+wall_thickness);
            cylinder(h = section_connector_h, r = funnel_r);
     }
                       
                    }   
                }
            }
        }
    }
}}}
module tray_bore(){
    module bore_section(){
            union(){
                        tray_section_bore();
                        section_connector_bore();
                      spout_bore();
                        }
     }
   
    union(){
    for ( row = [0 : box_rows-1] ){
            
            translate([0,row*(tray_section_r-wall_thickness),0]){
            union(){
                for ( col = [0 : box_cols-1] ){
                    if(row % 2 == 0)translate([col*(tray_section_id-wall_thickness*2),0, 0]){
                            bore_section();
                            }     
                    else translate([col*(tray_section_id-wall_thickness*2)+tray_section_r-wall_thickness,0, 0]){             
                        bore_section();
                        
                    }
                }
            }}}
        }
    }
    union(){
    overflow_tube(); 
    difference(){
        tray();
        tray_bore();
    }
}





