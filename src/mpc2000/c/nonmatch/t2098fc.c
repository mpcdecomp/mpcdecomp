/* differs: 150 size 134, image 88; +0 image `cmp byte ptr [0x9b42], 0` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_G_ZONE_LEN {
    long f_0;
};
struct g_G_ZONE_END {
    long f_0;
};
struct g_G_ZONE_START {
    long f_0;
};
extern struct g_G_ZONE_END G_ZONE_END;
extern struct g_G_ZONE_LEN G_ZONE_LEN;
extern int G_ZONE_LEN_HI;
extern struct g_G_ZONE_START G_ZONE_START;
extern int G_ZONE_START_HI;
extern int ZONE_END_HI;
extern char ZONE_LEN_FIX;

void __far L_098FC(void)
{
	int dx;
	int dx2;
	int dx3;
	int flags;

	if (ZONE_LEN_FIX == 0) {
		goto L1;
	}
	dx = (int)(G_ZONE_END.f_0 - G_ZONE_LEN.f_0 >> 16);
	*(int *)((char *)&G_ZONE_START + 0) = *(int *)((char *)&G_ZONE_END + 0) - *(int *)((char *)&G_ZONE_LEN + 0);
	G_ZONE_START_HI = dx;
	return;
L1:
	flags = ZONE_END_HI - G_ZONE_START_HI;
	if (CC(">", flags)) {
		goto L2;
	}
	if (CC("<", flags)) {
		goto L3;
	}
	if ((unsigned int)*(int *)((char *)&G_ZONE_END + 0) >= (unsigned int)*(int *)((char *)&G_ZONE_START + 0)) {
		goto L2;
	}
L3:
	dx2 = ZONE_END_HI;
	*(int *)((char *)&G_ZONE_START + 0) = *(int *)((char *)&G_ZONE_END + 0);
	G_ZONE_START_HI = dx2;
L2:
	dx3 = (int)(G_ZONE_END.f_0 - G_ZONE_START.f_0 >> 16);
	*(int *)((char *)&G_ZONE_LEN + 0) = *(int *)((char *)&G_ZONE_END + 0) - *(int *)((char *)&G_ZONE_START + 0);
	G_ZONE_LEN_HI = dx3;
	return;
}
