/*
 * @brief GPIO app.
 *
 * This simple app provides control of discrete/digital GPIO via a console serial
 * connection. Here are the commands and responses:
 *
 * dc <port> <pin> {i|o} {up|down|nopull|pushpull}
 *   Configure discrete GPIO, returns OK or error message.
 * dr <port> <pin>
 *   Reads discrete GPIO, returns 0, 1, or error message.
 * dw <port> <pin> {0|1
 *   Writes discrete GPIO, returns OK or error message.
 * reset
 *   Resets MCU.
 * version
 *   Writes software version ID.
 *
 * There is a help command that prints the information above.
 *
 * The design of this app is not great - it is "demo grade". It was chosen to
 * make the code as simple as possible, and easier to port to other STM32 MCUs.
 *
 * It does polling for UART input and output using the HAL library, rather than
 * use interrupts and an input buffer.  Because it polls for UART input, there
 * is a chance that UART overrun will occur, although it is currently OK (CPU
 * running at 72 MHz).
 *
 * MIT License
 * 
 * Copyright (c) 2021 Eugene R Schroeder
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

void app_main(void)
{
    printf("\nStarting\n");
}
