/* differs: XL v1.20 +9, 36 bytes */
extern char C1_SEG[1];
void __far disp_message_window(int, char __near *, int, char __near *);
void __far disp_request_flush(void);
void __far field_handler_nop(void);
void __far pgm_memory_init(void);
void __far wave_mem_size_probe(void);

void __far __fastcall __loadds wave_mem_detect(void)
{
	disp_message_window(0x16, C1_SEG, 0x12, C1_SEG);
	wave_mem_size_probe();
	pgm_memory_init();
	field_handler_nop();
	disp_request_flush();
}
