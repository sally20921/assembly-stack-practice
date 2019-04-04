//
//  bmpmosaic.c
//  
//
//  Created by 이세리 on 2018. 11. 10..
//

#include <stdio.h>
long long real_width;
long numbers_height;
long remaining_height;
long numbers_width;
long remaining_width;

unsigned char *pointer;
int sum1;
int sum2;
int sum3;
void CalculatingSquare(unsigned char *sqrptr, long long width, long long height){
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;

    pointer = sqrptr;
    //start1 = sqrptr;
    for (int i = 0; i < height; i++){
        //start1 = sqrptr;
        for (int j = 0; j < width; j++){
        
            sum1 += *sqrptr;
            sum2 += *(sqrptr+1);
            sum3 += *(sqrptr+2);
            sqrptr+=3;
        }
        sqrptr = sqrptr-(3*width)+real_width;
    }

    //start2 = pointer;
    for (int i = 0; i < height; i++){
        //start2 = pointer;
        for (int j = 0; j < width; j++){
            *pointer = sum1/(width*height);
            *(pointer+1) = sum2/(width*height);
            *(pointer+2) = sum3/(width*height);
            pointer+=3;
        }
        pointer = pointer-(3*width)+real_width;
    }
}




void bmp_mosaic(unsigned char *imgptr, long long width, long long height, long long size){
    
    //compute the remaining bits in heights
    numbers_height = height/size;
    remaining_height = height % size;
    
    //compute the remaining bits in widths
    numbers_width = width / size;
    remaining_width = width % size;
    //in reality, remaining_width*3
    
    //computing the real width in bytes point of view
    real_width = 3*width;
    while((real_width%4)!=0){
            real_width++;
    }
   
    //unsigned char *pointer = imgptr;
    //start = imgptr;
    
    //compute incomplete squares first
    //imgptr will move 3*size for some time and then the rest
    for (int i  = 0; i < numbers_width; i++){
        CalculatingSquare(imgptr, size, remaining_height);
        imgptr += 3*size;
    }
    CalculatingSquare(imgptr,remaining_width, remaining_height);
    imgptr = imgptr-(3*size*numbers_width)+(real_width*remaining_height);
    
    for (int i = 0; i < (numbers_height); i++){
        //start = imgptr;
        for (int j = 0; j < (numbers_width); j++){
            CalculatingSquare(imgptr, size, size);
            imgptr+=3*size;
        }
        CalculatingSquare(imgptr, remaining_width, size);
        imgptr = imgptr-(3*size*numbers_width)+(real_width*size);
    }
}




