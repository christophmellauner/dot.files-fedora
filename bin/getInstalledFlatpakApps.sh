#!/bin/bash

flatpak list --app --columns=application | tail -n +1 > flatpak-package-list.txt
