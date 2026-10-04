/* differs: XL v1.20 +F, 10 bytes */
extern char C2_B_0D7CC;
extern char C2_B_0D7CE;
extern long C2_W_01442;
extern long C2_W_01496;
int __far detect_memory(void);

int __far far_48F64(void)
{
	char l1;
	char l2;

	if (!detect_memory()) {
		l1 = 0;
		l2 = 1;
	} else {
		l1 = 1;
		l2 = 5;
	}
	if (l1 >= C2_B_0D7CC) goto br_48F92;
	C2_B_0D7CC = l1;
br_48F92:
	if (l2 >= C2_B_0D7CE) goto br_48FA0;
	C2_B_0D7CE = l2;
br_48FA0:
	C2_W_01442 = (long)l1;
	C2_W_01496 = (long)l2;
	return (int)C2_W_01496;
}
