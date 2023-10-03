#include <stdio.h>

void selectionSort(int arr[], int n) {
    int temp,i,j;
    for(i = 0; i < n-1; i++) {
        int min_idx = i;
        for(j = i + 1; j < n; j++) {
            if(arr[j] < arr[min_idx]) {
                min_idx = j;
            }
        }
        /*troca arr[i] e arr[min_idx]*/
        temp = arr[min_idx];
        arr[min_idx] = arr[i];
        arr[i] = temp;
    }
}

void printArray(int arr[], int size) {
    int i;
    for(i = 0; i < size; i++){
        printf("%d ", arr[i]);
    }  
    printf("\n");
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr)/sizeof(arr[0]); /* da def nisso */
    selectionSort(arr, n);
    printf("array ordenada: \n");
    printArray(arr, n);
    return 0;
}
