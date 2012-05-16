%define buildroot %{_topdir}/%{name}-%{version}-root

Name:       gr-scripts
Summary:    fast script to create rpm package inside the git repo without beeing root 
Version:    1.0.0
Release:    1
Group:      System/Libraries
License:    LGPL v2.1
BuildArch:  noarch
URL:        https://github.com/safrm/gr-scripts
Vendor:     Miroslav Safr <miroslav.safr@gmail.com>
Source0:    %{name}-%{version}.tar.bz2
Autoreq: on
Autoreqprov: on
BuildRoot: %{buildroot}

%description
fast script to create rpm package inside the git repo without beeing root 



%prep
%setup -c -n ./%{name}-%{version}
# >> setup
# << setup

%build
# >> build pre
#qmake install_prefix=/usr
# << build pre
#make %{?jobs:-j%jobs}

# >> build post
# << build post

%install
rm -fr $RPM_BUILD_ROOT
# >> install pre
export INSTALL_ROOT=$RPM_BUILD_ROOT
# << install pre 
#make install
mkdir -p %{buildroot}/usr/bin
install -m 755 ./gr-branches %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-branches && rm -f $BINDIR/gr-branches.bkp
install -m 755 ./gr-clean %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-clean && rm -f $BINDIR/gr-clean.bkp
install -m 755 ./gr-pull %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-pull && rm -f $BINDIR/gr-pull.bkp
install -m 755 ./gr-pullreset %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-pullreset && rm -f $BINDIR/gr-pullreset.bkp
install -m 755 ./gr-remotes %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-remotes && rm -f $BINDIR/gr-remotes.bkp
install -m 755 ./gr-show %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-show && rm -f $BINDIR/gr-show.bkp
install -m 755 ./gr-showlocal  %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-showlocal && rm -f $BINDIR/gr-showlocal.bkp
install -m 755 ./gr-initbare  %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-initbare && rm -f $BINDIR/gr-initbare.bkp

# >> install post
# << install post






%files
%defattr(-,root,root,-)
# >> files
%{_bindir}/gr-branches
%{_bindir}/gr-clean
%{_bindir}/gr-initbare
%{_bindir}/gr-pull
%{_bindir}/gr-pullreset
%{_bindir}/gr-remotes
%{_bindir}/gr-show
%{_bindir}/gr-showlocal
# << files


