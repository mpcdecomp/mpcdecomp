/* differs: 150 size 234, image 178; +6 image `mov di, word ptr [bp + 0xe]` CL `mov ax, word ptr [bp + 8]`; 172 size 234, image 178; +6 image `mov di, word ptr [bp + 0xe]` CL `mov ax, word ptr [bp + 8]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_2111;
extern char B_2112;
extern char B_2116;
extern char B_2117;
extern char B_2118;
extern char B_2119;
extern char B_211B;
extern char B_211C;
extern char B_211D;
extern char B_211E;
extern char B_211F;
extern char B_2120;
extern char B_2121;
extern char B_2122;
extern unsigned char P_2110[1];
extern int __far __pascal disp_list_run(unsigned char far *);

void __far __pascal seq_transfer_io(int arg_8, int arg_6, int arg_4, int arg_2, int arg_0)
{
	int ax;
	int ax2;
	int ax3;
	int ax4;
	int ax5;
	int ax6;
	int ax7;
	int ax8;

	ax = arg_2 / 5;
	B_2111 = (char)arg_8;
	B_2112 = *(char *)((char *)&arg_6 + 0);
	B_2116 = (char)arg_8;
	B_2117 = (char)(*(char *)((char *)&arg_6 + 0) + 28);
	arg_4 = arg_4 / 5;
	ax2 = ((char)(arg_4 >> 8) << 8 | (unsigned char)((char)arg_4 + B_2111));
	B_2118 = (char)ax2;
	ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_2112);
	ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 + 9));
	B_2119 = (char)ax4;
	if (arg_0 != 0) {
		goto L1;
	}
	B_211D = (char)((char)arg_8 + 50);
	B_211E = B_2117;
	ax5 = ((char)(arg_8 + 50 >> 8) << 8 | (unsigned char)((char)arg_8 + 50 - (char)ax));
	B_211B = (char)ax5;
	ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)B_2119);
	B_211C = (char)ax6;
	B_211F = (char)11;
	B_2120 = B_2118;
	B_2121 = (char)ax6;
	B_2122 = (char)(50 - *(char *)((char *)&arg_4 + 0) - (char)ax);
	goto L2;
L1:
	ax7 = ((char)(ax4 >> 8) << 8 | (unsigned char)B_2118);
	B_211B = (char)ax7;
	B_211C = B_2119;
	B_211D = (char)((char)ax7 + (char)ax);
	B_211E = B_2117;
	B_211F = (char)0;
L2:
	disp_list_run((unsigned char far *)P_2110);
	return;
}
