/* differs: 150 size 56, image 68; +0 image `les bx, ptr [0x9a6c]` CL `enter 8, 0`; 172 size 56, image 68; +0 image `les bx, ptr [0x9cae]` CL `enter 8, 0` */
extern char far *SND_CURRENT;
extern long W_3064;
void __far __pascal voice_start_sample(long, long, long);

void __far X_07ED0(void)
{
	long l4;
	long l8;

	l4 = *(long far *)(SND_CURRENT + 24);
	l8 = *(long far *)(SND_CURRENT + 28);
	W_3064 = SND_CURRENT;
	voice_start_sample(W_3064, l4, l8);
}
