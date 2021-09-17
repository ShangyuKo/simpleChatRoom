.PHONY: all clean

CC=gcc
CFLAGS=-std=c99

all:
	$(CC) $(CFLAGS) -o server ./src/server.c ./src/common.c
	$(CC) $(CFLAGS) -o client ./src/client.c ./src/common.c -pthread
clean:
	$(RM) $(TARGET)
