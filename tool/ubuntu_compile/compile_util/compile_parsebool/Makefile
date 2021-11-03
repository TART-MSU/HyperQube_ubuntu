#!/bin/sh

JFLAGS = -g
JC = javac
#NAME=bakery_generator
NAME=util_parsebools


CLASSES = ${NAME}.java

.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

.jar:
	@echo "Manifest-Version: 1.0" > manifest.txt
	@echo "Main-Class: "${NAME} >> manifest.txt
	@echo "" >> manifest.txt
	jar cfm ${NAME}.jar manifest.txt *.class

.exe:
	cat stub.sh ${NAME}.jar >> ${NAME} && sudo chmod +x ${NAME}

default: classes .jar .exe  clean

classes: $(CLASSES:.java=.class)

# remove all generated files
clean:
	find . -name "*.bool" -delete
	find . -name "*.cex" -delete
	find . -name "*.quabs" -delete
	find . -name "*.qcir" -delete
	find . -name "*.class" -delete
	find . -name "*.cex" -delete
	find . -name "*.jar" -delete
	find . -name "*.txt" -delete
