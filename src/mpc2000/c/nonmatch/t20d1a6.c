/* differs: 150 size 94, image 86; +1D image `jne +22` CL `jne +26`; 172 size 94, image 4; +4 image `enter 2, 0` CL `push si` */
extern char B_8FCA;
extern char B_8FCB;
extern char B_8FCC;
extern char B_8FDB;
extern char B_8FDC;
extern char B_8FDD;
extern char P_44D0[1];
extern char P_8FCD[1];
extern char far *SND_CURRENT;
extern char TBL_SOUND_NAMES[1];
void __far __fastcall __loadds stereo_to_mono_up(void);
void __far __pascal win_keys_merge(char far *);

void __far string_int_access(void)
{
	int l2;
	int si_;

	win_keys_merge(P_44D0);
	si_ = 0;
loop_0D67E:
	*(char *)&l2 = SND_CURRENT[si_];
	P_8FCD[si_] = *(char *)&l2 == 0x20 ? 0x5f : *(char *)&l2;
	TBL_SOUND_NAMES[si_] = P_8FCD[si_];
	si_++;
	if (si_ < 0xe) goto loop_0D67E;
	B_8FDB = 0x2d;
	B_8FCA = 0x2d;
	B_8FDD = 0;
	B_8FCC = 0;
	B_8FCB = 0x4c;
	B_8FDC = 0x52;
	stereo_to_mono_up();
}
