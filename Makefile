CC = gcc
CC_OMP = -fopenmp
CC_FLAGS = -Wall

all: serial.out omp.out

clean:
	rm serial.out omp.out result.*

serial.out: src/main_serial.c src/image_io.h src/image_io.c src/kmeans.h src/kmeans_serial.c
	$(CC) $(CC_OMP) $(CC_FLAGS) -o serial.out src/main_serial.c src/image_io.c src/kmeans_serial.c -lm

omp.out: src/main_omp.c src/image_io.h src/image_io.c src/kmeans.h src/kmeans_omp.c
	$(CC) $(CC_OMP) $(CC_FLAGS) -o omp.out src/main_omp.c src/image_io.c src/kmeans_omp.c -lm
