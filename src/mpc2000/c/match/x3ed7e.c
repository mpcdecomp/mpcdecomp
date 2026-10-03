void __far draw_frame_window(int, int, int, int, long);

void __far draw_confirm_window(long p0)
{
	draw_frame_window(0x30, 6, 0xc3, 0x36, p0);
}
