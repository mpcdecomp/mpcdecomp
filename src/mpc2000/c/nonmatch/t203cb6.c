/* differs: 150 matches */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char G_PAD_INDEX;

void __far __fastcall __loadds L_03CB6(void)
{
	if (G_PAD_INDEX >= 15) {
		goto L1;
	}
	G_PAD_INDEX = (unsigned char)(G_PAD_INDEX + 1);
L1:
	return;
}
