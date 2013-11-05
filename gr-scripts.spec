%define APP_BUILD_DATE %(date +'%%Y%%m%%d_%%H%%M')

Name:       gr-scripts
Summary:    fast script to create rpm package inside the git repo without beeing root 
Version:    1.0.0
Release:    1
Group:      System/Libraries
License:    LGPL v2.1
BuildArch:  noarch
URL:        http://safrm.net/projects/gr-scripts
Vendor:     Miroslav Safr <miroslav.safr@gmail.com>
Source0:    %{name}-%{version}.tar.bz2
Autoreq: on
Autoreqprov: on

%description
fast script to create rpm package inside the git repo without beeing root 



%prep
%setup -c -n ./%{name}-%{version}

%build

%install
rm -fr %{buildroot}
mkdir -p %{buildroot}/usr/bin
install -m 755 ./gr-authorcheck  %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-authorcheck && rm -f %{buildroot}%{_bindir}/gr-authorcheck.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-authorcheck && rm -f %{buildroot}%{_bindir}/gr-authorcheck.bkp
install -m 755 ./gr-branches %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-branches && rm -f %{buildroot}%{_bindir}/gr-branches.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-branches && rm -f %{buildroot}%{_bindir}/gr-branches.bkp
install -m 755 ./gr-clean %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-clean && rm -f %{buildroot}%{_bindir}/gr-clean.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-clean && rm -f %{buildroot}%{_bindir}/gr-clean.bkp
install -m 755 ./gr-commits2tag %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-commits2tag && rm -f %{buildroot}%{_bindir}/gr-commits2tag.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-commits2tag && rm -f %{buildroot}%{_bindir}/gr-commits2tag.bkp
install -m 755 ./gr-gr  %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-gr && rm -f %{buildroot}%{_bindir}/gr-gr.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-gr && rm -f %{buildroot}%{_bindir}/gr-gr.bkp
install -m 755 ./gr-pull %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-pull && rm -f %{buildroot}%{_bindir}gr-pull.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-pull && rm -f %{buildroot}%{_bindir}/gr-pull.bkp
install -m 755 ./gr-pullreset %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-pullreset && rm -f %{buildroot}%{_bindir}/gr-pullreset.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-pullreset && rm -f %{buildroot}%{_bindir}/gr-pullreset.bkp
install -m 755 ./gr-remotes %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-remotes && rm -f %{buildroot}%{_bindir}/gr-remotes.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-remotes && rm -f %{buildroot}%{_bindir}/gr-remotes.bkp
install -m 755 ./gr-show %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-show && rm -f %{buildroot}%{_bindir}/gr-show.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-show && rm -f %{buildroot}%{_bindir}/gr-show.bkp
install -m 755 ./gr-showlocal  %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-showlocal && rm -f %{buildroot}%{_bindir}/gr-showlocal.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-showlocal && rm -f %{buildroot}%{_bindir}/gr-showlocal.bkp
install -m 755 ./gr-initbare  %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-initbare && rm -f %{buildroot}%{_bindir}/gr-initbare.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-initbare && rm -f %{buildroot}%{_bindir}/gr-initbare.bkp
install -m 755 ./gr-tags  %{buildroot}%{_bindir}/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/gr-tags && rm -f %{buildroot}%{_bindir}/gr-tags.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/gr-tags && rm -f %{buildroot}%{_bindir}/gr-tags.bkp





%files
%defattr(-,root,root,-)
%{_bindir}/gr-authorcheck
%{_bindir}/gr-branches
%{_bindir}/gr-clean
%{_bindir}/gr-commits2tag
%{_bindir}/gr-gr
%{_bindir}/gr-initbare
%{_bindir}/gr-pull
%{_bindir}/gr-pullreset
%{_bindir}/gr-remotes
%{_bindir}/gr-show
%{_bindir}/gr-showlocal
%{_bindir}/gr-tags


