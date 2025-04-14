function setup-env --on-variable PWD
    if test -r .env
        source_env .env
    end

    for dir_name in .venv venv
        if ! test -r $dir_name/bin/activate.fish
            continue
        end

        if type -q deactivate
            deactivate
        end
        source $dir_name/bin/activate.fish
        break
    end
end
