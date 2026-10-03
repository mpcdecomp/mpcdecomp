/* differs: 150 size 154, image 156; +16 image `jle +88` CL `jle +71`; 172 size 154, image 156; +16 image `jle +88` CL `jle +71` */
extern char B_8A0E;
extern int G_ERRNO;
extern char PGM_TABLE[1];
extern char P_64DA[1];
void __far X_05972(void);
int __far int2F_call_fn5(void);
int __far int2F_call_fn6(char far *, int);
void __far __pascal lcd_region_copy(long, char far *);
int __far __pascal program_select_wrapper(int);
void __far __pascal smem_dma_init(int);

int __near main_handler_2(void)
{
	int l2;
	int si_;
	int di_;

	X_05972();
	di_ = 0;
	l2 = di_;
	if (B_8A0E <= 0) goto br_08B70;
loop_08AFF:
	si_ = int2F_call_fn5();
	if (si_ == -1) goto br_08B5C;
	if (si_ <= 0x18) goto br_08B13;
	si_ = 0x17;
br_08B13:
	if (int2F_call_fn6(P_64DA, 0x79b) != 0x79b) goto br_08B5C;
	switch (program_select_wrapper(si_)) { case 0: goto br_08B68; }
	lcd_region_copy(((long *)PGM_TABLE)[si_], P_64DA);
	if (si_) goto br_08B50;
	l2 = 1;
br_08B50:
	di_++;
	if (B_8A0E > di_) goto loop_08AFF;
	goto br_08B70;
br_08B5C:
	G_ERRNO = 4;
loop_08B62:
	return 0;
br_08B68:
	G_ERRNO = 1;
	goto loop_08B62;
br_08B70:
	if (l2) goto br_08B7D;
	smem_dma_init(0);
br_08B7D:
	return 1;
}
