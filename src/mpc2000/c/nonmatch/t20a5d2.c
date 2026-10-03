/* differs: 150 size 164, image 162; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 164, image 162; +1 image `enter 4, 0` CL `enter 6, 0` */
void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern int G_ERRNO;
extern char PTR_MIDI_STATE[1];
extern char P_8D44[1];
extern char TBL_SOUND_NAMES[1];
void __far X_08A86(void);
void __far X_08B84(void);
void __far err_msg_report(void);
int __far int2F_call_fn6(char far *, int);
void __far int2F_dispatch_10(void);
void __far sample_data_load_1(void);
void __far smem_init_handler(void);

int __far midi_realtime_stop2(int x0, int x1, int p2, int p3)
{
	char l4[4];
	int bx_;
	int dx_;

	G_ERRNO = 4;
	memset(PTR_MIDI_STATE, 0, 0x1e);
	memset(P_8D44, 0, 0x200);
	bx_ = TBL_SOUND_NAMES;
	*(int *)(l4 + 2) = 0x80;
	dx_ = *(int *)(l4 + 2);
loop_0AA00:
	((char __near *)bx_)[0] = 0;
	bx_ = bx_ + 0x11;
	dx_--;
	if (dx_) goto loop_0AA00;
	if (int2F_call_fn6(l4, 2) != 2) goto loop_t2_0AA68;
	if (l4[0] != 0xa) goto loop_t2_0AA68;
	sample_data_load_1();
	switch ((unsigned char)l4[1]) { case 0: goto tgt_0AA42; case 1: goto tgt_0AA58; case 4: goto tgt_0AA60; }
	G_ERRNO = 6;
	goto loop_t2_0AA68;
tgt_0AA42:
	if (p2 != -0x426d) goto loop_t2_0AA68;
	if (p3) goto loop_t2_0AA68;
	return X_08B84();
tgt_0AA58:
	return X_08A86();
tgt_0AA60:
	return smem_init_handler();
loop_t2_0AA68:
	int2F_dispatch_10();
	err_msg_report();
	return 0;
}
