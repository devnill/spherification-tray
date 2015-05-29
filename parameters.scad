resolution=45;
//resolution=10;

hole_r=1.5;
wall_thickness=1.5;
funnel_h=30;
funnel_r=2.5;
funnel_id=funnel_r*2;
funnel_od= funnel_id+(wall_thickness*2);


box_rows=6;
box_cols=5;

section_connector_h=15;

tray_h=5;
tray_section_r=10;
tray_section_id=tray_section_r*2;


lid_tolerance=.1;
lid_inset_r=tray_section_r-(lid_tolerance/2);
lid_inset_h=3;
lid_cap_h=2;
lid_h=lid_inset_h+lid_cap_h;
lid_bore_r=2.5;

//set parameters for rendering
$fn=resolution;
