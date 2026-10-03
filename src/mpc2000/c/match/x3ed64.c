void __far draw_frame_window(int, int, int, int, long);

void __far smem_proc_wrapper(long p0)
{
	draw_frame_window(0xc, 2, 0xe0, 0x3a, p0);
}
