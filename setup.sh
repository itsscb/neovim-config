# install dependencies
if ! command -v nvim &> /dev/null
then
  echo "'nvim' not found. Starting setup..."
  sudo dnf install -y nvim
else
  echo "'nvim' already installed."
fi

if ! command -v wget &> /dev/null
then
  echo "'wget' not found. Starting setup..."
  sudo dnf install -y wget
else
  echo "'wget' already installed."
fi


if ! command -v curl &> /dev/null
then
  echo "'curl' not found. Starting setup..."
  sudo dnf install -y curl
else
  echo "'curl' already installed."
fi

if ! command -v unzip &> /dev/null
then
  echo "'unzip' not found. Starting setup..."
  sudo dnf install -y unzip
else
  echo "'unzip' already installed."
fi


# install font 'firacode'
if $(fc-list | grep -i 'fira' -c) == 0 &> /dev/null
then
  echo "'firacode' font not found. Starting setup..."
  # download FiraCode
  wget -O /tmp/fira.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.0/FiraCode.zip

  # make temporary directory
  mkdir /tmp/firacode

  # unzip the font files
  unzip /tmp/fira.zip -d /tmp/firacode

  # create fonts folder
  mkdir ~/.local/share/fonts

  # move *.ttf files to fonts folder
  mv /tmp/firacode/*.ttf ~/.local/share/fonts/

  # remove temp files
  rm /tmp/fira.zip
  rm -rf /tmp/firacode

  # clear and regenerate font cache
  fc-cache -f -v
else
  echo "'firacode' font already installed."
fi


# install 'rust'
if ! command -v rustc &> /dev/null
then
  echo "'rustc' not found. Starting setup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  cat >> ~/.bashrc << EOF
export PATH=$PATH:~/.cargo/bin
EOF
  # source ~/.bashrc
  source ~/.bashrc
else
  echo "'rustc' is already installed."
fi


# install 'rust-analyzer'
rustup component add rust-analyzer


# install LSPs
## tailwindcss
nvim -c "LspInstall tailwindcss"
