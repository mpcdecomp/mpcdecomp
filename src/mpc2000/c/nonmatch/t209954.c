/* differs: 150 size 100, image 84; +9 image `je +20` CL `jne +16`; 172 size 100, image 84; +9 image `je +20` CL `jne +16` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_G_ZONE_START {
    long f_0;
};
struct g_G_ZONE_END {
    long f_0;
};
extern struct g_G_ZONE_END G_ZONE_END;
extern struct g_G_ZONE_START G_ZONE_START;
extern char far *SND_CURRENT;
extern char ZONE_LEN_FIX;
extern long __far L_09CE8();
extern long __far __pascal ui_field_edit(struct g_G_ZONE_END far *, int, int, int, int, int, int, void far *, int, int);

long __far __pascal ui_edit_zone_end(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int loc_2;
	int ax;

	if (ZONE_LEN_FIX == 0) {
		goto L1;
	}
	ax = *(int *)((char *)&G_ZONE_END + 0) - *(int *)((char *)&G_ZONE_START + 0);
	loc_2 = (int)(G_ZONE_END.f_0 - G_ZONE_START.f_0 >> 16);
	goto L2;
L1:
	ax = 0;
	loc_2 = ax;
L2:
	return ui_field_edit((struct g_G_ZONE_END far *)&G_ZONE_END, arg_6, arg_4, loc_2, ax, *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 30), *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 28), MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)L_09CE8), arg_2, arg_0);
}
