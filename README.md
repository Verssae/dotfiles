# dotfiles

내 macOS 환경 설정. [holman/dotfiles](https://github.com/holman/dotfiles)의
topic 구조를 기반으로 시작해서, 안 쓰는 것들을 걷어내고 내 환경에 맞게 정리했다.

## 구성

- **zsh** — starship 프롬프트, fzf/fzf-tab, autosuggestions, syntax-highlighting
- **nvim** — [LazyVim](https://www.lazyvim.org) 기반. `config/nvim/`에 있고
  `~/.config/nvim`으로 심링크됨. [Maple](https://github.com/subframe7536/vscode-theme-maple)
  테마(mapledark.nvim, kitty도 같은 팔레트), markdown 인라인 렌더링 + 브라우저 프리뷰 포함
- **git** — gitconfig, gitignore, 별칭들
- **kitty** — 터미널. `config/kitty/`에 있고 `~/.config/kitty`로 심링크됨.
  Maple Dark 테마(nvim과 동일 팔레트), Stork Mono + Maple Mono NF(아이콘) 폰트

## 규칙 (holman 방식)

- `topic/*.zsh` — 셸 시작 시 자동 로드
- `topic/path.zsh` — 가장 먼저 로드 (PATH 설정)
- `topic/completion.zsh` — 가장 나중에 로드 (자동완성)
- `topic/*.symlink` — `script/bootstrap` 실행 시 `~/.<이름>`으로 심링크
- `bin/` — `$PATH`에 추가됨
- `config/<앱>` — `~/.config/<앱>`으로 심링크 (수동 또는 bootstrap)
- 비밀 환경변수는 `~/.localrc`에 (repo 밖)

## 새 머신 설치

```sh
git clone <this-repo> ~/.dotfiles
cd ~/.dotfiles
script/bootstrap        # symlink 생성
brew bundle             # Brewfile 설치
ln -s ~/.dotfiles/config/nvim ~/.config/nvim
ln -s ~/.dotfiles/config/kitty ~/.config/kitty
ln -s ~/.dotfiles/config/starship.toml ~/.config/starship.toml
```

## nvim 유지보수

- 플러그인 업데이트: `:Lazy sync` (버전은 `lazy-lock.json`에 고정됨 — 커밋해둘 것)
- LazyVim 기능 켜고 끄기: `:LazyExtras`
- 커스텀 설정: `config/nvim/lua/config/*.lua` (options/keymaps/autocmds),
  플러그인 추가/오버라이드: `config/nvim/lua/plugins/*.lua`
