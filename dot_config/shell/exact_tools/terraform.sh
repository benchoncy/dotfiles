if [ -x "$(command -v terraform)" ]; then
    alias tf="terraform"
else
    alias tf="tofu"
fi

