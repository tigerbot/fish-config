#
# Make rsync copy recursively and preserve symbolic links, timestamps, and permisions
#

function rsync --description "Resursively copy, preserving symbolic links, timestamps, and permisions"
  command rsync -rltp $argv
end
