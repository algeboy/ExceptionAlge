# Maybe we can make this git independent or safer?

# Vars
FILE="$(realpath -s "$0")"
DIR="$(dirname $FILE)"
PKGDIR="$(dirname $DIR)"


cd "$DIR" 

# Update main package
echo "Updating ExceptionAlge package."
git -q pull origin master 

echo "Now updating dependencies."

# TensorSpace update
if [ -f "$PKGDIR/TensorSpace/update.sh" ]
then
    sh "$PKGDIR/TensorSpace/update.sh"
else
    echo "Could not find TensorSpace, downloading..."
    cd "$PKGDIR"
    git -q clone https://github.com/algeboy/TensorSpace
    echo "Installing TensorSpace..."
    sh "$PKGDIR/TensorSpace/install.sh"
fi

echo "Successfully updated!"

