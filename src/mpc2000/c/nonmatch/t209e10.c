/* differs: 150 size 298, image 294; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 298, image 294; +1 image `enter 4, 0` CL `enter 6, 0` */
void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern char B_8F5F;
extern char B_8F60;
extern int G_ERRNO;
extern char PGM_TABLE[1];
extern char PTR_MIDI_STATE[1];
extern char P_8D44[1];
extern char P_8F4E[1];
extern char TBL_SOUND_NAMES[1];
void __far X_05972(void);
void __far __fstrncpy(char far *, long, int);
void __far err_msg_report(void);
int __far far_059BC(void);
void __far far_0A682(void);
void __far far_0A6FA(void);
int __far int2F_call_fn6(char far *, int);
void __far int2F_dispatch_10(void);
int __far __pascal program_select_wrapper(int);
void __far range_seq_caller(void);
void __far sample_data_load_1(void);

int __far midi_realtime_stop(long p0, int p2, int p3, char p4, int p5)
{
	char l4[4];
	int si_;
	int dx_;

	memset(PTR_MIDI_STATE, 0, 0x1e);
	memset(P_8D44, 0, 0x200);
	__fstrncpy(P_8F4E, p0, 0x10);
	B_8F5F = (char)far_059BC();
	B_8F60 = p4;
	si_ = TBL_SOUND_NAMES;
	*(int *)(l4 + 2) = 0x80;
	dx_ = *(int *)(l4 + 2);
loop_0A243:
	((char __near *)si_)[0] = 0;
	si_ += 0x11;
	dx_--;
	if (dx_) goto loop_0A243;
	if (!p5) goto br_0A261;
	X_05972();
	sample_data_load_1();
	B_8F5F = 0;
br_0A261:
	if (B_8F5F < 0) {
		G_ERRNO = 0xa;
	} else {
		if (!program_select_wrapper(B_8F5F)) {
			G_ERRNO = 1;
		} else {
			*(long *)PTR_MIDI_STATE = ((long *)PGM_TABLE)[B_8F5F];
			G_ERRNO = 4;
			if (int2F_call_fn6(l4, 2) != 2) goto br_0A312;
			if (l4[0] != 7) goto br_0A312;
			switch ((unsigned char)l4[1]) { case 0: goto T2_br_0A2DC; case 1: goto tgt_0A2F2; case 4: goto tgt_0A308; }
			G_ERRNO = 6;
			goto br_0A312;
T2_br_0A2DC:
			if (p2 != 0x1200) goto br_0A312;
			if (p3) goto br_0A312;
			return far_0A6FA();
tgt_0A2F2:
			if (p2 != 0x101d) goto br_0A312;
			if (p3) goto br_0A312;
			return far_0A682();
tgt_0A308:
			return range_seq_caller();
		}
	}
br_0A312:
	int2F_dispatch_10();
	err_msg_report();
	return 0;
}
