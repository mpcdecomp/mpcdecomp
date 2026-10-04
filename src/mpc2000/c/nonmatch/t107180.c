/* differs: 150 size 262, image 256; +1 image `enter 0x14, 0` CL `enter 0xc, 0`; 172 size 262, image 256; +1 image `enter 0x14, 0` CL `enter 0xc, 0` */
extern char G_REC_MODE;
extern long REC_BUF_ADDR;
extern int REC_BUF_ADDR_HI;
extern int REC_DMA_POS;
extern long REC_LENGTH;
extern int REC_LENGTH_HI;
extern unsigned REC_PREREC_LEN;
void __far __pascal smem_copy_buffered(long, long, unsigned long);

void __near lcd_update_handler(void)
{
	unsigned di_;
	unsigned si_;
	long l20;
	unsigned long l12;
	long l4;

	if (!REC_PREREC_LEN) goto lcd_compute_coords_71FB;
	di_ = REC_DMA_POS;
	l4 = REC_LENGTH + REC_BUF_ADDR;
	si_ = REC_PREREC_LEN;
	if (di_ < si_) goto L_07178;
	smem_copy_buffered((unsigned long)di_ - (unsigned long)si_ + 0x10000L, REC_BUF_ADDR, (unsigned long)si_);
	if (G_REC_MODE != 2) goto lcd_compute_coords_71FB;
	smem_copy_buffered((unsigned long)di_ - (unsigned long)si_ + 0x11140L, l4, (unsigned long)si_);
	goto lcd_compute_coords_71FB;
L_07178:
	si_ -= di_;
	*(int *)&l12 = si_;
	((int *)&l12)[1] = 0;
	smem_copy_buffered(0x11140L - (unsigned long)si_, REC_BUF_ADDR, (unsigned long)si_);
	smem_copy_buffered(0x10000L, REC_BUF_ADDR + l12, (unsigned long)di_);
	if (G_REC_MODE != 2) goto lcd_compute_coords_71FB;
	*(int *)&l20 = si_;
	((int *)&l20)[1] = 0;
	smem_copy_buffered(0x12280L - (unsigned long)si_, l4, (unsigned long)si_);
	smem_copy_buffered(0x11140L, l4 + l20, (unsigned long)di_);
lcd_compute_coords_71FB:
	;
}
