/* differs: 150 size 276, image 154; +1 image `enter 4, 0` CL `enter 0x7a, 0`; 172 size 276, image 5; +1 image `enter 4, 0` CL `enter 0x7a, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SND_CURRENT {
    int f_0;
    int f_2;
};
extern int G_ERRNO;
extern unsigned char G_PAD_NOTE_BASE;
extern long PGM_CURRENT;
extern unsigned char P_5140[1];
extern struct g_SND_CURRENT SND_CURRENT;
extern long __far err_msg_report(void);
extern int __near fn_0B642(void);
extern long __far __pascal sample_data_load_2(unsigned char far *);
extern long __far __pascal sample_pool_add(unsigned char far *, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int);
extern long __near __pascal ui_sound_dialog_draw(int);
extern long __far voice_release_all(void);

void __far __fastcall __loadds smem_data_read_handler(void)
{
	char loc_40[64];
	int ax;
	int bx;
	int di;
	int es;
	int p18;
	int p20;
	int p22;
	int p24;
	int p26;
	int p28;
	int p30;
	int p32;
	int p34;
	int p36;
	int p38;
	int p40;
	int p42;
	int p44;
	int p46;
	int p48;
	int p50;
	int p52;
	int p54;
	int p56;
	int p58;
	int p60;
	int p62;
	int p64;
	int p66;
	long t1;
	long t2;
	long t3;
	long t4;
	long t5;
	long t6;

	t1 = voice_release_all();
	t2 = sample_data_load_2((unsigned char far *)P_5140);
	if (((int)(t2 >> 16) | (int)t2) != 0) {
		G_ERRNO = 8;
		t3 = err_msg_report();
		t4 = ui_sound_dialog_draw(0);
		return;
	}
	__movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_40), (unsigned char far *)P_5140, 54);
	t5 = sample_pool_add((unsigned char far *)P_5140, p18, p20, p22, p24, p26, p28, p30, p32, p34, p36, p38, p40, p42, p44, p46, p48, p50, p52, p54, p56, p58, p60, p62, p64, p66);
	if (((int)(t5 >> 16) | (int)t5) == 0) {
		G_ERRNO = 9;
		t6 = err_msg_report();
		return;
	}
	if (G_PAD_NOTE_BASE - 35 <= 63) {
		di = G_PAD_NOTE_BASE * 29;
		bx = (int)PGM_CURRENT;
		es = (int)(PGM_CURRENT >> 16);
		*(int far *)MK_FP(es, bx - 0x3d9 + di) = (int)t5;
		*(int far *)MK_FP(es, bx - 0x3d7 + di) = (int)(t5 >> 16);
	}
	SND_CURRENT.f_0 = (int)t5;
	SND_CURRENT.f_2 = (int)(t5 >> 16);
	fn_0B642();
	return;
}
