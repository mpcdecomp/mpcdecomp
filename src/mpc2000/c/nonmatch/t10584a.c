/* differs: 150 size 478, image 390; +1 image `enter 8, 0` CL `enter 0x18, 0`; 172 size 478, image 390; +1 image `enter 8, 0` CL `enter 0x18, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char G_PAD_NOTE_BASE;
extern char PARAMS_CURSOR;
extern unsigned char PGM_SLOT[1];
extern char WIN_FIELD_BOX_W;
extern unsigned char X_057F0[1];
extern void __far __fastcall __loadds L_05D2A();
extern void __far L_05EEE();
extern void __far __fastcall __loadds L_05FC0();
extern void __far __fastcall __loadds L_0620E();
extern void __far __fastcall __loadds L_063DE();
extern void __far __fastcall __loadds L_06570();
extern void __far __fastcall __loadds T1_L_06702();
extern long __far __pascal install_handler_15(int, int);
extern long __far __pascal seq_write_data(unsigned char far *, int, int, int, void far *, void far *);
extern long __far __pascal status_read_6A_2(int, int, int, int, int, int, int, int, int, int, int);
extern long __far __pascal status_read_6A_3(int, int, int, int, int, int, int, int, int, int, int);
extern long __far __pascal timer_value_read_1(unsigned char far *, int, int, int);
extern long __near __pascal track_calc_offset2(int);
extern long __far __pascal voice_trigger_full(int, int, int, int, int, int, int, int);

long __near timer_dma_sync(void)
{
	int loc_2;
	unsigned int ax;
	int di;
	int p16;
	int p162;
	unsigned p18;
	int p182;
	int p20;
	int p202;
	int p22;
	int p222;
	int p24;
	int p242;
	int p26;
	int p262;
	int p28;
	int si;
	long t1;
	long t2;
	long t3;
	long t4;
	long t5;
	long t6;

	t1 = track_calc_offset2(G_PAD_NOTE_BASE);
	di = (int)t1;
	ax = PARAMS_CURSOR;
	if (ax > 8) {
		goto L1;
	}
	switch ((unsigned int)(unsigned)(X_057F0 + ax * 2)) {
	case 0:
		goto L2;
	case 1:
		goto L3;
	case 2:
		goto L4;
	case 3:
		goto L5;
	case 4:
		goto L6;
	case 5:
		goto L7;
	case 6:
		goto L8;
	case 7:
		goto L9;
	case 8:
		goto L10;
	}
L1:
	PARAMS_CURSOR = (char)0;
	goto L2;
L3:
	si = (int)(unsigned)L_05D2A;
	loc_2 = 0x0000 /* TEXT1_SEG */;
	p162 = (int)(t1 >> 16);
	p182 = di + 15;
	p202 = 0;
	p222 = 100;
	p242 = 3;
	p262 = 44;
	p28 = 22;
L11:
	t5 = status_read_6A_3(p162, p182, p202, p222, p242, p262, p28, 0, 0, 0, 0);
	goto L12;
L4:
	si = (int)(unsigned)L_05D2A;
	loc_2 = 0x0000 /* TEXT1_SEG */;
	p162 = (int)(t1 >> 16);
	p182 = di + 16;
	p202 = 0;
	p222 = 100;
	p242 = 3;
	p262 = 44;
	p28 = 31;
	goto L11;
L5:
	si = (int)(unsigned)L_05D2A;
	loc_2 = 0x0000 /* TEXT1_SEG */;
	p16 = (int)(t1 >> 16);
	p18 = di + 17;
	p20 = 1;
	p22 = 44;
	p24 = 40;
	p26 = 6;
	goto L13;
L6:
	si = (int)(unsigned)T1_L_06702;
	loc_2 = 0x0000 /* TEXT1_SEG */;
	t3 = timer_value_read_1((unsigned char far *)&G_PAD_NOTE_BASE, 74, 2, 0);
	WIN_FIELD_BOX_W = (char)-90;
	goto L12;
L7:
	si = (int)(unsigned)L_05FC0;
	loc_2 = 0x0000 /* TEXT1_SEG */;
	p162 = (int)(t1 >> 16);
	p182 = di + 18;
	p202 = 0;
	p222 = 100;
	p242 = 3;
	p262 = 164;
	p28 = 25;
	goto L11;
L8:
	si = (int)(unsigned)L_05FC0;
	loc_2 = 0x0000 /* TEXT1_SEG */;
	p162 = (int)(t1 >> 16);
	p182 = di + 19;
	p202 = 0;
	p222 = 15;
	p242 = 2;
	p262 = 170;
	p28 = 36;
	goto L11;
L9:
	si = (int)(unsigned)L_0620E;
	loc_2 = 0x0000 /* TEXT1_SEG */;
	t2 = status_read_6A_2((int)(t1 >> 16), di + 13, -240, 240, 3, 220, 12, 0, 0, 0, 0);
	goto L12;
L10:
	si = (int)(unsigned)L_063DE;
	loc_2 = 0x0000 /* TEXT1_SEG */;
	p16 = (int)(t1 >> 16);
	p18 = di + 10;
	p20 = 2;
	p22 = 190;
	p24 = 40;
	p26 = 9;
L13:
	t4 = voice_trigger_full(p16, p18, p20, p22, p24, p26, 0, 0);
L12:
	return install_handler_15(loc_2, si);
L2:
	t6 = seq_write_data((unsigned char far *)PGM_SLOT, 1, 26, 2, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)L_05EEE), MK_FP(0x0000 /* TEXT1_SEG */, (unsigned int)(unsigned)L_06570));
	WIN_FIELD_BOX_W = (char)12;
	return t6;
}
