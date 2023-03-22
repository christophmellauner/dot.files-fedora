#!/bin/bash
DIRECTORY=$(cd `dirname $0` && pwd)

dnf repoquery --qf '%{name}' --userinstalled | sort > $DIRECTORY/../dnf-package-list.txt

