function __aws_complete
  set -lx COMP_SHELL fish
  set -lx COMP_LINE (commandline -pc)

  if string match -q -- "-*" (commandline -pt)
    set COMP_LINE $COMP_LINE -
  end

  aws_completer | command sed 's/ $//'
end

complete --command aws --no-files --arguments '(__aws_complete)'
