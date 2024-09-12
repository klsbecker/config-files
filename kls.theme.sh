#! bash oh-my-bash.module
# KLS Theme

SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX="${_omb_prompt_olive}("
SCM_THEME_PROMPT_SUFFIX=")${_omb_prompt_normal}"

function scm_prompt {
    if git rev-parse --is-inside-git-dir -q > /dev/null 2>&1; then
        echo "${_omb_prompt_red}$(git rev-parse --abbrev-ref HEAD)${_omb_prompt_normal} "
    else
        return
    fi
}

function _omb_theme_PROMPT_COMMAND {
    ps_host="${_omb_prompt_lime}\h${_omb_prompt_normal}";
    ps_user_mark="${_omb_prompt_lime}\$${_omb_prompt_normal}";
    ps_root_mark="${_omb_prompt_red}\§"
    ps_path="${_omb_prompt_green}\w";

    # make it work
    case $(id -u) in
        0) PS1="$ps_host $ps_path $(scm_prompt)$ps_root_mark "
            ;;
        *) PS1="$ps_host $ps_path $(scm_prompt)$ps_user_mark "
            ;;
    esac
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
