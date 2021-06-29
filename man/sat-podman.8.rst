============
 SAT-PODMAN
============

----------------------------------------------
The System Admin Toolkit Container Environment
----------------------------------------------

:Author: Hewlett Packard Enterprise Development LP.
:Copyright: Copyright 2021 Hewlett Packard Enterprise Development LP.
:Manual section: 8

SYNOPSIS
========

**sat bash**

**sat** [global-opts] SUBCOMMAND [opts]

DESCRIPTION
===========

All 'sat' subcommands run a process in a container.  The container can
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

FILES
=====

The 'sat' subcommands run in a container environment.  When the container is
started, it automatically mounts the following host directories in the
container in the same location. As a result, the files that are located in
these host directories and subdirectories are available to the subcommands
that run in the container. Any files that are created by the 'sat'
subcommands in these directories will persist on the host after the
container exits.

The working directory inside the container is set to the current working
directory.

$HOME
        The home directory on the host.

$PWD
        The current working directory on the host.

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
