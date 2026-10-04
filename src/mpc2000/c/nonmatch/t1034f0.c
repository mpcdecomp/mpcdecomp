/* differs: 150 +6 image `mov si, word ptr [bp + 8]` CL `mov di, word ptr [bp + 8]`; 172 +6 image `mov si, word ptr [bp + 8]` CL `mov di, word ptr [bp + 8]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char EDIT_CURSOR_H;
extern char EDIT_CURSOR_X;
extern char EDIT_CURSOR_Y;
extern char EDIT_FIELD_Y;
extern char WIN_FIELD_BOX_W;
extern char WIN_FIELD_BOX_R;
extern char WIN_FIELD_BOX_B;
extern int WIN_FIELD_CHANGE_FN;
extern int WIN_FIELD_CHANGE_FN_SEG;
extern char WIN_FIELD_DIGITS;
extern int WIN_FIELD_DRAW_FN;
extern int WIN_FIELD_DRAW_FN_SEG;
extern char WIN_FIELD_X;
extern void __far win_key_nop_stub();

void __near __pascal mpc_query_status(char arg_12, unsigned int arg_10, int arg_8, int arg_6, int arg_4, int arg_2, int arg_0)
{
	int cx;

	__stos2((int far *)&WIN_FIELD_CHANGE_FN, 0, 38);
	WIN_FIELD_DIGITS = *(char *)((char *)&arg_8 + 0);
	EDIT_CURSOR_X = arg_12;
	WIN_FIELD_X = arg_12;
	cx = (unsigned char)*(char *)((char *)&arg_10 + 0);
	EDIT_CURSOR_Y = (char)cx;
	EDIT_FIELD_Y = (char)cx;
	WIN_FIELD_BOX_W = (char)6;
	EDIT_CURSOR_H = (char)8;
	WIN_FIELD_BOX_R = arg_12;
	WIN_FIELD_BOX_B = (char)((char)cx + EDIT_CURSOR_H);
	if ((arg_6 | arg_4) != 0) {
		goto L1;
	}
	WIN_FIELD_DRAW_FN = 0x2d70;
	WIN_FIELD_DRAW_FN_SEG = 0x0b50 /* TEXT2_SEG */;
	goto L2;
L1:
	WIN_FIELD_DRAW_FN = arg_4;
	WIN_FIELD_DRAW_FN_SEG = arg_6;
L2:
	if ((arg_2 | arg_0) != 0) {
		goto L3;
	}
	WIN_FIELD_CHANGE_FN = (int)(unsigned)win_key_nop_stub;
	WIN_FIELD_CHANGE_FN_SEG = 0x0000 /* TEXT1_SEG */;
	return;
L3:
	WIN_FIELD_CHANGE_FN = arg_0;
	WIN_FIELD_CHANGE_FN_SEG = arg_2;
	return;
}
