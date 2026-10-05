/* differs: +9a beq $11 | jz br_f077b */
extern int B_501C;
extern char B_5D9B_V112;
extern char B_7E0C;
extern char B_7E0D;
extern char B_88DA_V112;
extern char B_8B4F;
extern char B_8C07;
extern char B_8FD6_V112;
extern char B_9D37;
extern int TBL_512E_V112[];
long far_05acc();

far_f0694(a0, a1)
unsigned char *a0;
{
	char v1;
	char v2;
	char v3;
	char v4;
	int v6;

	if (B_88DA_V112 == 0)
		far_f21b5(a0);
	if (B_7E0D != 0 || B_7E0C != 0)
		return;
	v6 = B_8C07 != 0 ? TBL_512E_V112[B_9D37] : B_501C;
	if (*a0 == 144 && a0[2] == 0) {
		v4 = -80;
		v3 = B_9D37;
		v2 = B_5D9B_V112;
		B_8FD6_V112 = B_8B4F;
		v1 = B_8FD6_V112;
		far_05acc(&v4, 4, v6);
	}
	far_05acc(a0, a1, v6);
	if (B_8C07 != 0) {
		if (*a0 == 128 && a0[2] == 0)
			a0[3] = B_8FD6_V112;
		far_f0496(a0, a1);
	}
}
