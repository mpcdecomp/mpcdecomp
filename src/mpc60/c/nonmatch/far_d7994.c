/* differs: +11 beq $5 | jz br_d79f9 */
extern char B_4C2E;
extern char B_5759_V112;
extern unsigned char B_9F92;
extern unsigned char B_A419;
extern int W_53A7;

far_d7994(a0)
long a0;
{
	char z0[2];
	int *v4;
	int v6;
	int v8;

	v6 = 0x1000;
	if (B_4C2E != 0) {
		if (B_5759_V112 != 0) {
			v8 = B_A419;
			v4 = 0x58ac;
		}
		else {
			v8 = B_9F92;
			v4 = 0x4e0c;
		}
		while (v8-- != 0) {
			if ((unsigned)a0 >= *(long *)v4) {
				v6 = v4[2];
				v4 += 6;
			}
			else
				break;
		}
	}
	W_53A7 = v6;
	far_d391a();
	far_e8f55();
	return;
}
