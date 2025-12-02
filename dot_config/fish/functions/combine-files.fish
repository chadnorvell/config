function combine_files --description 'concat many files into the first arg'
    # An output file and at least one input file are required
    if test (count $argv) -lt 2
        echo "Usage: combine_files OUTPUT_FILE INPUT_FILE1 [INPUT_FILE2 ...]"
        return 1
    end

    # First argument is the output file
    set output_file $argv[1]
    echo -n "" > $output_file

    # Process each input file
    for i in (seq 2 (count $argv))
        set file $argv[$i]

        # Check if the file exists
        if test -f $file
            # Add the file path as a header
            echo "=== $file ===" >> $output_file
            # Add a newline after the header
            echo "" >> $output_file
            # Add the file contents
            cat $file >> $output_file
            # Add a newline after the file contents
            echo "" >> $output_file
        else
            echo "Warning: File '$file' does not exist, skipping" >&2
        end
    end

    echo "Files have been concatenated into $output_file"
end

