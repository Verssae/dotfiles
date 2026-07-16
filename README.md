# dotfiles

Latest my terminal configurations :)

## 구성

- **터미널**
  - **[Ghostty](https://ghostty.org/)** —
    [Maple Dark](https://github.com/subframe7536/vscode-theme-maple) 팔레트,
    로컬 제작 Stork Mono + [Maple Mono NF](https://font.subf.dev/en/download/)(아이콘) 폰트
  - **[Herdr](https://herdr.dev/)** — AI 코딩 에이전트용 터미널 워크스페이스
    - UI: 에이전트 패널을 space 기준 정렬, 알림을 현재 터미널에 표시
    - 연동: [Claude Code](https://code.claude.com/docs/en/quickstart),
      [Codex](https://learn.chatgpt.com/docs/codex/cli),
      [Hermes](https://hermes-agent.nousresearch.com/)
      (`herdr integration install ...`로 설치)
    - `config.toml`만 관리하며 세션과 로그는 `~/.config/herdr/`에 로컬로 유지
- **셸 ([zsh](https://www.zsh.org/))**
  - 프롬프트: [starship](https://starship.rs/)
  - 플러그인: [fzf](https://github.com/junegunn/fzf)/[fzf-tab](https://github.com/Aloxaf/fzf-tab),
    [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions),
    [history-substring-search](https://github.com/zsh-users/zsh-history-substring-search),
    [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- **에디터 ([nvim](https://neovim.io/))** — [LazyVim](https://www.lazyvim.org) 기반
  - [Extras](https://www.lazyvim.org/extras): Git, JSON, Markdown, Python, TypeScript, YAML
  - 테마: [Maple Dark](https://github.com/subframe7536/vscode-theme-maple)
  - Markdown: [`render-markdown.nvim`](https://github.com/MeanderingProgrammer/render-markdown.nvim)
    인라인 렌더링, [`live-preview.nvim`](https://github.com/brianhuster/live-preview.nvim)
    브라우저 프리뷰
- **[git](https://git-scm.com/)** — 전역 gitconfig/gitignore와 별칭

## 규칙

- 셸 설정은 `zsh/zshrc.symlink` 한 파일 (별칭·PATH·플러그인·프롬프트 전부)
- `*.symlink` — `~/.<이름>`으로 심링크해서 쓰는 파일
- `config/<앱>` — `~/.config/<앱>`으로 심링크
  (herdr는 `config.toml`만 링크 — 세션/로그는 로컬에 유지)
- `functions/` — zsh autoload 함수 (`extract`, `gf`)와 컴플리션
- 비밀 환경변수는 `~/.localrc`에 (repo 밖)
- git 커밋 신원은 gitignore된 `git/gitconfig.local.symlink`에서 관리 —
  기본 신원 + 원격 org별 `includeIf`로 계정 자동 전환
  (`gitconfig.local.symlink.example` 참고)

## 새 머신 설치

설치 스크립트는 없다 — 아래 블록이 전부라서, 직접 복붙하거나 AI 에이전트에게
"README대로 세팅해줘"라고 하면 된다. 기존 설정 파일이 있으면 먼저 백업할 것.
[homebrew](https://brew.sh)는 미리 설치돼 있어야 한다.

```sh
git clone https://github.com/Verssae/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# git 신원 — repo에 커밋되지 않는다. 이름/이메일은 본인 것으로.
# 원격 org별 계정 자동 전환은 git/gitconfig.local.symlink.example 참고.
printf '[user]\n\tname = <이름>\n\temail = <이메일>\n' > git/gitconfig.local.symlink

# 점파일 심링크 (*.symlink → ~/.<이름>)
for f in */*.symlink; do ln -s ~/.dotfiles/"$f" ~/."$(basename "${f%.symlink}")"; done

# ~/.config 심링크 — herdr는 세션/로그가 로컬에 쌓이므로 config.toml만 링크한다
mkdir -p ~/.config/herdr
ln -s ~/.dotfiles/config/nvim ~/.config/nvim
ln -s ~/.dotfiles/config/ghostty ~/.config/ghostty
ln -s ~/.dotfiles/config/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/config/herdr/config.toml ~/.config/herdr/config.toml

# 패키지
brew bundle

herdr integration install claude
herdr integration install codex
exec zsh
```

## nvim 유지보수

- 플러그인 업데이트: `:Lazy sync` (버전은 `lazy-lock.json`에 고정됨 — 커밋해둘 것)
- [LazyVim Extras](https://www.lazyvim.org/extras) 켜고 끄기: `:LazyExtras`
- 커스텀 설정: `config/nvim/lua/config/*.lua` (options/keymaps/autocmds),
  플러그인 추가/오버라이드: `config/nvim/lua/plugins/*.lua`
