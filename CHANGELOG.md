# Changelog

(C) Copyright 2020-2023,2025 Hewlett Packard Enterprise Development LP

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.1] - 2025-06-03

### Changed
- Changed the sat-podman script to add visibility of the `SAT_CONFIG_FILE`
  environment variable inside of the sat container.

## [3.0.0] - 2023-10-24

### Changed
- Changed wrapper script logic to always use the `cray-sat` image path as
  uploaded by the CSM product. This version of `sat-podman` requires that CSM
  1.6 or later be installed because that is the version which began setting the
  `cray-sat` image version in `/opt/cray/etc/sat/version`.

## [2.1.0] - 2023-10-03

### Changed
- Changed RPM to noarch and noos and changed publishing location from sat-rpms
  to csm-rpms in CSM Artifactory.

## [2.0.0] - 2022-08-09

### Changed
- Changed the wrapper scripts to depend on a file named ``/opt/cray/etc/sat/version``
  to supply the version of the SAT container image, so that there is no longer
  a hard-coded default SAT version in the script. When this file does not
  exist, the following image is used:
  ``registry.local/artifactory.algol60.net/sat-docker/stable/cray-sat:csm-latest``
- Changed the ``SAT_REPOSITORY`` environment variable to no longer include
  part of the image name.
- Add a ``SAT_IMAGE_NAME`` variable so that the name of the image can
  be specified.

## [1.9.1] - 2022-07-05

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.17.0-20220627210641_7dd2953 to
  3.17.1-20220705195400_fd46060.

## [1.9.0] - 2022-06-27

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.16.1-20220608212829_ab4cc61 to
  3.17.0-20220627210641_7dd2953.

## [1.8.5] - 2022-06-27

### Changed

- Changed the format of the license and copyright text in all of the source
  files.

## [1.8.4] - 2022-06-15

### Fixed
- Fixed builds of stable RPMs by running publishing step outside of container,
  and add Dockerfile which sets up build dependencies, so that the build does
  not need to run as root.

## [1.8.3] - 2022-06-08

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.16.0-20220603195202_230a55e to
  3.16.1-20220608212829_ab4cc61.

## [1.8.2] - 2022-06-07

### Changed
- Changed build to publish to the ``sat-rpms`` Artifactory repository.

## [1.8.1] - 2022-06-03

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.15.1-20220418195845_1dafe87 to
   3.16.0-20220603195202_230a55e.

## [1.8.0] - 2022-05-25

### Changed
- Incremented version to 1.8.0 in preparation for SAT container image version
  3.16.
- Made changes related to open sourcing of sat-install-utility.
    - Update Jenkinsfile to use csm-shared-library.
    - Add Makefile for building RPM package.

## [1.6.8] - 2022-04-18

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.15.0-20220330153238_c5599e8 to
  3.15.1-20220418195845_1dafe87.

## [1.6.7] - 2022-04-07

### Changed
- Changed the mounting of the current working directory to mount it in the
  container as ``/sat/share/`` instead of mounting it in the container on
  the same path as on the host.
- Changed the mount of ``/etc/os-release`` to be read-only.

## [1.6.6] - 2022-03-30

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.14.0-20220224220225_70aeead to
  3.15.0-20220330153238_c5599e8.

## [1.6.5] - 2022-02-24

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.13.1-20220127225847_6b511eb to
  3.14.0-20220224220225_70aeead.

## [1.6.4] - 2022-01-27

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.13.0-20220124223033_96b5819 to
  3.13.1-20220127225847_6b511eb.

## [1.6.3] - 2022-01-24

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.12.1-20211214153306_7ab0730
  to 3.13.0-20220124223033_96b5819.

## [1.6.2] - 2021-12-14

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.12.0-20211207204308_4c03082
  to 3.12.1-20211214153306_7ab0730.

## [1.6.1] - 2021-12-07

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.11.0-20211029193657_c204587
  to 3.12.0-20211207204308_4c03082.

## [1.6.0] - 2021-11-22

### Changed
- The pager used by `sat-man` was changed from `more` to `less`.

## [1.5.2] - 2021-10-29

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.10.0-20210907172136_47bb1ee
  to 3.11.0-20211029193657_c204587.

## [1.5.1] - 2021-09-07

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.9.0-20210804200331_9f1a814
  to 3.10.0-20210907172136_47bb1ee.

## [1.5.0] - 2021-08-04

### Fixed
- Fixed issues with redirecting stdout and stderr, and piping output to
  commands, such as, awk, less, and more.

### Added
- Mount the user's working and home directories on the host to the same
  directories in the container. Set the working directory when the
  container is started to the user's working directory.
- Added documentation to the man page on environment variables available
  in ``sat-podman``.
- Added documentation to the man page on host files and directories mounted
  in the container.

## [1.4.7] - 2021-06-23

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.7.0 to 3.8.0.

## [1.4.6] - 2021-06-09

### Fixed
- Create the ``/opt/cray/etc/`` directory when it does not exist to
  prevent an error in ``sat showrev``.

## [1.4.5] - 2021-05-13
### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.6.0 to 3.7.0.

## [1.4.4] - 2021-04-16

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.5.0 to 3.6.0.

## [1.4.3] - 2021-03-25

### Changed
- Bumped the default tag for the ``cray/cray-sat`` container image that is
  specified in the wrapper scripts from 3.4.0 to 3.5.0.

## [1.4.2] - 2021-03-03

### Fixed
- Reverted the fix to the output of ``sat`` in non-interactive mode,
  as this was causing a bug in prompting for user input, such as a password
  or confirmation. This reverts the change to separate stdout and stderr
  correctly as well as the change to display line breaks properly.

## [1.4.1] - 2021-03-03

### Fixed
- Fixed the output of ``sat`` in non-interactive mode to correctly split
  stdout and stderr and display line breaks properly when output is
  redirected.

## [1.4.0] - 2021-02-05

### Added
- Mount the ``/etc/ceph`` directory from host to ``/etc/ceph`` in the
  container.
- Added man pages for ``sat-podman`` and ``sat-man``, and add ``sat`` man
  page linking to ``sat-podman``.

## [1.3.0] - 2020-12-17

### Added
- Mount ``/etc/os-release`` from host to ``/opt/cray/sat/etc/os-release`` in
  the container.

### Changed
- Updated default value of ``SAT_REPOSITORY`` to registry.local/cray/cray-sat
  to support air-gap installs as well as online installs.
- Updated default value of ``SAT_TAG`` to a later master version of cray-sat.

## [1.2.0] - 2020-12-04

### Added
- Mount ``/opt/cray/etc/release`` inside podman container.
- Mount ``/opt/cray/etc`` inside podman container.
- Mount SAT log dir inside podman container. Default to ``/var/log/cray/sat/``.

## [1.1.0] - 2020-11-18

### Added
- Configure DNS in container under podman using first nameserver from
  ``/etc/resolv.conf`` on the host.
- Mount SSH configuration, K8s configuration, and SSL certificates from the
  host into container under podman.
- Mount SAT configuration directory ``$HOME/.config/sat`` into container under
  podman so that configuration is persistent.

## [1.0.0] - 2020-11-03

### Added
- Wrapper script that installs to ``/usr/bin/sat`` that runs the sat container
  using podman.
- Wrapper script that installs to ``/usr/bin/sat-man`` that runs the sat
  container using podman to allow the admin to easily view SAT man pages.

