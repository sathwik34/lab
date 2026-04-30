#include <stdio.h>
#include <stdlib.h> 
int main() 
{ 
    char data[1024]; 
// Open a file in write mode. Simulating a cloud storage by using a local file. 
FILE *fptr = fopen("cloud_storage.txt", "w"); 
if (fptr == NULL) {
    printf("Error opening the file!\n"); 
    exit(1); 
} 
// Get user input 
printf("Enter text to store in the cloud: "); 
fgets(data, sizeof(data), stdin); 
// Write data to the file 
fprintf(fptr, "%s", data); 
// Close the file 
fclose(fptr); 
printf("Data successfully saved to 'cloud_storage.txt'\n"); 
return 0; 
} 