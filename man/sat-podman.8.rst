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

SAT commands may be run one of two ways:

1. First running 'sat bash', which will return a command prompt in the SAT
   container environment. At that point, 'sat' commands may be run.
2. Running 'sat' commands directly from outside the container environment.

OPTIONS
=======

For a full list of 'sat' options and arguments, access the main SAT man page
by running 'sat-man sat'. See sat\-man(8).

EXAMPLES
========

Enter the SAT container environment, then view the status of the system:

::

    # sat bash
    (CONTAINER_ID) sat-container:# sat status

Check the status of the system without entering the SAT container environment:

::

    # sat status

View the full man page for 'sat':

::

    # sat-man sat

SEE ALSO
========

sat-man(8)

.. include:: _notice.rst
