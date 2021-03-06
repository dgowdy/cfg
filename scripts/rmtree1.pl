#!/usr/bin/perl
# rmtree1 - remove whole directory trees like rm -r
# https://www.arl.wustl.edu/projects/fpx/references/perl/cookbook/ch09_09.htm
# not working????
use File::Find qw(finddepth);
die "usage: $0 dir ..\n" unless @ARGV;
*name = *File::Find::name;
finddepth \&zap, @ARGV;
sub zap {
    if (!-l && -d _) {
        print "rmdir $name\n";
        rmdir($name)  or warn "couldn't rmdir $name: $!";
    } else {
        print "unlink $name";
        unlink($name) or warn "couldn't unlink $name: $!";
    }
}
