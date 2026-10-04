/* differs: 150 size 332, image 246; +1 image `enter 4, 0` CL `enter 0xc, 0`; 172 size 332, image 246; +1 image `enter 4, 0` CL `enter 0xc, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char f_0;
    char f_1;
};
struct s2 {
    char pad_0[7];
    char f_7;
    char f_8;
    char f_9;
    char f_a;
    char f_b;
    char f_c;
};
extern char MIDI_VOLUME_VAL;
extern unsigned char P_0B6C[1];
extern int TBL_0AA4[1];

void __near __pascal midi_parse_channel(struct s2 far *arg_8, struct s1 far *arg_4, int arg_2, int arg_0)
{
	int loc_4;
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	int si;
	int si2;
	long t1;
	long t2;

	loc_2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(arg_2, arg_0 + 3)) & 128;
	si = *(char far *)MK_FP(arg_2, arg_0 + 2) * 127 / 100;
	if (loc_2 == 0) {
		goto L1;
	}
	t1 = (long)(signed char)arg_4->f_0 * (long)(int)si;
	si = (int)t1 + (-((int)t1 < 0) & 127) >> 7;
L1:
	arg_8->f_a = (char)(MIDI_VOLUME_VAL * si / 127);
	arg_8->f_9 = (char)(*(char far *)MK_FP(arg_2, arg_0 + 3) & 15);
	ax2 = arg_4->f_0 * MIDI_VOLUME_VAL / 127;
	ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_4->f_1);
	loc_4 = (char)ax3;
	arg_8->f_7 = (char)(TBL_0AA4[(char)ax3] * ax2 >> 8);
	arg_8->f_8 = (char)(*(int *)(0x0 + (unsigned int)(unsigned)(P_0B6C - loc_4 * 2)) * ax2 >> 8);
	si2 = *(char far *)MK_FP(arg_2, arg_0 + 4) * 127 / 100;
	if (loc_2 == 0) {
		goto L2;
	}
	t2 = (long)(signed char)arg_4->f_0 * (long)(int)si2;
	si2 = (int)t2 + (-((int)t2 < 0) & 127) >> 7;
L2:
	arg_8->f_c = (char)(MIDI_VOLUME_VAL * si2 / 127);
	arg_8->f_b = *(char far *)MK_FP(arg_2, arg_0 + 5);
	return;
}
