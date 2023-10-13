function rmswap
    set SWAP ~/.local/share/nvim/swap/
    if test -d $SWAP
        rm -r $SWAP/*.swp
    else
        echo "Error: Directory $SWAP does not exist."
    end
end