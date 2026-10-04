#include "mpc2kxl.h"

extern int C1_W_0D7D2;
extern long C2_W_014EA;

int __far far_48FBA(void)
{
	int ax_;

	ax_ = far_49BEA();
	if (C1_W_0D7D2 <= ax_) goto br_48FC8;
	C1_W_0D7D2 = ax_;
br_48FC8:
	C2_W_014EA = (long)ax_;
	return (int)C2_W_014EA;
}
