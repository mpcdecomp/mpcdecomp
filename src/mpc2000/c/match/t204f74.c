extern char G_EDIT_FIELD_VAL[1];
extern char P_A724[1];
void __far L_050AA(void);
void __far num_entry_draw(void);
int __far __pascal lcd_init_setup(int);
void __far __pascal status_read_6A_2(char far *, int, int, int, char, char, void (far *)(void), void (far *)(void));

void __far __pascal cmd_exec_multi(char far *p2, char p1, char p0)
{
	*(char far **)P_A724 = p2;
	*(int *)G_EDIT_FIELD_VAL = lcd_init_setup(*(int far *)p2);
	status_read_6A_2(G_EDIT_FIELD_VAL, -0x1388, 0x1388, 4, p1, p0, num_entry_draw, L_050AA);
}
