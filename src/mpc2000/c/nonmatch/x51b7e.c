/* differs: XL v1.20 +0, 26 bytes */
extern char C1_SEG[1];
extern char C1_W_067E4[1];
void __far draw_string_at(long, char __near *, char __near *);
void __far field_engine_redraw(void);

void __far far_51B7E(void)
{
	draw_string_at(0x2900c7L, C1_W_067E4, C1_SEG);
	field_engine_redraw();
}
