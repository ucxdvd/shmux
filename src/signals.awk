BEGIN {
    print "/*";
    print "** Copyright (C) 2003 Christophe Kalt";
    print "**";
    print "** This file is part of shmux,";
    print "** see the LICENSE file for details on your rights.";
    print "**";
    print "** This file was automatically generated by siglist.awk using awk.";
    print "**";
    print "** $Id: signals.awk,v 1.1 2003-04-26 01:39:51 kalt Exp $";
    print "*/";
    print "";
    print "struct signame {";
    print "    char *name;";
    print "    int num;";
    print "};";
    print "";
    print "struct signame signame[] = {";
    max = 0;
}

/^#define[ \t][ \t]*SIG[A-Z1-9][A-Z1-9]*[ \t][ \t]*[0-9][0-9]*/ {
    if ($3 > max) 
	max = $3;

    siglist[$3] = sprintf("{ \"%s\",\t%2d },", substr($2, 4), $3);
}

END {
    for (i = 1; i <= max; i++) 
	if (siglist[i] != "") printf("    %s\n", siglist[i]);
    print "    { NULL,\t 0 }";
    print "};";
}