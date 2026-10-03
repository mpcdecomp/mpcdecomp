/* differs: 150 size 234, image 136; +1 image `enter 4, 0` CL `enter 0x10, 0`; 172 size 234, image 136; +1 image `enter 4, 0` CL `enter 0x10, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char f_0;
    char f_1;
    char f_2;
};
extern char BUF_SDS_PACKET;
extern char B_50B9;
extern char B_50BA;
extern char B_50BB;
extern char B_5136;
extern unsigned char P_50BD[1];
extern char SDS_EXCL_CH;
extern char SDS_PKT_CHECKSUM;
extern char SDS_PKT_NUM;
extern char SDS_TX_PACKET;
extern long __near __pascal int4A_sysex_wrapper(char far *, int);

long __near __pascal audio_event_handler(long arg_0)
{
	char loc_3;
	int loc_2;
	int ax;
	int ax2;
	unsigned ax3;
	int ax4;
	int ax5;
	int cx;
	int cx2;
	int cx3;
	unsigned int cx4;
	int cx5;
	int cx6;
	int di;
	int es;
	struct s1 __near *si;

	BUF_SDS_PACKET = (char)-16;
	B_50B9 = (char)126;
	ax = ((char)(ax2 >> 8) << 8 | (unsigned char)SDS_EXCL_CH);
	B_50BA = (char)ax;
	B_50BB = (char)2;
	cx = ((char)(cx2 >> 8) << 8 | (unsigned char)SDS_TX_PACKET);
	cx3 = ((char)(cx >> 8) << 8 | (unsigned char)((char)cx & 127));
	SDS_PKT_NUM = (char)cx3;
	loc_3 = (char)((char)cx3 ^ (char)ax ^ 124);
	si = (struct s1 __near *)P_50BD;
	di = (int)arg_0;
	es = (int)(arg_0 >> 16);
	loc_2 = 40;
L1:
	cx4 = ((char)(*(int far *)MK_FP(es, di) >> 8) - -128 << 8 | (unsigned char)(char)*(int far *)MK_FP(es, di));
	ax3 = ((char)(cx4 >> 8) << 8 | (unsigned char)((unsigned int)(char)(cx4 >> 8) >> 1));
	si->f_0 = (char)ax3;
	loc_3 = (char)(loc_3 ^ (char)ax3);
	cx5 = cx4 >> 2;
	cx6 = ((char)(cx5 >> 8) << 8 | (unsigned char)((char)cx5 & 127));
	si->f_1 = (char)cx6;
	ax4 = ((char)(cx4 >> 8) << 8 | (unsigned char)((char)cx4 & 3));
	ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 << 5));
	si->f_2 = (char)ax5;
	loc_3 = (char)(loc_3 ^ ((char)ax5 ^ (char)cx6));
	si = si + 1;
	di = di + 2;
	loc_2 = loc_2 - 1;
	if (loc_2 != 1) {
		goto L1;
	}
	SDS_PKT_CHECKSUM = loc_3;
	B_5136 = (char)-9;
	return int4A_sysex_wrapper((char far *)&BUF_SDS_PACKET, 127);
}
