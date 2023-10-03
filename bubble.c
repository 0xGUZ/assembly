#include <stdio.h>

void bubbleSort(int arr[], int n) {
    int temp;
    int swapped;
    int i,j;
    
    for (i = 0; i < n-1; i++) {
        swapped = 0; /* bool que ve se trocou, vai ser a condicao final */
        for (j = 0; j < n-i-1; j++) {
            /* troca se o atual é maior q o proximo */
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                swapped = 1; 
            }
        }
        /* se iterando nao teve troca entao a lista ta sortada */
        if (swapped == 0)
            break;
    }
}

void printArray(int arr[], int size) {
    int i;
    for (i = 0; i < size; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr)/sizeof(arr[0]);
    bubbleSort(arr, n);
    printf("array ordenada: \n");
    printArray(arr, n);
    return 0;
}
