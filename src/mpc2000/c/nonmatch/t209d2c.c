/* differs: 150 size 232, image 228; +39 image `jmp +DD` CL `jmp +E0`; 172 size 232, image 228; +39 image `jmp +DD` CL `jmp +E0` */
extern char DL_SOUND_PARAMS[1];
extern char far *SND_CURRENT;
extern char STR_ZONE_ROM_LBL[1];
extern char STR_ZONE_SND_LBL[1];
void __far __pascal cmd_dispatch_1E(int, int, char far *);
void __far __pascal disp_list_run(char far *);
void __far __pascal draw_signed_value(int, int, long, int);
void __far __pascal draw_unsigned_value(int, int, long, int);
void __far far_08010(void);
void __far field_redraw(void);
void __far __pascal mode_dispatch_index(int, int);
int __far __pascal sample_calc_offset(char far *, int);
int __far __pascal sample_check_active(char far *);
void __far __pascal timer_value_read_4(char far *, int, int);
void __far __pascal timer_value_read_5(int, int);

void __far __fastcall __loadds X_0A118(void)
{
	int v1;
	int v2;

	far_08010();
	disp_list_run(DL_SOUND_PARAMS);
	timer_value_read_4(SND_CURRENT, 0x1a, 2);
	mode_dispatch_index(0xc7, 1);
	if (SND_CURRENT) goto X_0A153;
	goto X_0A1F5;
X_0A153:
	switch (sample_check_active(SND_CURRENT)) { case 0: goto L_0A16E; }
	cmd_dispatch_1E(2, 2, STR_ZONE_ROM_LBL);
	draw_unsigned_value(0x31, 0x13, (unsigned long)(unsigned char)SND_CURRENT[17], 3);
	draw_signed_value(0x2b, 0x23, (long)SND_CURRENT[18], 3);
	draw_unsigned_value(0xd3, 0x11, (long)SND_CURRENT[37], 2);
	v1 = sample_calc_offset(SND_CURRENT, 0);
	timer_value_read_5(0xd3, 0x1a, v1);
	v2 = sample_calc_offset(SND_CURRENT, SND_CURRENT[18]);
	timer_value_read_5(0xd3, 0x23, v2);
	goto X_0A1F5;
L_0A16E:
	cmd_dispatch_1E(2, 2, STR_ZONE_SND_LBL);
	draw_unsigned_value(0x31, 0x13, (unsigned long)(unsigned char)SND_CURRENT[17], 3);
	draw_signed_value(0x2b, 0x23, (long)SND_CURRENT[18], 3);
	draw_unsigned_value(0xd3, 0x11, (long)SND_CURRENT[37], 2);
	v1 = sample_calc_offset(SND_CURRENT, 0);
	timer_value_read_5(0xd3, 0x1a, v1);
	v2 = sample_calc_offset(SND_CURRENT, SND_CURRENT[18]);
	timer_value_read_5(0xd3, 0x23, v2);
X_0A1F5:
	field_redraw();
}
