include <parameters.scad>;


module lid_section(){
    cylinder(h=lid_cap_h,r=funnel_r+wall_thickness);
    translate([0,0,lid_cap_h]){
        cylinder(h=lid_inset_h,r=lid_inset_r);
    }

}

module lid(){
        for ( row = [0 : box_rows-1] ){
            translate([0,row*(funnel_r-wall_thickness),0]){
                for ( col = [0 : box_cols-1] ){
                    if(row % 2 == 0)translate([col*(funnel_id-wall_thickness*2),0, 0]){
                        lid_section();
                    }    
                   else translate([col*(funnel_id-wall_thickness*2)+funnel_r-wall_thickness,0, 0]){
                        lid_section();
                    }   
                }
            }
        }
    
}
module lid_bore(){
     cylinder(h=lid_h,r=lid_bore_r);
}
difference(){
    lid();
    lid_bore();
}