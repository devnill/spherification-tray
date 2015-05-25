resolution=80;
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

lid_tolerance=.5;
lid_inset_r=funnel_r-(lid_tolerance/2);
lid_inset_h=5;
lid_cap_h=5;
lid_h=lid_inset_h+lid_cap_h;
lid_bore_r=1.5;

//set parameters for rendering
$fn=resolution;
