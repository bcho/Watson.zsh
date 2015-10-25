# watson.plugin.zsh
# RPROMPT support for watson.

__WATSON_PLUGIN_DIR="${0:A:h}"

watson_status() {
    local watsonstatus="$__WATSON_PLUGIN_DIR/_watson.py"
    IFS=$'\n' _WATSON_STATUS=($(${ZSH_THEME_WATSON_PYTHON} ${watsonstatus} 2>/dev/null))
    WATSON_PROJECT=$_WATSON_STATUS[1]
    WATSON_PROJECT=$(echo ${WATSON_PROJECT} | tr -d '\n')
    WATSON_TAGS=$_WATSON_STATUS[2]
    WATSON_DURATION=$_WATSON_STATUS[3]

    if [ -n "$WATSON_PROJECT" ]; then
        STATUS="(%{${fg_bold[green]}%}$WATSON_PROJECT%{${reset_color}%}: $WATSON_TAGS, $WATSON_DURATION)"
        echo "$STATUS"
    fi
}

# python executable path
ZSH_THEME_WATSON_PYTHON="python"

RPROMPT='$(watson_status)'
