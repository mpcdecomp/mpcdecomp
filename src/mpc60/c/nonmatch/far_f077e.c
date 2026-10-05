/* differs: +18 cmp byte ptr B_5D9C_V112_,0 | push word ptr [bp + 8] */
extern char B_53DB;
extern char B_5D9C_V112;
extern char B_7E0C;
extern char B_7E0D;
extern char B_8CD9;
extern char B_9D37;
extern char TBL_5066_V112[];
extern int TBL_512E_V112[];
long far_05acc();

far_f077e(a0, a1)
{
	if (B_7E0D == 0 && B_7E0C == 0 && B_53DB != 116 && B_5D9C_V112 != 0) {
		far_f0496(a0, a1);
		L_04ef2(a0, TBL_5066_V112[B_8CD9]);
		far_05acc(a0, a1, TBL_512E_V112[B_9D37]);
	}
	return;
}
