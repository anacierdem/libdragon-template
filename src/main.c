#include <stdio.h>

#include <libdragon.h>

#include "../include/debug.h"
#include "./debug.c"

int main(void)
{
    console_init();

    debug_init_usblog();
    console_set_debug(true);

    debug_initialize();

    printf("Hello world!\n");

    while (1)
    {
    }
}