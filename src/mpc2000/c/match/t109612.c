#include "mpc2k.h"

void __far lcd_area_wrapper_2(long p0)
{
	lcd_clear_wrapper(p0, 0xc0);
}
