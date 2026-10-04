/* differs: 150 size 176, image 148; +14 image `jg +7E` CL `jle +19`; 172 size 176, image 148; +14 image `jg +7E` CL `jle +19` */
extern long G_EDIT_FIELD_VAL;
extern int G_EDIT_FIELD_VAL_HI;
extern char far *SND_CURRENT;
long __far addr_calc_segment(long, int);

void __far sample_data_far_1(void)
{
	long l4;
	char far *l8;

	if (*(long far *)(SND_CURRENT + 24) >= G_EDIT_FIELD_VAL) goto br_08B48;
	l4 = *(long far *)(SND_CURRENT + 32) - *(long far *)(SND_CURRENT + 24) + G_EDIT_FIELD_VAL;
	*(long far *)(SND_CURRENT + 32) = l4;
	((int *)&l8)[1] = ((int *)&SND_CURRENT)[1];
	*(long far *)((char far *)MK_FP(FP_SEG(l8), *(int *)&SND_CURRENT) + 50) = addr_calc_segment(l4, 0);
	*(long far *)(SND_CURRENT + 24) = G_EDIT_FIELD_VAL;
br_08B48:
	*(long far *)(SND_CURRENT + 20) = G_EDIT_FIELD_VAL;
}
