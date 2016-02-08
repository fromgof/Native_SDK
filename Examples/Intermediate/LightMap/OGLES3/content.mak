#--------------------------------------------------------------------------
# Name         : content.mak
# Title        : Makefile to build content files
#
# Copyright    : Copyright (C) by Imagination Technologies Limited.
#
# Description  : Makefile to wrap content files for examples in the PowerVR SDK
#
# Platform     :
#
#--------------------------------------------------------------------------

#############################################################################
## Variables
#############################################################################
FILEWRAP 	= ..\..\..\..\Utilities\Filewrap\Windows_x86_32\Filewrap.exe
CONTENTDIR = Content

#############################################################################
## Instructions
#############################################################################

RESOURCES = \
	$(CONTENTDIR)/FragShader.cpp \
	$(CONTENTDIR)/VertShader.cpp \
	$(CONTENTDIR)/Mask.cpp \
	$(CONTENTDIR)/Plane.cpp \
	$(CONTENTDIR)/Basetex.cpp \
	$(CONTENTDIR)/Reflection.cpp \
	$(CONTENTDIR)/Shadow.cpp

all: resources
	
help:
	@echo Valid targets are:
	@echo resources, clean
	@echo FILEWRAP can be used to override the default path to the Filewrap utility.

clean:
	@for i in $(RESOURCES); do test -f $$i && rm -vf $$i || true; done

resources: $(RESOURCES)

$(CONTENTDIR):
	-mkdir "$@"

$(CONTENTDIR)/FragShader.cpp: $(CONTENTDIR) ./FragShader.fsh
	$(FILEWRAP)  -s  -o $@ ./FragShader.fsh

$(CONTENTDIR)/VertShader.cpp: $(CONTENTDIR) ./VertShader.vsh
	$(FILEWRAP)  -s  -o $@ ./VertShader.vsh

$(CONTENTDIR)/Mask.cpp: $(CONTENTDIR) ./Mask.pod
	$(FILEWRAP)  -o $@ ./Mask.pod

$(CONTENTDIR)/Plane.cpp: $(CONTENTDIR) ./Plane.pod
	$(FILEWRAP)  -o $@ ./Plane.pod

$(CONTENTDIR)/Basetex.cpp: $(CONTENTDIR) ./Basetex.pvr
	$(FILEWRAP)  -o $@ ./Basetex.pvr

$(CONTENTDIR)/Reflection.cpp: $(CONTENTDIR) ./Reflection.pvr
	$(FILEWRAP)  -o $@ ./Reflection.pvr

$(CONTENTDIR)/Shadow.cpp: $(CONTENTDIR) ./Shadow.pvr
	$(FILEWRAP)  -o $@ ./Shadow.pvr

############################################################################
# End of file (content.mak)
############################################################################