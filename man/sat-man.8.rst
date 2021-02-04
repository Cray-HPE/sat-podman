=========
 SAT-MAN
=========

------------------------------------
View a System Admin Toolkit man page
------------------------------------

:Author: Hewlett Packard Enterprise Development LP.
:Copyright: Copyright 2021 Hewlett Packard Enterprise Development LP.
:Manual section: 8

SYNOPSIS
========

**sat-man** MANPAGE

DESCRIPTION
===========

System Admin Toolkit man pages are installed in a container. To access these
containerized man pages, the 'sat-man' command may be used. Alternatively, one
can access the SAT container using the 'sat bash' command, at which point
'man sat' or 'man sat-SUBCOMMAND` can be used.

EXAMPLES
========

View the man page for the 'sat' command:

::

    # sat-man sat

Use 'sat bash' to view the same man page:

::

    # sat bash
    (CONTAINER_ID) sat-container:# man sat

View the man page for the 'sat status' command:

::

    # sat-man status

Use 'sat bash' to view the same man page:

::

    # sat bash
    (CONTAINER_ID) sat-container:# man sat-status


SEE ALSO
========

sat-podman(8)

.. include:: _notice.rst
