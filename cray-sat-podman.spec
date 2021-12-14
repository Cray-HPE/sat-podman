# Spec file for sat-podman
# (C) Copyright 2020-2021 Hewlett Packard Enterprise Development LP.
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

%define satmandir %{_mandir}/man8

Name: cray-sat-podman
Version: %(./changelog.py ./CHANGELOG.md)
Release: %(echo ${BUILD_METADATA})
License: MIT
Source: %{name}-%{version}.tar.gz
Summary: SAT Podman
Group: System/Management
BuildRoot: %{_topdir}
Vendor: Hewlett Packard Enterprise Company
Requires: podman
Requires: podman-cni-config
BuildRequires: python3-docutils

%description
sat-podman is a wrapper to run the SAT CLI under podman

%prep
%setup -n %{name}-%{version}

%build
# Replace values in sat and sat-man executables
for f in sat-podman.sh sat-manpage.sh; do
    # Use registry.local as it will work for both air-gapped and online installs
    sed -e 's,@DEFAULT_SAT_REPOSITORY@,registry.local/cray/cray-sat,' \
        -e 's,@DEFAULT_SAT_TAG@,3.7.5,' \
        -i $f
done
# Build man pages
cd man
make
cd -

%install
# Install sat and sat-man executables
mkdir -p %{buildroot}/usr/bin/
install -m 755 sat-podman.sh %{buildroot}/usr/bin/sat
install -m 755 sat-manpage.sh %{buildroot}/usr/bin/sat-man
# Install man pages
install -m 755 -d %{buildroot}%{satmandir}/
cp man/*.8 %{buildroot}%{satmandir}/
# Link the 'sat' man page to the 'sat-podman' man page
ln -s sat-podman.8 %{buildroot}%{satmandir}/sat.8

%files
/usr/bin/sat
/usr/bin/sat-man
%{satmandir}/*.8.gz
