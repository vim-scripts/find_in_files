find_in_files

About: 
	Author: Sappy Goel

This script is used to find a string in files in current directory. This script copies the 
finding in a buffer and opens it in the same window. 

To go to a particular line/file in which the string is found. Click F2 on the top of the 
line in the buffer.

Procedure:
1. execute :CALL "<string>" in gvim
	This will execute windows findstr command and will open the file in the same buffer

2. Go to a line/file in the new buffer that you want to open.

3. Press F2

Result:

It will open up a file in a same window and will go to that line.

How to Execute:
1. :CALL "<string>"
	Will search for String in all the files in current dorectory

2. Press <F3>, this will search all files in directory for string on which the cursor exists

3. Press <F4>, this will seach current file for string on which the cursor exists.