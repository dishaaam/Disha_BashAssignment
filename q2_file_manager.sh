#!/bin/bash

while true
do
    echo ""
    echo "FILE & DIRECTORY MANAGER"
    echo "1. List all the files"
    echo "2. Create directory"
    echo "3. Create file"
    echo "4. Delete file"
    echo "5. Rename a file"
    echo "6. Search a file"
    echo "7. Count files and directories"
    echo "8. View the file permissions"
    echo "9. Copy the file"
    echo "10. Exit"
    echo ""

    read -p "Enter choice: " choice

    case $choice in

        1)
            ls -lh
            ;;

        2)
           #check if the directory already exists
            read -p "Enter directory name: " dname
            if [ -d "$dname" ]; then
                echo "Directory already exists"
            else
                mkdir "$dname"
                echo "Directory created"
            fi
            ;;

        3)
           #check if file exists
            read -p "Enter file name: " fname
            if [ -f "$fname" ]; then
                echo "File already exists"
            else
                touch "$fname"
                echo "File created"
            fi
            ;;

        4)
            #to delete a file
            read -p "Enter file name to delete: " fname
            if [ -f "$fname" ]; then
                read -p "Are you sure? (y/n): " ans
                if [ "$ans" = "y" ]; then
                    rm "$fname"
                    echo "File deleted"
                else
                    echo "Cancelled"
                fi
            else
                echo "File not found"
            fi
            ;;

        5)
            #to rename a file
            read -p "Old file name: " old
            read -p "New file name: " new
            if [ -f "$old" ]; then
                mv "$old" "$new"
                echo "File renamed"
            else
                echo "File not found"
            fi
            ;;

        6)
            #to search a file
            read -p "Enter file name to search: " search
            find . -name "$search"
            ;;

        7)
            #to cound the no. of files and directories
            fcount=$(ls -l | grep ^- | wc -l)
            dcount=$(ls -l | grep ^d | wc -l)
            echo "Files: $fcount"
            echo "Directories: $dcount"
            ;;

        8)
           #to check for the file permissions
            read -p "Enter file name to check permissions: " fname
            if [ -e "$fname" ]; then
                ls -l "$fname"
            else
                echo "File not found"
            fi
            ;;

        9)
            read -p "Enter source file: " src
            read -p "Enter destination file name: " dest
            if [ -f "$src" ]; then
                cp "$src" "$dest"
                echo "File copied"
            else
                echo "Source file not found"
            fi
            ;;

        10)
           #exit the program
            echo "Exiting program"
	    echo "Done"
            break
            ;;

        *)
            #if any other number is entered other than the available case statements
            echo "Invalid choice"
            ;;

    esac

done
