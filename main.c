/* Name: Tan Thai                                  *
 * NetID: tanhoangthai                             *
 * Description: this code contains my solution for *
 *              the fourth project of COP3514.002  */

#include <stdio.h>
#include <stdlib.h>

void createArr(int arr[], int N);
void findLargestSeq(int *arr, int N, int K);
void getSizeOfLargestSeq(int *arr, int *i, int *max, int N, int K);

int main() {

	// Initalize variables and scan N and K (Threshold)
    int N, K;
	scanf("%d %d", &N, &K);

	// Create array of size N with input numbers
	int *arr = malloc(sizeof(int) * N);
	createArr(arr, N);

	// Find largest sequence of consecutive numbers less than K
	findLargestSeq(arr, N, K);
	
    return 0;
}

void createArr(int *arr, int N) {
	
	for(int i = 0; i < N; i++) {
		
		int *value = arr;
		scanf("%d", value + i);
		
	}
	
}

void findLargestSeq(int *arr, int N, int K) {
	
	// Initialize size (size = length of largest sequence)
	int size = -1; 
	
	// Iterate through array, i to N
	for(int *i = arr; i < arr + N ; i++)
		
		// Calculate length of sequences and get largest size of all sequences
		getSizeOfLargestSeq(arr, i, &size, N, K);
	
	// Output size of longest sequences
	printf("%d\n", size);

}


void getSizeOfLargestSeq(int *arr, int *i, int *size, int N, int K){
	
	// Reset length of the sequences (length = length of sequences)
	int length = 0;
	
	// Iterate through j, where j starts from i to N (int *j = i)
	// To calculate the length of the next sequence
	for(int *j = i; j < arr + N; j++){
		
		// Increment the length of the sequence 
		// if the largest - smallest element in sequence is less than K
		if (*j - *i < K) length++; 
		
		// If greater than K (threshhold), break  
		else break;

	}
	
	// Update new length of longest sequence 
	if (length >= *size) *size = length;

}




