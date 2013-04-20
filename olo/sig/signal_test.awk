#!/usr/local/bin/gawk -f
#
# This program available with gawk-4.0.0 or later.
#

function HUP_handler(sig) { print "HUP_handler called." }

function INT_handler(sig) { print "INT_handler called." }

function QUIT_handler(sig) { print "QUIT_handler called." }

function ILL_handler(sig) { print "ILL_handler called." }

function ABRT_handler(sig) { print "ABRT_handler called." }

function FPE_handler(sig) { print "FPE_handler called." }

function KILL_handler(sig) { print "KILL_handler called." }

function SEGV_handler(sig) { print "SEGV_handler called." }

function PIPE_handler(sig) { print "PIPE_handler called." }

function ALRM_handler(sig) { print "ALRM_handler called." }

function TERM_handler(sig) { print "TERM_handler called." }

function USR1_handler(sig) { print "USR1_handler called." }

function USR2_handler(sig) { print "USR2_handler called." }

function CHLD_handler(sig) { print "CHLD_handler called." }

function CONT_handler(sig) { print "CONT_handler called." }

function STOP_handler(sig) { print "STOP_handler called." }

function TSTP_handler(sig) { print "TSTP_handler called." }

function TTIN_handler(sig) { print "TTIN_handler called." }

function TTOU_handler(sig) { print "TTOU_handler called." }

function BUS_handler(sig) { print "BUS_handler called." }

function POLL_handler(sig) { print "POLL_handler called." }

function PROF_handler(sig) { print "PROF_handler called." }

function SYS_handler(sig) { print "SYS_handler called." }

function TRAP_handler(sig) { print "TRAP_handler called." }

function URG_handler(sig) { print "URG_handler called." }

function VTALRM_handler(sig) { print "VTALRM_handler called." }

function XCPU_handler(sig) { print "XCPU_handler called." }

function XFSZ_handler(sig) { print "XFSZ_handler called." }

function IOT_handler(sig) { print "IOT_handler called." }

function EMT_handler(sig) { print "EMT_handler called." }

function STKFLT_handler(sig) { print "STKFLT_handler called." }

function IO_handler(sig) { print "IO_handler called." }

function CLD_handler(sig) { print "CLD_handler called." }

function PWR_handler(sig) { print "PWR_handler called." }

function INFO_handler(sig) { print "INFO_handler called." }

function LOST_handler(sig) { print "LOST_handler called." }

function WINCH_handler(sig) { print "WINCH_handler called." }

function UNUSED_handler(sig) { print "UNUSED_handler called." }

BEGIN {
	extension("./awk-signal.so", "dlload")

	signal("HUP", "HUP_handler")
	signal("INT", "INT_handler")
	signal("QUIT", "QUIT_handler")
	signal("ILL", "ILL_handler")
	signal("ABRT", "ABRT_handler")
	signal("FPE", "FPE_handler")
	signal("KILL", "KILL_handler")
	signal("SEGV", "SEGV_handler")
	signal("PIPE", "PIPE_handler")
	signal("ALRM", "ALRM_handler")
	signal("TERM", "TERM_handler")
	signal("USR1", "USR1_handler")
	signal("USR2", "USR2_handler")
	signal("CHLD", "CHLD_handler")
	signal("CONT", "CONT_handler")
	signal("STOP", "STOP_handler")
	signal("TSTP", "TSTP_handler")
	signal("TTIN", "TTIN_handler")
	signal("TTOU", "TTOU_handler")
	signal("BUS", "BUS_handler")
	signal("POLL", "POLL_handler")
	signal("PROF", "PROF_handler")
	signal("SYS", "SYS_handler")
	signal("TRAP", "TRAP_handler")
	signal("URG", "URG_handler")
	signal("VTALRM", "VTALRM_handler")
	signal("XCPU", "XCPU_handler")
	signal("XFSZ", "XFSZ_handler")
	#signal("IOT", "IOT_handler")
	#signal("EMT", "EMT_handler")
	signal("STKFLT", "STKFLT_handler")
	signal("IO", "IO_handler")
	#signal("CLD", "CLD_handler")
	signal("PWR", "PWR_handler")
	#signal("INFO", "INFO_handler")
	#signal("LOST", "LOST_handler")
	signal("WINCH", "WINCH_handler")
	signal("UNUSED", "UNUSED_handler")

	for ( ; ; );
	#for ( ; ; ){print "looping...";system("sleep 0.1")}
}
