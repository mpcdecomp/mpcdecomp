/* differs: 150 +4 image `push si` CL `push di`; 172 +4 image `push si` CL `push di` */
extern char DL_VELO_ENV_FILTER[1];
extern unsigned char G_PAD_NOTE_BASE;
extern unsigned char G_VELOCITY_MAX;
extern char far *SND_CURRENT;
void __far __pascal disp_list_run(char far *);
void __far __pascal draw_unsigned_value(int, int, unsigned long, int);
void __far field_redraw(void);
void __far __pascal seq_transfer_io(int, int, int, int, int);
void __far __pascal timer_value_read_3(char, int, int);
void __far __pascal timer_value_read_4(long, int, int);
char far * __near __pascal track_calc_offset2(int);

void __far __fastcall __loadds timer_status_check_2(void)
{
	char far *v0;
	char far *v1;

	v0 = track_calc_offset2(G_PAD_NOTE_BASE);
	disp_list_run(DL_VELO_ENV_FILTER);
	timer_value_read_3(G_PAD_NOTE_BASE, 0x37, 0xb);
	timer_value_read_4(*(long far *)v0, 0x61, 0xb);
	draw_unsigned_value(0x3d, 0x17, (long)v0[20], 3);
	draw_unsigned_value(0x3d, 0x21, (long)v0[21], 3);
	draw_unsigned_value(0x3d, 0x2b, (long)v0[22], 3);
	draw_unsigned_value(0xd3, 0x1c, (long)v0[26], 3);
	draw_unsigned_value(0xd3, 0x28, (unsigned long)G_VELOCITY_MAX, 3);
	seq_transfer_io(0x5b, 0x15, v0[20], v0[21], 1);
	field_redraw();
	v1 = *(long far *)v0;
	if (!v1) goto L_05FBB;
	SND_CURRENT = v1;
L_05FBB:
	;
}
