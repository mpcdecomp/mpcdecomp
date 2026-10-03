/* differs: 150 size 72, image 76; +4 image `push di` CL `push si`; 172 size 72, image 76; +4 image `push di` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern void __far __pascal display_coord_setup(int);
extern void __far __pascal draw_unsigned_value(int, int, long, int);

void __far __pascal display_draw_coord(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int loc_4;
	int loc_2;
	char loc_1;
	int ax;
	int t1;
	int t2;
	int t3;

	draw_unsigned_value(arg_2, arg_0, *(long *)((char *)&arg_4 + 0), 8);
	ax = ((char)(arg_2 >> 8) << 8 | (unsigned char)((char)arg_2 + 11));
	*(char *)((char *)&loc_2 + 0) = (char)ax;
	loc_1 = (char)((char)arg_0 + 7);
	loc_4 = ax;
	display_coord_setup(loc_2);
	*(char *)((char *)&loc_2 + 0) = (char)(*(char *)((char *)&loc_4 + 0) + 18);
	display_coord_setup(loc_2);
	return;
}
