==============
spigot-formula
==============

SaltStack formula for installing a `Spigot<http://www.spigotmc.org>`_ minecraft
server.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.

.. note::

    Requires `java-formula <https://github.com/voltaire/java-formula>`_ cloned
    locally with `server_jre.tgz` placed in the `java/files` directory.

Available states
================

.. contents::
    :local:

``spigot.server``
------------

Downloads the `latest Spigot snapshot<http://ci.md-5.net/job/Spigot/lastSuccessfulBuild/artifact/Spigot-Server/target/spigot.jar>`_,
creates a user and group named `minecraft`.
