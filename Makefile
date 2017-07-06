#Makefile for SatDUMB project
#Baris Dinc - TAMSAT (TA7W) 2017
#

PYUIC = pyuic4
PYRCC = pyrcc4

UI_FILES = about.ui main.ui settings.ui
RC_FILES = satdump.qrc
PY_FILES = TAMSatDump.py

SRC_FOLDER = src
UI_FOLDER = src/ui
RC_FOLDER = src/res
 
COMPILED_UI = $(UI_FILES:%.ui=$(SRC_FOLDER)/ui_%.py)
COMPILED_RC = $(RC_FILES:%.qrc=$(SRC_FOLDER)/rc_%.py)
 
all : $(COMPILED_UI) $(COMPILED_RC)
 
#Convert all UI form files to python
$(SRC_FOLDER)/ui_%.py: $(UI_FOLDER)/%.ui
	$(PYUIC) -o $@ $<

#Convert all QRC resource files to python
$(SRC_FOLDER)/rc_%.py: $(RC_FOLDER)/%.qrc
	$(PYRCC) -o $@ $<
 
clean : 
	$(RM) $(COMPILED_UI) $(COMPILED_RC) $(COMPILED_UI:.py=.pyc) $(COMPILED_RC:.py=.pyc)  


