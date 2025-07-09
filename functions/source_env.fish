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
        set -l value $raw_val
        if string match -q '"*"' $value; or string match -q "'*'" $value
            set value (string unescape $value)
        end

        # If the value used single quotes, don't expand anything
        if not string match -q "'*'" $raw_val
            while string match -qr '\$\{?[A-Za-z_][A-Za-z_0-9]*\}?' $value
                set -l env_ref  (string match -r '\$\{?[A-Za-z_][A-Za-z_0-9]*\}?' $value)
                set -l env_name (string match -r '[A-Za-z_0-9]+' $env_ref)
                set value (string replace $env_ref $$env_name $value)
            end
        end

        # echo "[name=$name; value=$value; raw_val=$raw_val]"
        set -gx $name $value
    end
end
