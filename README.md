Start with installing neovim 

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt update

sudo apt install neovim


Install LSP after cloning the repos into the manual server to get started as below 

git clone https://github.com/LuaLS/lua-language-server

cd lua-language-server

./3rd/luamake/compile/install.sh

Above will install the lsp server locally 


Verify the installation by checking the version as below
./bin/lua-language-server --version

Confiure the installed path in lsp-config.lua as below 

cmd = { vim.fn.expand("~") .. "your/lsp/installation/path/here" }

install language specific lsp as below

# Python
pip install -g pyright

# JS/TS
npm install -g typescript typescript-language-server

# Ruby
gem install solargraph

After installing add it in lsp-config.lua

AND ALL SET ENJOY CODING, AND SAY "I WORK WITH NEOVIM"
