extern long G_ZONE_LEN;
extern char G_ZONE_START[1];
extern char far *SND_CURRENT;
extern char ZONE_LEN_FIX;
void __far tgt_09C42(void);
void __far __pascal ui_field_edit(char far *, long, long, long, void (far *)(void), long);

void __far __pascal ui_edit_zone_start(long p2, long p0)
{
	long v0;

	v0 = !ZONE_LEN_FIX ? *(long far *)(SND_CURRENT + 28) : *(long far *)(SND_CURRENT + 28) - G_ZONE_LEN;
	ui_field_edit(G_ZONE_START, p2, 0L, v0, tgt_09C42, p0);
}
