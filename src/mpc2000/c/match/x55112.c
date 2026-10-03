extern long C0_W_098DC;
extern int C0_W_098DE;
extern long C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C2_W_06366[1];
extern char C2_W_06458[1];
extern long C2_W_08DBE;
extern int C2_W_SND_DEBUG_CURSOR;
void __far handler_set_install(char far *);
int __far sound_list_contains(long);

void __far far_55112(long p0)
{
	C2_W_08DBE = p0;
	handler_set_install(C2_W_06366);
	if (sound_list_contains(C0_W_0D7C2)) goto br_5514E;
	C0_W_0D7C2 = C0_W_098DC;
br_5514E:
	if (C2_W_SND_DEBUG_CURSOR < 0) goto br_5515C;
	if ((unsigned)C2_W_SND_DEBUG_CURSOR < 1) goto br_55162;
br_5515C:
	C2_W_SND_DEBUG_CURSOR = 0;
br_55162:
	((int (__far *)(void))*(long *)(C2_W_06458 + C2_W_SND_DEBUG_CURSOR * 42))();
}
