/* differs: 150 size 168, image 160; +4 image `push si` CL `push ds`; 172 size 168, image 5; +4 image `push si` CL `push ds` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_P_0D24 {
    char f_0;
};
extern char BUF_NAME_EDIT[1];
extern char B_8CAB;
extern char G_FLAG_8CA8;
extern char G_SEQ_MODE;
extern char NAME_EDIT_CASE;
extern long NAME_EDIT_CHANGE_FN;
extern char NAME_EDIT_LAST_PAD;
extern struct g_P_0D24 P_0D24;
extern void __far __fastcall __loadds far_0369C(void);

void __far __fastcall __loadds midi_channel_handler(int ax)
{
	char loc_2;
	char loc_1;
	int ax2;

	if ((char)ax != 0) {
		goto L1;
	}
	goto L2;
L1:
	G_FLAG_8CA8 = (char)1;
	ax2 = ((char)(ax >> 8) << 8 | (unsigned char)((char)(ax >> 8) & 15));
	loc_1 = (char)ax2;
	if ((char)ax2 != NAME_EDIT_LAST_PAD) {
		goto L3;
	}
	if (*(char *)((char *)&P_0D24 + 0 + loc_1 + (NAME_EDIT_CASE << 5)) != BUF_NAME_EDIT[G_SEQ_MODE]) {
		goto L4;
	}
	loc_2 = (char)1;
	goto L5;
L4:
	loc_2 = (char)0;
	goto L5;
L3:
	loc_2 = (char)0;
	if (B_8CAB == 0) {
		goto L6;
	}
	far_0369C();
L6:
	B_8CAB = (char)1;
	NAME_EDIT_LAST_PAD = loc_1;
L5:
	BUF_NAME_EDIT[G_SEQ_MODE] = *(char *)((char *)&P_0D24 + 0 + (loc_2 + NAME_EDIT_CASE * 2 << 4) + loc_1);
	(*(long (far *)())NAME_EDIT_CHANGE_FN)();
L2:
	return;
}
