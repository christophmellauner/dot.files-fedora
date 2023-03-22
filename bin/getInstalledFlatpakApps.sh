#!/bin/bash
DIRECTORY=$(cd `dirname $0` && pwd)

flatpak list --app --columns=application | tail -n +1 > $DIRECTORY/../flatpak-package-list.txt
