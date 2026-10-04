/* differs: 150 size 546, image 328; +1 image `enter 0x12, 0` CL `enter 0x1e, 0`; 172 size 546, image 5; +1 image `enter 0x12, 0` CL `enter 0x1e, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
    int f_4;
    int f_6;
};
extern char G_FLAG_8CA8;
extern char G_SEQ_MODE;
extern int NUM_ENTRY_MAX_HI;
extern int NUM_ENTRY_MIN_HI;
extern char far *WIN_FIELD_VAR;
extern unsigned char WIN_FIELD_MODE;
extern unsigned int NUM_ENTRY_MIN;
extern int NUM_ENTRY_MAX;
extern void __far __pascal __aFFalmul(int, int, int far *);
extern long __far _ldiv(long, long);
extern long __far __pascal field_value_store(long);

void __far __fastcall __loadds field_value_scale(void)
{
	unsigned long loc_12;
	int loc_10;
	int loc_e;
	int loc_c;
	unsigned int loc_a;
	int loc_8;
	int loc_6;
	char loc_4[3];
	char loc_1;
	int ax;
	int ax2;
	int ax3;
	unsigned int ax4;
	unsigned int ax5;
	int dx;
	int dx2;
	int dx3;
	int dx4;
	int flags;
	int flags2;
	int flags3;
	int t1;
	struct s1 far *t2;
	long t3;
	long t4;
	long t5;

	loc_1 = G_SEQ_MODE;
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
	ax3 = (unsigned char)*(char far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
L6:
	loc_a = ax3;
	loc_8 = 0;
	goto L7;
L2:
	ax2 = *(char far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
	goto L8;
L3:
	ax3 = *(int far *)((char far *)*(long *)((char *)&WIN_FIELD_VAR + 0));
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
	loc_a = ax2;
	loc_8 = dx;
L7:
	G_FLAG_8CA8 = (char)0;
	loc_6 = 1;
	*(int *)((char *)&loc_4 + 0) = 0;
	if (loc_1 == 0) {
		goto L10;
	}
L11:
	__aFFalmul(0, 10, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6));
	loc_1 = (char)(loc_1 - 1);
	if (loc_1 != 1) {
		goto L11;
	}
L10:
	t2 = (struct s1 far *)_ldiv(*(long *)((char *)&loc_a + 0), *(long *)((char *)&loc_6 + 0));
	*(int *)((char *)&loc_12 + 0) = t2->f_0;
	loc_10 = t2->f_2;
	loc_e = t2->f_4;
	loc_c = t2->f_6;
	t3 = *(long *)((char *)&NUM_ENTRY_MAX + 0) / *(long *)((char *)&loc_6 + 0);
	flags = (int)(t3 >> 16) - loc_10;
	if (CC("<", flags)) {
		goto L12;
	}
	if (CC(">", flags)) {
		goto L13;
	}
	if ((unsigned int)(int)t3 <= (unsigned int)*(int *)((char *)&loc_12 + 0)) {
		goto L12;
	}
L13:
	*(int *)((char *)&loc_12 + 0) = *(int *)((char *)&loc_12 + 0) + 1;
	loc_10 = (int)(loc_12 + 1L >> 16);
L12:
	t4 = *(long *)((char *)&loc_6 + 0) * loc_12;
	ax4 = (int)t4 + loc_e;
	dx2 = (int)(t4 >> 16) + loc_c + (ax4 < (unsigned int)(int)t4);
	loc_a = ax4;
	loc_8 = dx2;
	flags2 = dx2 - NUM_ENTRY_MIN_HI;
	if (CC(">", flags2)) {
		goto L14;
	}
	if (CC("<", flags2)) {
		goto L15;
	}
	if (ax4 >= NUM_ENTRY_MIN) {
		goto L14;
	}
L15:
	dx3 = NUM_ENTRY_MIN_HI + (NUM_ENTRY_MIN + 1 < NUM_ENTRY_MIN);
	loc_a = NUM_ENTRY_MIN + 1;
	loc_8 = dx3;
L14:
	ax5 = NUM_ENTRY_MAX;
	dx4 = NUM_ENTRY_MAX_HI;
	flags3 = loc_8 - dx4;
	if (CC("<", flags3)) {
		goto L16;
	}
	if (CC(">", flags3)) {
		goto L17;
	}
	if (loc_a <= ax5) {
		goto L16;
	}
L17:
	loc_a = ax5;
	loc_8 = dx4;
L16:
	t5 = field_value_store(*(long *)((char *)&loc_a + 0));
	return;
}
