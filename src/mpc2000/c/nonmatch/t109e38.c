/* differs: 150 size 126, image 128; +1 image `enter 0xc, 0` CL `enter 8, 0`; 172 size 126, image 128; +1 image `enter 0xc, 0` CL `enter 8, 0` */
extern long PTR_SEQ_LIST_HEAD;

int __near __pascal seq_common_handler(char far *p0)
{
	long l4;
	char far *v0;

	v0 = 0L;
	l4 = 0L;
	if (*(int *)&PTR_SEQ_LIST_HEAD != *(int *)&v0) goto br_0A0CB;
	if (((int *)&PTR_SEQ_LIST_HEAD)[1] == *(int *)&v0) goto br_0A103;
br_0A0CB:
	v0 = PTR_SEQ_LIST_HEAD;
	l4 = (long)(v0[19] ? 4 : 2) * *(long far *)(v0 + 28) + 0x28L;
br_0A103:
	*(int far *)p0 = ((int *)&v0)[1];
	*(int far *)(p0 + 6) = *(int *)&v0;
	*(int far *)(p0 + 14) = ((int *)&l4)[1];
	*(int far *)(p0 + 18) = *(int *)&l4;
	return *(int far *)(p0 + 18);
}
