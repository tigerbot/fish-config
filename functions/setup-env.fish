function setup-env --on-variable PWD
    if test -r .env
        source_env .env
    end

    if test -r .venv/bin/activate.fish
        if type -q deactivate
            deactivate
        end
        source .venv/bin/activate.fish
    end
end
