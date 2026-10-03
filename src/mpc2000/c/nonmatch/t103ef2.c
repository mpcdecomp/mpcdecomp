/* differs: 150 size 84, image 60; +0 image `push ds` CL `push si`; 172 size 84, image 60; +0 image `push ds` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char FILTER4_CURSOR;
extern long __near midi_note_handler(void);

void __far __fastcall __loadds filter4_down(void)
{
	unsigned ax;
	long t1;

	ax = FILTER4_CURSOR;
	if (ax < 0) {
		goto L1;
	}
	if (CC("o", ax)) {
		goto L1;
	}
	if (ax - 1 <= 0) {
		goto L2;
	}
	if (ax - 1 < 8) {
		goto L1;
	}
	if (ax - 11 <= 0) {
		goto L3;
	}
	if (ax - 12 < 0) {
		goto L1;
	}
	if (ax - 13 <= 0) {
		goto L4;
	}
L1:
	FILTER4_CURSOR = (unsigned char)(FILTER4_CURSOR + 5);
	goto L5;
L2:
	FILTER4_CURSOR = (unsigned char)(FILTER4_CURSOR + 2);
	goto L5;
L3:
	FILTER4_CURSOR = (unsigned char)13;
L5:
	t1 = midi_note_handler();
L4:
	return;
}
