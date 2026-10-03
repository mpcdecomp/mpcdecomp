/* differs: 150 size 176, image 142; +28 image `cmp dx, word ptr es:[bx + 0x16]` CL `cmp word ptr es:[bx + 0x14], ax`; 172 size 176, image 142; +28 image `cmp dx, word ptr es:[bx + 0x16]` CL `cmp word ptr es:[bx + 0x14], ax` */
extern long G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern char far *SND_CURRENT;
long __far addr_calc_segment(long, int);

int __far sample_data_far_5(void)
{
	char far *l4;

	l4 = *(long far *)(SND_CURRENT + 24) - *(long far *)(SND_CURRENT + 32) + G_EDIT_FIELD_VAL;
	if (l4 >= *(long far *)(SND_CURRENT + 20)) goto br_097A5;
	*(long far *)(SND_CURRENT + 20) = l4;
br_097A5:
	*(long far *)(SND_CURRENT + 24) = l4;
	*(long far *)(SND_CURRENT + 32) = G_EDIT_FIELD_VAL;
	((int *)&l4)[1] = ((int *)&SND_CURRENT)[1];
	*(long far *)((char far *)MK_FP(FP_SEG(l4), *(int *)&SND_CURRENT) + 50) = addr_calc_segment(G_EDIT_FIELD_VAL, 0);
	return (int)addr_calc_segment(G_EDIT_FIELD_VAL, 0);
}
