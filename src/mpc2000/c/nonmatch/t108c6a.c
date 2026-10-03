/* differs: 150 size 96, image 98; +A image `jle +5C` CL `jle +46`; 172 size 96, image 98; +A image `jle +5C` CL `jle +46` */
extern char B_8A0E;
extern int G_ERRNO;
extern char PGM_TABLE[1];
extern char P_64DA[1];
int __far int2F_call_fn6(char far *, int);
void __far __pascal lcd_buffer_copy(int, int, char far *);
int __far __pascal program_select_wrapper(int);

int __near tgt_08BEA(void)
{
	int di_;

	di_ = 0;
	if (B_8A0E <= 0) goto br_08C46;
loop_08BF8:
	if (int2F_call_fn6(P_64DA, 0x77e) == 0x77e) {
		switch (program_select_wrapper(di_)) { case 0: goto br_08C3E; }
		lcd_buffer_copy(*(int __near *)((char __near *)((char *)PGM_TABLE + di_ * 4) + 2), *(int __near *)(char __near *)((char *)PGM_TABLE + di_ * 4), P_64DA);
		di_++;
		if (B_8A0E > di_) goto loop_08BF8;
	} else {
		G_ERRNO = 4;
loop_08C38:
		return 0;
br_08C3E:
		G_ERRNO = 1;
		goto loop_08C38;
	}
br_08C46:
	return 1;
}
