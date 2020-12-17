# Spec file for sat-podman
# (C) Copyright 2020 Hewlett Packard Enterprise Development LP.
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

%description
sat-podman is a wrapper to run the SAT CLI under podman

%prep
%setup -n %{name}-%{version}

%build
for f in sat-podman.sh sat-manpage.sh; do
    # Use registry.local as it will work for both air-gapped and online installs
    sed -e 's,@DEFAULT_SAT_REPOSITORY@,registry.local/cray/cray-sat,' \
        -e 's,@DEFAULT_SAT_TAG@,3.2.0-20201217230506_fab8bc2,' \
        -i $f
done

%install
mkdir -p %{buildroot}/usr/bin/
install -m 755 sat-podman.sh %{buildroot}/usr/bin/sat
install -m 755 sat-manpage.sh %{buildroot}/usr/bin/sat-man

%files
/usr/bin/sat
/usr/bin/sat-man
