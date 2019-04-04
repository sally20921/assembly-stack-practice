//
//  bmpmosaic.c
//  
//
//  Created by 이세리 on 2018. 11. 10..
//

#include <stdio.h>

void CalculatingSquare(unsigned char *sqrptr, long long width, long long height, long long real_width){
    int sum1 = 0;
    int sum2 = 0;
    int sum3 = 0;
    int num = 0;
    unsigned char *pointer = sqrptr;
    unsigned char *start = sqrptr;
    for (int i = 0; i < height; i++){
        start = pointer;
        for (int j = 0; j < width; j++){
            num++;
            sum1 += *pointer;
            sum2 += *(pointer+1);
            sum3 += *(pointer+2);
            pointer+=3;
        }
        pointer = start+real_width;
    }
    unsigned char mosaic1 = sum1/num;
    unsigned char mosaic2 = sum2/num;
    unsigned char mosaic3 = sum3/num;
    
    unsigned char *pointer2 = sqrptr;
    unsigned char *start2 = sqrptr;
    for (int i = 0; i < height; i++){
        start2 = pointer2;
        for (int j = 0; j < width; j++){
            *pointer2 = mosaic1;
            *(pointer2+1) = mosaic2;
            *(pointer2+2) = mosaic3;
            pointer2+=3;
        }
        pointer2 = start2+real_width;
    }
}



void bmp_mosaic(unsigned char *imgptr, long long width, long long height, long long size){
    
    //compute the remaining bits in heights
    long long numbers_height = height / size;
    long long remaining_height = height % size;
    
    //compute the remaining bits in widths
    long long numbers_width = width / size;
    long long remaining_width = width % size;
    //in reality, remaining_width*3
    
    //computing the real width in bytes point of view
    long long real_width = 3*width;
    if ((real_width%4)!=0) {
        while((real_width%4)!=0){
            real_width++;
        }
    }
   
    unsigned char *pointer = imgptr;
    unsigned char *start = imgptr;
    
    //compute incomplete squares first
    //imgptr will move 3*size for some time and then the rest
    for (int i  = 0; i < numbers_width; i++){
        CalculatingSquare(pointer, size, remaining_height, real_width);
        pointer += 3*size;
    }
    CalculatingSquare(pointer, remaining_width, remaining_height, real_width);
    pointer = start+(real_width*remaining_height);
    
    for (int i = 0; i < numbers_height; i++){
        start = pointer;
        for (int j = 0; j < numbers_width; j++){
            CalculatingSquare(pointer, size, size, real_width);
            pointer+=3*size;
        }
        CalculatingSquare(pointer, remaining_width, size, real_width);
        pointer = start+(real_width*size);
    }
}




