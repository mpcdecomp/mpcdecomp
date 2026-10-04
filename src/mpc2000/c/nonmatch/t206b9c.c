/* differs: 150 size 410, image 412; +1B image `imul di, ax, 0x1d` CL `imul si, ax, 0x1d`; 172 size 410, image 5; +5 image `push di` CL `push si` */
extern unsigned char CHANSET_FOLLOW_X;
extern char CHANSET_FOLLOW_Y;
extern unsigned char CHANSET_FXBUS_X;
extern char CHANSET_FXBUS_Y;
extern unsigned char CHANSET_FXLVL_X;
extern char CHANSET_FXLVL_Y;
extern unsigned char CHANSET_IOUT_X;
extern char CHANSET_IOUT_Y;
extern unsigned char CHANSET_IVOL_X;
extern char CHANSET_IVOL_Y;
extern unsigned char CHANSET_PAN_X;
extern char CHANSET_PAN_Y;
extern unsigned char CHANSET_VOL_X;
extern char CHANSET_VOL_Y;
extern char DL_CHANNEL_SETTINGS[1];
extern unsigned char G_PAD_NOTE_BASE;
extern char far *PGM_CURRENT;
extern char P_2A92[1];
extern char P_2A94[1];
extern char P_2A9A[1];
extern unsigned char TBL_CHANSET_FIELD_X;
extern unsigned char TBL_CHANSET_FIELD_Y;
extern char TBL_FX_BUS_LABELS[1];
void __far __pascal cmd_dispatch_1E(int, char, char far *);
void __far __pascal cmd_exec_1E(int, char, int);
void __far __pascal disp_list_run(char far *);
void __far __pascal draw_unsigned_value(int, char, long, int);
void __far field_redraw(void);
char far * __far __pascal note_clamp_flag(int);
char far * __far __pascal note_range_clamp(int);
void __far __pascal timer_value_read_3(char, int, unsigned char);
void __far __pascal timer_value_read_4(char far *, int, int);

void __far __fastcall __loadds timer_read_caller(void)
{
	char far *l4;
	int si_;
	int di_;
	char far *v0;
	char far *v1;

	disp_list_run(DL_CHANNEL_SETTINGS);
	di_ = G_PAD_NOTE_BASE * 29;
	v0 = *(long far *)(PGM_CURRENT + di_ + -985);
	timer_value_read_3(G_PAD_NOTE_BASE, TBL_CHANSET_FIELD_X, TBL_CHANSET_FIELD_Y);
	timer_value_read_4(v0, TBL_CHANSET_FIELD_X + 0x2a, TBL_CHANSET_FIELD_Y);
	l4 = note_clamp_flag(G_PAD_NOTE_BASE);
	draw_unsigned_value(CHANSET_VOL_X, CHANSET_VOL_Y, (long)*l4, 3);
	cmd_exec_1E(CHANSET_PAN_X, CHANSET_PAN_Y, l4[1] - 0x32);
	v1 = note_range_clamp(G_PAD_NOTE_BASE);
	draw_unsigned_value(CHANSET_IVOL_X, CHANSET_IVOL_Y, (long)v1[2], 3);
	if (v0) {
		si_ = ((char far *)MK_FP(FP_SEG(v0), si_))[19];
	} else {
		si_ = 1;
	}
	si_ += 5;
	si_ += 2;
	cmd_dispatch_1E(CHANSET_IOUT_X, CHANSET_IOUT_Y, ((v1[3] & 0xf) + si_) * 4 + P_2A9A);
	cmd_dispatch_1E(CHANSET_FOLLOW_X, CHANSET_FOLLOW_Y, *(int *)(P_2A94 + (v1[3] & 0x80 ? 1 : 0) * 4), *(int *)(P_2A92 + (v1[3] & 0x80 ? 1 : 0) * 4));
	draw_unsigned_value(CHANSET_FXLVL_X, CHANSET_FXLVL_Y, (long)v1[4], 3);
	cmd_dispatch_1E(CHANSET_FXBUS_X, CHANSET_FXBUS_Y, v1[5] * 3 + TBL_FX_BUS_LABELS);
	field_redraw();
}
