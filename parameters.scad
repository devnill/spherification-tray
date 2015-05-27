
//general params
resolution=72;
wall_thickness=1.5;
box_rows=6;
box_cols=5;

//funnel params
hole_r=1.5;
funnel_h=15;
funnel_r=7.5;
funnel_id=funnel_r*2;
funnel_od= funnel_id+(wall_thickness*2);

//tray (top half of assembly) params
tray_h=10;

//lid params
lid_tolerance=.5;
lid_inset_r=funnel_r-(lid_tolerance/2);
lid_inset_h=3;
lid_cap_h=2;
lid_h=lid_inset_h+lid_cap_h;
lid_bore_r=1.5;

//set parameters for rendering
$fn=resolution;
