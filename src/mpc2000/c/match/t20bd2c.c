#include "mpc2k.h"

int __far __setjmp(char far *);

int __far sample_load_step(void)
{
	int l2;
	char l20[18];

	disp_list_run(DL_LOADING);
	if (!(int2F_call_fn4(P_56AB) + 1)) {
		return 1;
	}
	switch (__setjmp(l20)) { case 0: goto br_0C1B8; }
	((void (__far __pascal *)(long))sample_validate_ptr)((*(long *)&W_50A0));
	int2F_dispatch_10();
	G_ERRNO = ERR_FILE_DAMAGED;
	err_msg_report();
	return 0;
br_0C1B8:
	sample_io_handler(l20, &l2, 2);
	if (*(char *)&l2 == 6) goto br_0C1DE;
	_longjmp(l20, ERR_FILE_DAMAGED);
br_0C1DE:
	int2F_bcd_wrapper2(W_50A4 + 0xbfeL);
	if (sample_data_load_12bit(W_50A8, G_MPC60_LOAD_LEN)) goto br_0C21D;
	_longjmp(l20, ERR_FILE_DAMAGED);
br_0C21D:
	int2F_dispatch_10();
	return 2;
}
