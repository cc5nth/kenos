/***************************************************************************
 *   Copyright (C) 2009 by Cao, Chen                                       *
 *   ken.ccao@gmail.com                                                    *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

#ifndef	_KENOS_SYSTEM_H_
#define	_KENOS_SYSTEM_H_

#define sti() __asm__("sti"::)
#define cli() __asm__("cli"::)
#define nop() __asm__("nop"::)
#define hlt() __asm__("hlt"::)


/* Bit 9 of the EFLAGS register is set if hardware
 * interrupts are enabled. We simply need to "remember" its value when
 * calling disable_hwint. Depending on that value, we will or will not
 * re-enable hardware interrupts.
 */
#define disable_hwint(eflags) \
__asm__("pushf; pop %0; cli;" : "=g" ((eflags)))

#define restore_hwint(eflags) \
__asm__("push %0; popf;" :: "g" ((eflags)))

#endif /* _KENOS_SYSTEM_H_ */






