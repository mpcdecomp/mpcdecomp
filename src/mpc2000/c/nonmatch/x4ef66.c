/* differs: XL v1.20 +9, 32 bytes */
extern char C1_SEG[1];
extern char EP_L_4BD9A_OFF[1];
extern char EP_L_4BD9A_SEG[1];
void __far L_400DC(void);
void __far disp_message_window(char __near *, char __near *, int, char __near *);
void __far __fastcall __loadds far_4EF20(void);
void __far field_handler_nop(void);

void __far __fastcall __loadds L_4EF66(void)
{
	disp_message_window(EP_L_4BD9A_OFF, EP_L_4BD9A_SEG, 0x12, C1_SEG);
	L_400DC();
	field_handler_nop();
	far_4EF20();
}
