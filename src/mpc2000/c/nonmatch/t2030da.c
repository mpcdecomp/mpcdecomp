/* differs: 150 size 268, image 146; +1 image `enter 6, 0` CL `enter 0x14, 0`; 172 size 268, image 146; +1 image `enter 6, 0` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_FLAG_8CA8;
extern int NUM_ENTRY_VALUE;
extern int NUM_ENTRY_VALUE_HI;
extern char WIN_FIELD_DIGITS;
extern void __far __pascal __aFFalmul(int, int, int far *);

void __far __fastcall __loadds seq_read_data(int ax)
{
	int loc_6;
	int loc_4;
	char loc_2;
	char loc_1;
	unsigned int ax2;
	unsigned int ax3;
	unsigned int ax4;
	unsigned int ax5;
	unsigned int ax6;
	int t1;
	long t2;

	if (G_FLAG_8CA8 != 0) {
		goto L1;
	}
	G_FLAG_8CA8 = (char)1;
	NUM_ENTRY_VALUE = (unsigned char)(char)ax;
	NUM_ENTRY_VALUE_HI = 0;
	return;
L1:
	loc_2 = (char)1;
	loc_6 = 1;
	loc_4 = 0;
	if (WIN_FIELD_DIGITS <= 1) {
		goto L2;
	}
	loc_1 = (char)(WIN_FIELD_DIGITS - 1);
L3:
	__aFFalmul(0, 10, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6));
	loc_1 = (char)(loc_1 - 1);
	if (loc_1 != 1) {
		goto L3;
	}
L2:
	t2 = *(long *)((char *)&NUM_ENTRY_VALUE + 0) % *(long *)((char *)&loc_6 + 0);
	ax2 = (int)t2 * 2;
	ax3 = ax2 * 2;
	ax4 = ax3 + (int)t2;
	ax5 = ax4 * 2;
	ax6 = ax5 + (unsigned char)(char)ax;
	NUM_ENTRY_VALUE = ax6;
	NUM_ENTRY_VALUE_HI = (((int)(t2 >> 16) * 2 + (ax2 < (unsigned int)(int)t2)) * 2 + (ax3 < ax2) + (int)(t2 >> 16) + (ax4 < ax3)) * 2 + (ax5 < ax4) + (ax6 < ax5);
	return;
}
