/* differs: 150 size 228, image 226; +4 image `push ds` CL `push si`; 172 size 228, image 226; +4 image `push ds` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_ZONE_END;
extern int G_ZONE_START;
extern int G_ZONE_START_HI;
extern char PLAY_X_MODE;
extern char far *SND_CURRENT;
extern int W_3064;
extern int W_3066;
extern unsigned char X_07E68[1];
extern int ZONE_END_HI;
extern long __far __pascal voice_start_sample(int, int, long, long);

void __far __fastcall __loadds edit_range_select(void)
{
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_2;
	unsigned int ax;
	int ax2;
	int ax3;
	int bx;
	int dx;
	int dx2;
	int dx3;
	int dx4;
	int dx5;
	int es;

	if (SND_CURRENT != 0) {
		goto L1;
	}
	goto L2;
L1:
	if ((W_3066 | W_3064) == 0) {
		goto L3;
	}
	goto L2;
L3:
	ax = PLAY_X_MODE;
	if (ax <= 5) {
		goto L4;
	}
	goto L2;
L4:
	switch ((unsigned int)(unsigned)(X_07E68 + ax * 2)) {
	case 0:
		goto L5;
	case 1:
		goto L6;
	case 2:
		goto L7;
	case 3:
		goto L8;
	case 4:
		goto L9;
	case 5:
		goto L10;
	}
L5:
	loc_2 = 0;
	loc_4 = 0;
	goto L11;
L6:
	dx4 = G_ZONE_START_HI;
	loc_4 = G_ZONE_START;
	loc_2 = dx4;
	ax2 = G_ZONE_END;
	dx2 = ZONE_END_HI;
	goto L12;
L7:
	loc_2 = 0;
	loc_4 = 0;
	ax2 = G_ZONE_START;
	dx2 = G_ZONE_START_HI;
	goto L12;
L8:
	dx3 = ZONE_END_HI;
	loc_4 = G_ZONE_END;
	loc_2 = dx3;
L11:
	bx = (int)*(long *)((char *)&SND_CURRENT + 0);
	es = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	goto L13;
L9:
	loc_2 = 0;
	loc_4 = 0;
	ax2 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 20);
	dx2 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 22);
	goto L12;
L10:
	bx = (int)*(long *)((char *)&SND_CURRENT + 0);
	es = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	dx = *(int far *)MK_FP(es, bx + 26);
	loc_4 = *(int far *)MK_FP(es, bx + 24);
	loc_2 = dx;
L13:
	ax2 = *(int far *)MK_FP(es, bx + 28);
	dx2 = *(int far *)MK_FP(es, bx + 30);
L12:
	loc_8 = ax2;
	loc_6 = dx2;
	ax3 = *(int *)((char *)&SND_CURRENT + 0);
	dx5 = *(int *)((char *)&SND_CURRENT + 2);
	W_3064 = ax3;
	W_3066 = dx5;
	voice_start_sample(dx5, ax3, *(long *)((char *)&loc_4 + 0), *(long *)((char *)&loc_8 + 0));
L2:
	return;
}
