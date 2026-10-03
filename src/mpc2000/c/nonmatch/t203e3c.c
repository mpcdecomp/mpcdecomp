/* differs: 150 size 30, image 26; +7 image `mov ax, word ptr [0x6294]` CL `mov ax, word ptr [0x6292]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_W_64D2 {
    long f_0;
};
extern char B_980B_V150;
extern struct g_W_64D2 W_64D2;
extern int W_64D4;

void __far __fastcall __loadds L_03E3C(void)
{
	long t1;

	if ((W_64D4 | *(int *)((char *)&W_64D2 + 0)) == 0) {
		goto L1;
	}
	t1 = (*(long (far *)())W_64D2.f_0)(B_980B_V150);
L1:
	return;
}
