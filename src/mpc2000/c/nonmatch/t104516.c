/* differs: 150 +16 image `pop ds` CL `retf`; 172 +16 image `pop ds` CL `retf` */
extern char G_FX_EFFECT_SEL;
extern unsigned char G_UI_MODE;
void __near fx_pitch_arm_field(void);

void __far T1_br_04490(void)
{
	if (G_FX_EFFECT_SEL != 6) goto X_044A6;
	if (G_UI_MODE >= 5) goto X_044A6;
	G_UI_MODE += 2;
	fx_pitch_arm_field();
X_044A6:
	;
}
