function fish_prompt --description 'Write out the prompt'
    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    # # User
    # set_color $fish_color_user
    # echo -n (whoami)
    #
    # set_color normal
    # echo -n '@'
    #
    # #Host
    # set_color $fish_color_host
    # echo -n (hostname -s)
    #
    # set_color normal
    # echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    printf '%s' (__fish_git_prompt)

    set_color yellow --bold
    echo -n '$ '
    set_color normal
end

function prompt_pwd --description 'Print the current working directory, replacing the home directory with ~'
    set -l result (echo $PWD | sed "s|^$HOME|~|")

    echo $result
end

function print_exit_code --on-event fish_postexec --description 'Print exit code on command error'
    set -l last_status $status
    if not test $last_status -eq 0
        set_color $fish_color_error
        printf '[exit code %d]\n' $last_status
        set_color normal
    end
end
