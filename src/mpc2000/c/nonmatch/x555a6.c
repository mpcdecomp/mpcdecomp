/* differs: XL v1.20 +11, 15 bytes */
extern unsigned char C0_B_DSP_CHAN;
extern char C2_B_06478[1];
void __far lcd_write_data(char, int, int);

void __far L_555A6(void)
{
	lcd_write_data(C2_B_06478[C0_B_DSP_CHAN], C0_B_DSP_CHAN + 4 << 0xc, 0x1000);
}
