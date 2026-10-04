#include "mpc2k.h"

#pragma intrinsic(memset)

int __far midi_string_setup(void)
{
	char l18[18];

	G_ERRNO = _setjmp(l18);
	switch (G_ERRNO) { case 0: goto br_0BACC; }
	int2F_dispatch_10();
	err_msg_report();
	return 0;
br_0BACC:
	memset(G_SMEM_STATE_A, 0, 0x8ff);
	sample_io_handler(l18, G_SMEM_STATE_A, 2);
	if (G_SMEM_STATE_A[0] == 2) goto br_0BB08;
	if (G_SMEM_STATE_A[0] == 5) goto br_0BB08;
	_longjmp(l18, ERR_FILE_DAMAGED);
br_0BB08:
	*(long *)W_5BBC = 0L;
	sample_io_handler(l18, W_5BBC, 3);
	sample_io_handler(l18, TBL_MPC60_SND_HDR, 0x7d6);
	if (G_SMEM_STATE_A[0] != 5) goto br_0BB48;
	sample_io_handler(l18, P_6396, 1);
br_0BB48:
	sample_io_handler(l18, TBL_MPC60_PAD_SND, 0x22);
	if (G_SMEM_STATE_A[0] == 2) goto L_0BB66;
	if (G_SMEM_STATE_B) goto br_0BB6B;
L_0BB66:
	int2F_call_fn5();
br_0BB6B:
	sample_io_handler(l18, P_63B9, 0xa0);
	if (!G_SMEM_STATE_B) goto br_0BB93;
	sample_io_handler(l18, TBL_6459, 0x60);
br_0BB93:
	int2F_dispatch_10();
	return 1;
}
