#Projet OpenGL
CXX=g++
CC=gcc

UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
LDFLAGS= -lglut -lGLU -lGL -lGLEW
CFLAGS= -g -Wall -I. -DLINUX
endif

ifeq ($(UNAME), Darwin)
LDFLAGS= -framework glew -framework GLUT -framework OpenGL -framework Cocoa
CFLAGS= -g -Wall -I. -DMAC
endif

EXE=projet

SRC= $(wildcard *.cpp)
OBJ= $(SRC:.cpp=.o)

$(EXE) : $(OBJ)
	$(CXX) $^ $(LDFLAGS) -o $(EXE) $(EXTRA)

#dependances des .h
main.o : terrain.h tga.h main.h shaders.h
terrain.o : terrain.h tga.h
tga.o : tga.h
shader.o : shader.h
object3d.o : object3d.h vec3.h
objloader.o : objloader.h object3d.h

#cible générique
%.o : %.cpp
	$(CXX) -c $(CFLAGS) $< -o $@ $(EXTRA)
	
.PHONY : clean ultraclean

clean::
	rm -f *.o *~

ultraclean : clean
	rm -f $(EXE)

