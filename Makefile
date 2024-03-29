CC=gcc
CFLAGS=-g -Wall -Werror
LD=-lSDL2 -lSDL2main -lSDL2_ttf -lSDL2_image -lm
BINPATH=bin
SRCPATH=src

build: $(BINPATH) $(BINPATH)/engine

$(BINPATH):
	mkdir $(BINPATH)

$(BINPATH)/engine: $(BINPATH)/main.o 
	$(CC) $(BINPATH)/*.o -o $(BINPATH)/engine ${LD}

$(BINPATH)/main.o: $(SRCPATH)/main.* $(BINPATH)/engine.o
	$(CC) -c ${CFLAGS} $(SRCPATH)/main.c -o $(BINPATH)/main.o

$(BINPATH)/engine.o: $(SRCPATH)/engine.* $(BINPATH)/object.o $(BINPATH)/time.o
	$(CC) -c ${CFLAGS} $(SRCPATH)/engine.c -o $(BINPATH)/engine.o

$(BINPATH)/object.o: $(SRCPATH)/object.* $(BINPATH)/vector.o $(BINPATH)/circle.o $(BINPATH)/link.o
	$(CC) -c ${CFLAGS} $(SRCPATH)/object.c -o $(BINPATH)/object.o

$(BINPATH)/vector.o: $(SRCPATH)/vector.*
	$(CC) -c ${CFLAGS} $(SRCPATH)/vector.c -o $(BINPATH)/vector.o

$(BINPATH)/circle.o: $(SRCPATH)/circle.*
	$(CC) -c ${CFLAGS} $(SRCPATH)/circle.c -o $(BINPATH)/circle.o

$(BINPATH)/link.o: $(SRCPATH)/link.*
	$(CC) -c ${CFLAGS} $(SRCPATH)/link.c -o $(BINPATH)/link.o

$(BINPATH)/time.o: $(SRCPATH)/time.*
	$(CC) -c ${CFLAGS} $(SRCPATH)/time.c -o $(BINPATH)/time.o

clean:
	rm -r $(BINPATH)