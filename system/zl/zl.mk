.PHONY: all clean run_test
all: run_test
clean:
	rm -f *.o test *~

H = $(wildcard *.h)
C = $(wildcard *.c)
O = $(C:.c=.o)
CFLAGS := -O3 -fPIC -ffast-math -I.. -DHAVE_LIBV4L1_VIDEODEV_H -Wall #-Werror
LIBS := -lpthread -L/usr/X11R6/lib -lX11 -lXv -lXext -lGL -lGLU -llua
%.o: %.c $(H)
	$(CC) $(CFLAGS) -c $< -o $@
test: $(O)
	$(CC) -o test $(O) $(LIBS)

run_test: test
	./test

