#include "mpc2k.h"

void __far field_redraw(void)
{
    long t1;

    t1 = (*(long (far *)())WIN_FIELD_DRAW_FN)();
    return;
}
