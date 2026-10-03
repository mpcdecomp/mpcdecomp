/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
void * __cdecl memset(void *, int, unsigned);
char * __cdecl strcpy(char *, const char *);
#pragma intrinsic(memset, strcpy)
extern char C2_B_076CB[1];
extern char C2_B_08B42;
extern char C2_TBL_08B32[1];
extern char C2_W_08B32[1];
extern unsigned C2_W_AUTONAME_NUM;

void __far name_split_number_suffix(char far *p0)
{
	int l2;
	int si_;

	C2_W_AUTONAME_NUM = 0;
	memset(C2_W_08B32, 0x20, 0x10);
	C2_B_08B42 = 0;
	strcpy(C2_W_08B32, p0);
	l2 = 0xf;
	si_ = l2;
loop_4866E:
	if (C2_TBL_08B32[si_] == 0x20) goto br_48687;
	if (C2_B_076CB[C2_TBL_08B32[si_]] & 4) goto br_48687;
	if (C2_TBL_08B32[si_]) goto br_4868A;
br_48687:
	si_--;
	if (si_ >= 0) goto loop_4866E;
br_4868A:
	C2_W_AUTONAME_NUM = 0;
	si_++;
	if (si_ >= 0x10) goto br_486C5;
loop_48696:
	if (!(C2_B_076CB[C2_TBL_08B32[si_]] & 4)) goto br_486BA;
	C2_W_AUTONAME_NUM = C2_TBL_08B32[si_] + C2_W_AUTONAME_NUM * 10 - 0x30;
br_486BA:
	C2_TBL_08B32[si_] = 0x20;
	si_++;
	if (si_ < 0x10) goto loop_48696;
br_486C5:
	if (C2_W_AUTONAME_NUM <= 0x3e7) goto br_486D3;
	C2_W_AUTONAME_NUM = 0;
br_486D3:
	;
}
