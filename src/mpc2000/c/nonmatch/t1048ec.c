/* differs: 150 size 8, image 16; +4 image `jmp +B` CL `call +FFFFFE84`; 172 size 8, image 16; +4 image `jmp +B` CL `call +FFFFFE84` */
extern unsigned char G_UI_FLAG;
void __near fx_echo_st_arm_field(void);

void __far X_04866(void)
{
	G_UI_FLAG++;
	goto L_04871;
	G_UI_FLAG += 3;
L_04871:
	fx_echo_st_arm_field();
}
