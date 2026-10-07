# Init thingsies
export XDG_RUNTIME_DIR="/run/user/"(id -u)
export DBUS_SESSION_BUS_ADDRESS="unix:path="(echo $XDG_RUNTIME_DIR)"/bus"

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

starship init fish | source

function fish_greeting
    fastfetch
end

# nnn cd on close
function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
        echo "nnn is already running"
        return
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "-x" from both lines below,
    # without changing the paths.
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command function allows one to alias this function to `nnn` without
    # making an infinitely recursive alias
    command nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm -- $NNN_TMPFILE
    end
end

# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always' # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles

alias kssh="kitten ssh"
alias play='mpv -fs --sub=1'
alias rsync='rsync -h --info=progress2'
alias rmv='/usr/bin/rm -v'
alias rmf='rm -vf'
alias syncmusic='rsync -aur -e "ssh -p 70" --delete levi@192.168.1.52:/mnt/disk1/data/music/ ~/Music/Library/'
alias syncipod='rsync -utr --modify-window=1 --delete ~/Music/Library/ /run/media/levi/LEVI_S\ IPOD/Music/'

