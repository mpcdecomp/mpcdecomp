extern char B_4FE1;
extern char B_4FE2;
extern char G_STATE_9D8B;
char far * __far channel_get_ptr(int);
char far * __far channel_validate(int);
void __far far_04B42(void);
void __far fx_redraw(void);

void __far __pascal voice_dispatch_table(char p0)
{
	B_4FE2 &= 0xfe;
	B_4FE2 ^= 2;
	if (G_STATE_9D8B < 2) B_4FE1 = channel_validate(G_STATE_9D8B)[69]; else B_4FE1 = channel_get_ptr(G_STATE_9D8B)[1];
	if (!(B_4FE2 & 2)) goto br_04C0D;
	B_4FE1 |= p0;
br_04C0D:
	if (G_STATE_9D8B < 2) {
		fx_redraw();
		return;
	}
	far_04B42();
}
