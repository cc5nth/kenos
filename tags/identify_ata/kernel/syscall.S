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

/* syscall.S */

#include "sconst.h"

.set INT_VECTOR_SYS_CALL, 0x90
.set _NR_get_ticks,	0
.set _NR_write,		1
.set _NR_hd_xxx,	2
.set _NR_get_hd_info,	3
.set _NR_sw_sched,	4
/* the same to the definition of sys_call_table in global.c */


.code32

.section .text

.globl get_ticks
.globl write
.globl hd_xxx
.globl get_hd_info
.globl sw_sched

/* caution：%dx has been changed by save(), 
  so we cannot use %edx to pass para */

/* get_ticks */
.type get_ticks, @function
get_ticks:
	mov	$_NR_get_ticks, %eax
	int	$INT_VECTOR_SYS_CALL
	ret


/* write */
.type write, @function
write:
	mov	$_NR_write, %eax
	mov	4(%esp), %ebx
	mov	8(%esp), %ecx
	int	$INT_VECTOR_SYS_CALL
	ret



/* hard disk interrupt */
.type hd_intr, @function
hd_xxx:
	mov	$_NR_hd_xxx, %eax
	int	$INT_VECTOR_SYS_CALL
	ret


/* get harddisk info */
.type get_hd_info, @function
get_hd_info:
	mov	$_NR_get_hd_info, %eax
	int	$INT_VECTOR_SYS_CALL
	ret

/* switch scheduler */
.type sw_sched, @function
sw_sched:
	mov	$_NR_sw_sched, %eax
	int	$INT_VECTOR_SYS_CALL
	ret

