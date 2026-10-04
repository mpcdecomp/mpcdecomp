extern unsigned char G_PAD_INDEX;
void __near L_054DC(void);

/* pad cursor moves on the 4x4 grid of a bank: row is bits 2-3, column bits 0-1 */
void __far __fastcall __loadds L_05534(void)
{
	int row;
	int col;

	row = G_PAD_INDEX & 0x33;
	col = G_PAD_INDEX & 0xc;
	if (col < 0xc) {
		G_PAD_INDEX = (col += row) + 4;
		L_054DC();
	}
}

void __far __fastcall __loadds L_0555A(void)
{
	int row;
	int col;

	row = G_PAD_INDEX & 0x33;
	col = G_PAD_INDEX & 0xc;
	if (col > 3) {
		G_PAD_INDEX = (col += row) - 4;
		L_054DC();
	}
}
