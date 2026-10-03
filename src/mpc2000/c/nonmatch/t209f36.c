/* differs: 150 size 136, image 138; +9 image `mov dx, word ptr [0x8d06]` CL `mov ax, word ptr [0x8d06]`; 172 size 136, image 138; +9 image `mov dx, word ptr [0x8f46]` CL `mov ax, word ptr [0x8f46]` */
extern unsigned char B_8F5F;
extern int G_ERRNO;
extern char PTR_MIDI_STATE[1];
extern char P_8F4E[1];
extern char TBL_SOUND_NAMES[1];
void __far __pascal bcd_convert(int, int);
void __far err_msg_report(void);
int __far int2F_call_fn6(char far *, int);
void __far int2F_dispatch_10(void);
void __far __pascal program_select(int);
int __far __pascal range_process(char far *, int, int, int, int);
int __far __pascal range_smem_setup(int, int);
void __far sample_process_1(void);

int __far range_seq_caller(void)
{
	char l6[6];
	int si_;

	si_ = *(int *)PTR_MIDI_STATE;
	*(int *)(l6 + 4) = *(int *)(PTR_MIDI_STATE + 2);
	if (int2F_call_fn6(l6, 2) != 2) goto br_0A396;
	switch (range_process(TBL_SOUND_NAMES, 1, *(int *)l6 * 0x11, 1, 0x880)) { case 0: goto br_0A396; }
	switch (range_smem_setup(*(int *)(l6 + 4), si_)) { case 0: goto br_0A396; }
	int2F_dispatch_10();
	bcd_convert(*(int *)(l6 + 4), si_ + 2, P_8F4E);
	program_select(B_8F5F);
	return sample_process_1();
br_0A396:
	int2F_dispatch_10();
	G_ERRNO = 4;
	err_msg_report();
	return 0;
}
