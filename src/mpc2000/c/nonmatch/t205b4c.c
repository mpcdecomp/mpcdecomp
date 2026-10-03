/* differs: 150 size 58, image 62; +1 image `enter 8, 0` CL `enter 4, 0`; 172 size 58, image 62; +1 image `enter 8, 0` CL `enter 4, 0` */
extern char PGM_TABLE[1];

void __far smem_transfer_io(void)
{
	int l2;
	int l6;
	int di_;
	int bx_;
	int cx_;

	di_ = PGM_TABLE;
	l6 = 0x18;
loop_05CC6:
	if ((unsigned)*(int far *)*(char far * __near *)(char __near *)di_ <= 2) goto br_05CEA;
	bx_ = 0;
	l2 = 0x40;
	cx_ = l2;
loop_05CD8:
	*(long far *)(*(char far * __near *)(char __near *)di_ + bx_ + 30) = 0L;
	bx_ = bx_ + 0x1d;
	cx_--;
	if (cx_) goto loop_05CD8;
br_05CEA:
	di_ += 4;
	l6--;
	if (l6) goto loop_05CC6;
}
