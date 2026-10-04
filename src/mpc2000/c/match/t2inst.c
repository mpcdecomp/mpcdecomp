/* MPC2000 SYS text2: key-window handler sets and the text2 vectors
 * (../2k/common/sys/text2.asm). */

#include "mpc2k.h"

#pragma pack(1)

struct op_bbl { char op, a, b; long v; char end; };
/* A set is {id, handler} entries up to a zero id. */
struct key { char id; void (far *f)(void); };

void __pascal cmd_caller_setup(char a, char b, long v)
{
	struct op_bbl l;

	l.op = 0x26;
	l.a = a;
	l.b = b;
	l.v = v;
	l.end = 0;
	disp_list_run((char __far *)(&l));
}

#if FW_VERSION == 172
void L_005B4(void)
{
	install_handler(WIN_K_END_ALL, 0);
}
#endif

void __pascal install_handler(int id, void (__far *f)(void))
{
	struct key s[2];

	s[0].id = id;
	s[0].f = f;
	s[1].id = 0;
	((void (__far __pascal *)(void __far *))win_keys_merge)(s);
}

/* A null handler is the stub that does nothing. */
void __pascal install_handler_15(void (__far *f)(void))
{
	if (f == 0)
		f = win_key_nop_stub;
	install_handler(WIN_K_OPEN, f);
}

void X_00610(void)
{
	((void (__far __pascal *)(void __far *))win_keys_merge)(TBL_WINKEYS_00080);
}

/* Spins on the tick until n have passed. */
void __fastcall delay_ticks(unsigned n)
{
	unsigned t;

	t = ((unsigned (__far *)(void))int38_wrapper)();
	while (((unsigned (__far *)(void))int38_wrapper)() - t < n)
		;
}

void install_text2_vectors(void)
{
	((void (__far *)(int, void (__far *f)(void)))ivt_set_vector)(0x31, L_00848);
	((void (__far *)(int, void (__far *f)(void)))ivt_set_vector)(0x3b, L_00946);
	((void (__far *)(int, void (__far *f)(void)))ivt_set_vector)(0x47, L_0CDD8);
}
