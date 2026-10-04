/* differs: 150 +1 image `enter 8, 0` CL `enter 6, 0`; 172 +1 image `enter 8, 0` CL `enter 6, 0` */
extern char DL_VELOCITY_MODULATION[1];
extern unsigned char G_PAD_NOTE_BASE;
extern unsigned char G_VELOCITY_MAX;
extern char SND_CURRENT[1];
void __far __pascal disp_list_run(char far *);
void __far __pascal draw_unsigned_value(int, int, unsigned long, int);
void __far field_redraw(void);
void __far __pascal timer_value_read_3(char, int, int);
void __far __pascal timer_value_read_4(int, int, int, int);
long __near __pascal track_calc_offset2(int);

void __far __fastcall __loadds timer_status_check_1(void)
{
	unsigned l6;
	char far *v0;

	v0 = track_calc_offset2(G_PAD_NOTE_BASE);
	disp_list_run(DL_VELOCITY_MODULATION);
	timer_value_read_3(G_PAD_NOTE_BASE, 0x37, 0xb);
	timer_value_read_4(*(int far *)(v0 + 2), *(int far *)v0, 0x61, 0xb);
	draw_unsigned_value(0x67, 0x17, (long)v0[24], 3);
	draw_unsigned_value(0x67, 0x21, (long)v0[25], 3);
	draw_unsigned_value(0x67, 0x2b, (long)v0[23], 3);
	draw_unsigned_value(0xc7, 0x28, (unsigned long)G_VELOCITY_MAX, 3);
	field_redraw();
	l6 = ((int *)&*(long far *)v0)[1];
	if (!(l6 | *(int *)&*(long far *)v0)) goto L_05D26;
	*(int *)SND_CURRENT = *(int *)&*(long far *)v0;
	*(int *)(SND_CURRENT + 2) = l6;
L_05D26:
	;
}
