/* differs: 150 size 80, image 64; +0 image `push ds` CL `push si`; 172 size 80, image 64; +0 image `push ds` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_ASSIGN_VIEW_FIELD;
extern char far *PTR_LCD_STATE;
extern long __near midi_txrx_arm_field(void);

void __far __fastcall __loadds X_0AEF0(void)
{
	unsigned ax;
	long t1;

	ax = G_ASSIGN_VIEW_FIELD;
	if (ax < 0) {
		goto L1;
	}
	if (CC("o", ax)) {
		goto L1;
	}
	if (ax - 1 <= 0) {
		goto L2;
	}
	if (ax == 3) {
		goto L3;
	}
	return;
L2:
	G_ASSIGN_VIEW_FIELD = (char)(G_ASSIGN_VIEW_FIELD + 2);
	goto L4;
L3:
	if (PTR_LCD_STATE == 0) {
		goto L1;
	}
	if (*(char far *)((char far *)*(long *)((char *)&PTR_LCD_STATE + 0) + 19) == 0) {
		goto L1;
	}
	G_ASSIGN_VIEW_FIELD = (char)5;
L4:
	t1 = midi_txrx_arm_field();
L1:
	return;
}
