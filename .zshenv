candidates=(~/.cargo/bin ~/bin /home/linuxbrew/.linuxbrew/bin)
bindirs=()
for dir in $candidates; do
    if [[ -d $dir ]]; then
        bindirs+=$dir
    fi
done

typeset -U path
path=($bindirs $path)
export RIPGREP_CONFIG_PATH=~/.config/ripgrep.config
