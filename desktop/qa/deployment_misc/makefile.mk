#*************************************************************************
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
# 
# Copyright 2000, 2010 Oracle and/or its affiliates.
#
# OpenOffice.org - a multi-platform office productivity suite
#
# This file is part of OpenOffice.org.
#
# OpenOffice.org is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License version 3
# only, as published by the Free Software Foundation.
#
# OpenOffice.org is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License version 3 for more details
# (a copy is included in the LICENSE file that accompanied this code).
#
# You should have received a copy of the GNU Lesser General Public License
# version 3 along with OpenOffice.org.  If not, see
# <http://www.openoffice.org/license.html>
# for a copy of the LGPLv3 License.
#
#*************************************************************************

.IF "$(GUI)" == "OS2"

@all:
	@echo "Skipping, cppunit broken."

.ENDIF # "$(GUI)" == "OS2"

PRJ := ..$/..
PRJNAME := desktop
TARGET := qa_deployment_misc

ENABLE_EXCEPTIONS := TRUE

.INCLUDE: settings.mk
.INCLUDE: $(PRJ)$/source$/deployment$/inc$/dp_misc.mk

CFLAGSCXX += $(CPPUNIT_CFLAGS)

# TODO:  On Windows, test_dp_version.cxx fails due to BOOL redefinition between
# windef.h and tools/solar.h caused by including "precompiled_desktop.hxx"; this
# hack to temporarily disable PCH will become unnecessary with the fix for issue
# 112600:
CFLAGSCXX += -DDISABLE_PCH_HACK

SHL1TARGET = $(TARGET)
SHL1OBJS = $(SLO)$/test_dp_version.obj
SHL1STDLIBS = $(CPPUNITLIB) $(DEPLOYMENTMISCLIB) $(SALLIB)
SHL1VERSIONMAP = version.map
SHL1RPATH = NONE
SHL1IMPLIB = i$(SHL1TARGET)
DEF1NAME = $(SHL1TARGET)

SLOFILES = $(SHL1OBJS)

.INCLUDE: target.mk
.INCLUDE : _cppunit.mk
