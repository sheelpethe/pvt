dir=$(pwd)

find    $dir/arch/arm64                                 \
        -path "$dir/arch/arm64/xen"        -prune -o    \
        -type f                                       \
        -not -name '*.mod.c'                          \
        -name "*.[chsS]" -print > cscope.files

find    $dir/virt/kvm                         \
        -type f                                       \
        -not -name '*.mod.c'                          \
        -name "*.[chsS]" -print >> cscope.files

find    $dir/include/linux                         \
        -type f                                       \
        -not -name '*.mod.c'                          \
        -name "*.[chsS]" -print >> cscope.files

cscope -b -q -k
ctags -L cscope.files
rm -f cscope.files

