function source_env
    for line in (cat $argv[1])
        set line (string trim $line)
        if test -z $line; or string match -q "#*" $line
            continue
        end
        set -l split_line (string split -m 1 = $line)
        set -l name (string trim $split_line[1])
        set -l raw_val (string trim $split_line[2])
        # echo "[line=$line,split_line=$split_line,name=$name,raw_val=$raw_val]"

        # Unquote values and handle any environment replacements
        if string match -q '"*"' $raw_val; or string match -q "'*'" $raw_val
            set raw_val (string sub -s 2 -e -1 $raw_val)
        end
        if string match -qr '[$][{][A-Za-z_][A-Za-z_0-9]*[}]' $raw_val
            set raw_val (string replace -ar '[$][{]([A-Za-z_][A-Za-z_0-9]*)[}]' '{$$$1}' $raw_val)
        end
        set -l value (eval "echo $raw_val")
        # echo "[name=$name; value=$value; raw_val=$raw_val]"
        set -gx $name $value
    end
end
