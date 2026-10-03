/* differs: 150 size 128, image 122; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 128, image 122; +1 image `enter 4, 0` CL `enter 6, 0` */
extern char PTR_DMA_STATE[1];
extern char far *PTR_SAMPLE_DATA;
int __far __fstricmp(int, int, int, int);

long __far __pascal sample_data_load_2(int p1, int p0)
{
	int di_;
	int dx_;
	char far *v0;

	v0 = *(long far *)(PTR_SAMPLE_DATA + 40);
	dx_ = ((int *)&v0)[1];
	if (*(int *)&v0 != *(int *)PTR_DMA_STATE) goto L_079FD;
	if (dx_ == *(int *)(PTR_DMA_STATE + 2)) goto br_07A4A;
L_079FD:
	di_ = p0;
loop_07A00:
	if (*(int *)&v0 != di_) goto br_07A0B;
	if (dx_ == p1) goto br_07A1D;
br_07A0B:
	switch (__fstricmp(*(int *)&v0, dx_, di_, p1)) { case 0: goto br_07A3E; }
br_07A1D:
	v0 = *(long far *)(v0 + 40);
	dx_ = ((int *)&v0)[1];
	if (*(int *)&v0 != *(int *)PTR_DMA_STATE) goto loop_07A00;
	if (dx_ != *(int *)(PTR_DMA_STATE + 2)) goto loop_07A00;
	goto br_07A4A;
br_07A3E:
	return v0;
br_07A4A:
	return 0L;
}
