extern char REC_INPUT_X;
extern char REC_INPUT_Y;
extern char SAMPLE_INPUT[1];
void __far L_07386(void);
void __far __pascal voice_trigger_full(char far *, int, char, char, int, void (far *)(void));

void __near X_0746C(void)
{
	voice_trigger_full(SAMPLE_INPUT, 1, REC_INPUT_X, REC_INPUT_Y, 8, L_07386);
}
