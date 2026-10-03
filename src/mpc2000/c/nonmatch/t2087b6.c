/* differs: 150 size 172, image 154; +11 image `sub ax, word ptr es:[bx + 0x14]` CL `mov cx, ax`; 172 size 172, image 164; +27 image `mov word ptr [bp - 0xc], ax` CL `mov word ptr [bp - 4], ax` */
extern long G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern char far *SND_CURRENT;
long __far addr_calc_segment(long, int);

void __far sample_data_far_2(void)
{
	long l4;
	long l8;
	char far *l12;

	l4 = *(long far *)(SND_CURRENT + 24) - *(long far *)(SND_CURRENT + 20) + G_EDIT_FIELD_VAL;
	l8 = *(long far *)(SND_CURRENT + 32) - *(long far *)(SND_CURRENT + 24) + l4;
	*(long far *)(SND_CURRENT + 32) = l8;
	((int *)&l12)[1] = ((int *)&SND_CURRENT)[1];
	*(long far *)((char far *)MK_FP(FP_SEG(l12), *(int *)&SND_CURRENT) + 50) = addr_calc_segment(l8, 0);
	*(long far *)(SND_CURRENT + 24) = l4;
	*(long far *)(SND_CURRENT + 20) = G_EDIT_FIELD_VAL;
}
