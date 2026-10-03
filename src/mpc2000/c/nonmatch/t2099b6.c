/* differs: 150 size 178, image 172; +29 image `je +85` CL `je +8A`; 172 size 178, image 172; +29 image `je +85` CL `je +8A` */
extern long G_ZONE_END;
extern long G_ZONE_START;
extern int G_ZONE_START_HI;
extern long SND_CURRENT;
extern char SND_EDIT_VIEW;
extern char STR_ROM_4[1];
extern char STR_SND_4[1];
extern char TBL_LEFT_RIGHT_LABELS[1];
extern int ZONE_END_HI;
void __far __pascal cmd_dispatch_1E(int, int, char far *);
void __far __pascal cmd_exec_caller(long, long);
void __far cmd_ratio_calc(void);
void __far __pascal display_draw_coord(long, int, int);
void __far field_redraw(void);
void __far __pascal mode_dispatch_index(int, int);
int __far __pascal sample_check_active(long);
void __far __pascal timer_value_read_4(long, int, int);

void __far __fastcall __loadds zone_start_fine_paint(void)
{
	timer_value_read_4(SND_CURRENT, 0x1a, 2);
	mode_dispatch_index(0xc7, 1);
	if (!SND_CURRENT) goto X_09E27;
	switch (sample_check_active(SND_CURRENT)) { case 0: goto L_09DE6; }
	cmd_dispatch_1E(2, 2, STR_ROM_4);
	display_draw_coord(G_ZONE_START, 0x1a, 0xc);
	display_draw_coord(G_ZONE_END, 0x7a, 0xc);
	cmd_exec_caller(G_ZONE_START, G_ZONE_END);
	goto X_09E27;
L_09DE6:
	cmd_dispatch_1E(2, 2, STR_SND_4);
	display_draw_coord(G_ZONE_START, 0x1a, 0xc);
	display_draw_coord(G_ZONE_END, 0x7a, 0xc);
	cmd_exec_caller(G_ZONE_START, G_ZONE_END);
X_09E27:
	cmd_dispatch_1E(0xd4, 0xc, SND_EDIT_VIEW * 6 + TBL_LEFT_RIGHT_LABELS);
	field_redraw();
	cmd_ratio_calc();
}
