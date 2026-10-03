/* differs: 150 size 396, image 214; +4 image `push ds` CL `push di`; 172 size 396, image 214; +4 image `push ds` CL `push di` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_FLAG_8CA8;
extern char G_SEQ_MODE;
extern int NUM_ENTRY_MAX_HI;
extern int NUM_ENTRY_MIN_HI;
extern int NUM_ENTRY_VALUE;
extern int NUM_ENTRY_VALUE_HI;
extern char far *WIN_FIELD_VAR;
extern unsigned char WIN_FIELD_MODE;
extern unsigned int NUM_ENTRY_MIN;
extern unsigned int NUM_ENTRY_MAX;
extern long __far __pascal field_value_store(long);

void __far __fastcall __loadds field_value_commit(void)
{
	int loc_2;
	int ax;
	int ax2;
	unsigned int ax3;
	int ax4;
	int dx;
	int dx2;
	int flags;
	int flags2;
	int flags3;

	if (WIN_FIELD_MODE == 0) {
		goto L1;
	}
	ax = WIN_FIELD_MODE - 1;
	if (ax == 0) {
		goto L2;
	}
	if (ax == 1) {
		goto L3;
	}
	if (ax == 2) {
		goto L4;
	}
	if (ax == 3) {
		goto L5;
	}
	return;
L1:
	ax2 = (unsigned char)*(char far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
L6:
	loc_2 = 0;
	goto L7;
L2:
	ax2 = *(char far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
	goto L8;
L3:
	ax2 = *(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
	goto L6;
L4:
	ax2 = *(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
L8:
	dx = -(ax2 < 0);
	goto L9;
L5:
	ax2 = *(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
	dx = *(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0) + 2);
L9:
	loc_2 = dx;
L7:
	if (G_FLAG_8CA8 == 0) {
		goto L10;
	}
	if (NUM_ENTRY_MIN_HI >= 0) {
		goto L11;
	}
	flags = loc_2;
	if (CC(">", flags)) {
		goto L11;
	}
	if (CC("<", flags)) {
		goto L12;
	}
	if (ax2 != 0) {
		goto L11;
	}
L12:
	NUM_ENTRY_VALUE = -NUM_ENTRY_VALUE;
	NUM_ENTRY_VALUE_HI = NUM_ENTRY_VALUE_HI + (NUM_ENTRY_VALUE != 0);
	NUM_ENTRY_VALUE_HI = -NUM_ENTRY_VALUE_HI;
L11:
	ax3 = NUM_ENTRY_VALUE;
	dx2 = NUM_ENTRY_VALUE_HI;
	flags2 = NUM_ENTRY_MAX_HI - dx2;
	if (CC(">", flags2)) {
		goto L13;
	}
	if (CC("<", flags2)) {
		goto L14;
	}
	if (NUM_ENTRY_MAX >= ax3) {
		goto L13;
	}
L14:
	ax4 = NUM_ENTRY_MAX;
	dx2 = NUM_ENTRY_MAX_HI;
	goto L15;
L13:
	flags3 = NUM_ENTRY_MIN_HI - dx2;
	if (CC("<", flags3)) {
		goto L16;
	}
	if (CC(">", flags3)) {
		goto L17;
	}
	if (NUM_ENTRY_MIN <= ax3) {
		goto L16;
	}
L17:
	ax4 = NUM_ENTRY_MIN;
	dx2 = NUM_ENTRY_MIN_HI;
L15:
	NUM_ENTRY_VALUE = ax4;
	NUM_ENTRY_VALUE_HI = dx2;
L16:
	G_FLAG_8CA8 = (char)0;
	G_SEQ_MODE = (char)0;
	field_value_store(((long)dx2 << 16 | (unsigned)NUM_ENTRY_VALUE));
L10:
	return;
}
