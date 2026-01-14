#!/bin/bash                                                                   
#Convert all PDFs in a folder to PNG images                 
                                                                                
folder="${1:-.}"                                                              
                                                                            
if [ ! -d "$folder" ]; then                                                   
    echo "Error: '$folder' is not a directory"                                
    exit 1                                                                    
fi                                                                            
                                                                            
# Check if pdftoppm is installed                                              
if ! command -v pdftoppm &> /dev/null; then                                   
    echo "pdftoppm not found. Install with: sudo apt install poppler-utils"   
    exit 1                                                                    
fi                                                                            
                                                                            
# Find and convert PDFs                                                       
shopt -s nullglob                                                             
pdf_files=("$folder"/*.pdf)                                                   
                                                                            
if [ ${#pdf_files[@]} -eq 0 ]; then                                           
    echo "No PDF files found in '$folder'"                                    
    exit 0                                                                    
fi                                                                            
                                                                            
echo "Found ${#pdf_files[@]} PDF file(s)"                                     
                                                                            
for pdf in "${pdf_files[@]}"; do                                              
    filename=$(basename "$pdf" .pdf)                                          
                                                                                                                          
    echo "Converting: $pdf"                                                   
    pdftoppm -png -r 300 "$pdf" "$filename"                       
done                                                                          
                                                                            
echo "Done!"                                                                  
                                                                            
