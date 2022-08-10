============
 SAT-PODMAN
============

----------------------------------------------
The System Admin Toolkit Container Environment
----------------------------------------------

:Author: Hewlett Packard Enterprise Development LP.
:Copyright: Copyright 2021-2022 Hewlett Packard Enterprise Development LP.
:Manual section: 8

SYNOPSIS
========

**sat bash**

**sat** [global-opts] SUBCOMMAND [opts]

DESCRIPTION
===========

All 'sat' subcommands run a process in a container. The container can
be used to execute multiple 'sat' subcommands in a container environment
or a single 'sat' subcommand using a temporary container depending on
how the SAT command is run.

SAT subcommands may be run one of two ways:

1. First running 'sat bash', which will return a command prompt in the SAT
   container environment. At that point, 'sat' subcommands may be run.
2. Running a single 'sat' subcommand directly from the host.
   The 'sat' subcommand is run in a temporary container which
   automatically exits and is removed when the 'sat' subcommand completes.

OPTIONS
=======

For a full list of 'sat' options and arguments, access the main SAT man page
by running 'sat-man sat'. See sat\-man(8).

ENVIRONMENT
===========

Environment variables can be set to override defaults used when the container
is created. The following environment variables are available:

SAT_CONFIG_DIR
        Environment variable for the directory containing the
        SAT configuration file and authentication tokens.
        The default is $HOME/.config/sat.
        The directory is mounted in the container as $HOME/.config/sat.

SAT_KUBE_CONFIG_FILE
        Environment variable for the Kubernetes configuration file.
        The default is /etc/kubernetes/admin.conf.
        The directory is mounted in the container as $HOME/.kube/config.

SAT_LOG_DIR
        Environment variable for the directory containing the SAT log file.
        The default is /var/log/cray/sat.
        The directory is mounted in the container in the same location
        defined by SAT_LOG_DIR defaulting to /var/log/cray/sat.

FILES
=====

The 'sat' subcommands run in a container environment. When the container is
started, it automatically mounts the following host directories in the
container:

$HOME
        The home directory on the host. This is mounted in the same location
        as the host.

$PWD
        The current working directory on the host. This is mounted in
        the container as /sat/share/, and the default working directory
        of the container is set to /sat/share.

As a result, the files and directories that are located in $HOME and $PWD
are available to the subcommands that run in the container, and any files
that are created by the 'sat' subcommands in these directories will persist
on the host after the container exits. However, files in the current working
directory must be specified using relative paths to that directory, because
the current working directory is always mounted on /sat/share. Absolute paths
should be avoided, and paths that are outside of $HOME or $PWD are never
accessible to the container environment.

In addition, the following host files and directories are mounted in the container
for use by the 'sat' subcommands:

$HOME/.config/sat
        The directory containing the SAT configuration file and authentication tokens.
        The directory is created if it does not exist.
        The directory is mounted in the container as $HOME/.config/sat
        in read-write mode.
        The location of the directory on the host can be changed using the
        environment variable SAT_CONFIG_DIR.

/etc/ceph
        The directory containing ceph configuration data.
        The directory is mounted in the container as /etc/ceph
        in read-only mode.

/etc/kubernetes/admin.conf
        The file containing kubernetes configuration data.
        The file is mounted in the container as $HOME/.kube/config
        in read-only mode.
        The location of the file on the host can be changed using the
        environment variable SAT_KUBE_CONFIG_FILE.

/etc/os-release
        The file containing Operating System release information.
        The file is mounted in the container as /opt/cray/sat/etc/os-release
        in read-write mode.

/etc/pki/trust/anchors
        The directory containing CA certificates.
        The directory is mounted in the container as /usr/local/share/ca-certificates
        in read-only mode.

/opt/cray/etc
        The directory containing site information which is a local cache of the
        site information downloaded from the configured S3 bucket.
        The directory is created if it does not exist.
        The directory is mounted in the container as /opt/cray/etc
        in read-write mode.

/opt/cray/etc/release
        The directory containing product version files.
        The directory is mounted in the container as /opt/cray/etc/release
        in read-only mode.

/opt/cray/etc/sat/version
        The file containing the version of the SAT container image to use.
        When this file does not exist, the following image is used:
        registry.local/artifactory.algol60.net/sat-docker/stable/cray-sat:csm-latest

/var/log/cray/sat
        The directory containing the SAT log file.
        The directory is created if it does not exist.
        The directory is mounted in the container as /var/log/cray/sat
        in read-write mode.
        The location of the directory on the host and in the container
        can be changed using the environment variable SAT_LOG_DIR.

EXAMPLES
========

Enter the SAT container environment, then view the status of the system:

::

    # sat bash
    (CONTAINER_ID) sat-container:# sat status

Check the status of the system without entering the SAT container environment:

::

    # sat status

Show the sensor readings for the list of xnames in the xnames.txt file
located in the current working directory:

::

    # sat sensors --xname-file xnames.txt

View the full man page for 'sat':

::

    # sat-man sat

SEE ALSO
========

sat-man(8)

.. include:: _notice.rst
