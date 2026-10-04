extern unsigned char G_PAD_INDEX;
void __near L_054DC(void);

void __far __fastcall __loadds X_05580(void)
{
	int row;
	int col;

	row = G_PAD_INDEX & 0x3c;
	col = G_PAD_INDEX & 3;
	if (col > 0) {
		G_PAD_INDEX = (col += row) - 1;
		L_054DC();
	}
}

void __far __fastcall __loadds L_055A2(void)
{
	int row;
	int col;

	row = G_PAD_INDEX & 0x3c;
	col = G_PAD_INDEX & 3;
	if (col < 3) {
		G_PAD_INDEX = (col += row) + 1;
		L_054DC();
	}
}
