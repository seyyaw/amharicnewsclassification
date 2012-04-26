## Praat script by Kevin Ryan 9/05
## Below: the user is asked for a directory (the default below is the path for my own desktop;
## you will probably want to change that), a file extension, and an optional substring to match
## in the filenames (leaving this blank will get all the files of the given type)

form Read all files of the given type from the given directory
   sentence Source_directory C:\Documents and Settings\Kevin\Desktop\
   sentence File_name_or_initial_substring 
   sentence File_extension .wav
endform

## Below: collect all the files that match the search criteria and save them

Create Strings as file list... list 'source_directory$'/'file_name_or_initial_substring$'*'file_extension$'
head_words = selected("Strings")
file_count = Get number of strings

## Below: loop through the list of files, extracting each name and reading it into the Objects list

for current_file from 1 to file_count
   select Strings list
   filename$ = Get string... current_file
   Read from file... 'source_directory$'/'filename$'
endfor

## Finally, remove the temporary file list object (head_words) and report the number of files read

select 'head_words'
Remove
clearinfo
echo Done! 'file_count' files read.'newline$'.
