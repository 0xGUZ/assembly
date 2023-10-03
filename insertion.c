#include <stdio.h>

void insertionSort(int arr[], int n) {
    int i, key, j;
    for (i = 1; i < n; i++) {
        key = arr[i]; /* armazena o valor atual que será comparado */
        j = i - 1;

        /* Move os elementos de arr[0..i-1], que são maiores que key,
        para uma posição à frente de suas posições atuais */
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}

void printArray(int arr[], int n) {
    int i;
    for (i=0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr)/sizeof(arr[0]);
    insertionSort(arr, n);
    printf("array ordenada: \n");
    printArray(arr, n);
    return 0;
}
