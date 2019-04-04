//
//  bmpmosaic.c
//  
//
//  Created by 이세리 on 2018. 11. 10..
//

#include <stdio.h>

void bmp_mosaic(unsigned char *imgptr, long long width, long long height, long long size){
    
    //compute the remaining bits in heights
    long numbers_height = height/size;
    long remaining_height = height % size;
    
    //compute the remaining bits in widths
    long numbers_width = width / size;
    long remaining_width = width % size;
    //in reality, remaining_width*3
    
    //computing the real width in bytes point of view
    long long real_width = 3*width;
    while((real_width%4)!=0){
        real_width++;
    }
    
    unsigned char *pointer1 = imgptr;
    unsigned char *pointer2 = imgptr;
    int sum1 = 0;
    int sum2 = 0;
    int sum3 = 0;
    //start = imgptr;
    
    //compute incomplete squares first
    //imgptr will move 3*size for some time and then the rest
    for (int i  = 0; i < numbers_width; i++){
        pointer1 = imgptr;
        pointer2= imgptr;
        for (int k = 0; k < remaining_height; k++){
            for (int j = 0; j < size; j++){
                sum1 += *pointer1;
                sum2 += *(pointer1+1);
                sum3 += *(pointer1+2);
                pointer1+=3;
            }
            pointer1 = pointer1-(3*size)+real_width;
        }
        for (int k = 0; k < remaining_height; k++){
            for (int j = 0; j < size; j++){
                *pointer2 = sum1/(size*remaining_height);
                *(pointer2+1) = sum2/(size*remaining_height);
                *(pointer2+2) = sum3/(size*remaining_height);
                pointer2+=3;
            }
            pointer2 = pointer2-(3*size)+real_width;
        }
        imgptr += 3*size;
        sum1 = 0;
        sum2 = 0;
        sum3 = 0;
    }
    
    pointer1 = imgptr;
    pointer2= imgptr;
    for (int k = 0; k < remaining_height; k++){
        for (int j = 0; j < remaining_width; j++){
            sum1 += *pointer1;
            sum2 += *(pointer1+1);
            sum3 += *(pointer1+2);
            pointer1+=3;
        }
        pointer1 = pointer1-(3*remaining_width)+real_width;
    }
    for (int k = 0; k < remaining_height; k++){
        for (int j = 0; j <remaining_width; j++){
            *pointer2 = sum1/(remaining_width*remaining_height);
            *(pointer2+1) = sum2/(remaining_width*remaining_height);
            *(pointer2+2) = sum3/(remaining_width*remaining_height);
            pointer2+=3;
        }
        pointer2 = pointer2-(3*remaining_width)+real_width;
    }
    imgptr = imgptr-(3*size*numbers_width)+(real_width*remaining_height);
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    
    for (int i = 0; i < numbers_height; i++){
        for (int j = 0; j < numbers_width; j++){
            pointer1 = imgptr;
            for (int k = 0; k < size; k++){
                for (int s = 0; s < size; s++){
                    
                    sum1 += *pointer1;
                    sum2 += *(pointer1+1);
                    sum3 += *(pointer1+2);
                    pointer1+=3;
                }
                pointer1 = pointer1-(3*size)+real_width;
            }
            pointer2= imgptr;
            for (int k = 0; k < size; k++){
                for (int s = 0; s < size; s++){
                    *pointer2 = sum1/(size*size);
                    *(pointer2+1) = sum2/(size*size);
                    *(pointer2+2) = sum3/(size*size);
                    pointer2+=3;
                }
                pointer2 = pointer2-(3*size)+real_width;
            }
            imgptr+=3*size;
            sum1 = 0;
            sum2 = 0;
            sum3 = 0;
        }
        pointer1 = imgptr;
        for (int k = 0; k < size; k++){
            for (int j = 0; j < remaining_width; j++){
                
                sum1 += *pointer1;
                sum2 += *(pointer1+1);
                sum3 += *(pointer1+2);
                pointer1+=3;
            }
            pointer1 = pointer1-(3*remaining_width)+real_width;
        }
        pointer2= imgptr;
        for (int k = 0; k < size; k++){
            for (int j = 0; j < remaining_width; j++){
                *pointer2 = sum1/(remaining_width*size);
                *(pointer2+1) = sum2/(remaining_width*size);
                *(pointer2+2) = sum3/(remaining_width*size);
                pointer2+=3;
            }
            pointer2 = pointer2-(3*remaining_width)+real_width;
        }
        imgptr = imgptr-(3*size*numbers_width)+(real_width*size);
        sum1 = 0;
        sum2 = 0;
        sum3 = 0;
    }
}






