cfgdir		 = $(datadir)/vyatta-cfg/templates
opdir		 = $(datadir)/vyatta-op/templates
share_perl5dir	 = $(datarootdir)/perl5
libudevdir	 = /lib/udev
etcudevdir	 = /etc/udev
initddir	 = /etc/init.d
gentmpdir	 = generated-templates

vprefix = /opt/vyatta
vsbindir = $(vprefix)/sbin

sysconf_DATA	 =
sbin_SCRIPTS	 =

sbin_SCRIPTS += scripts/vyatta_gen_radvd.pl

cpiop = find  . ! -regex '\(.*~\|.*\.bak\|.*\.swp\|.*\#.*\#\)' -print0 | \
  cpio -0pd

all-local:
	rm -rf $(gentmpdir)
	./gen-interface-templates.pl $(gentmpdir)
	
clean-local:
	rm -rf $(gentmpdir)
	
install-exec-hook:
	cd $(gentmpdir); $(cpiop) $(DESTDIR)$(cfgdir) ; cd ..
