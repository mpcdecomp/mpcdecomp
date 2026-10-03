/* differs: 150 +4 image `push di` CL `mov ax, word ptr [bp + 6]`; 172 +4 image `push di` CL `mov ax, word ptr [bp + 6]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char FXS_DEFAULT[1];

void __far __pascal _memcpy_3(int arg_2, long arg_0)
{
	long loc_4;
	int loc_2;
	int ax;

	ax = *(int *)((char *)&arg_0 + 0);
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 72;
	*(int *)((char *)&loc_4 + 0) = ax;
	loc_2 = arg_2;
	__movs2(loc_4, (unsigned char far *)FXS_DEFAULT, 72);
	__movs2(arg_0, (unsigned char far *)FXS_DEFAULT, 72);
	return;
}
