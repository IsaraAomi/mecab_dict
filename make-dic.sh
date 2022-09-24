# usage: supply the filename without extension to the first argument
# example: foo-cost.csv `./make-dic.sh foo`
DICT_INDEX_PATH=$(mecab-config --libexecdir)/mecab-dict-index
DICT_DIR='./mecab-ipadic-2.7.0-20070801'
FILENAME=$1
USER_PREFIX='user_dict' # assume all user files start with this

if [[ -z "$1" ]]; then
	echo "blank filename :/"
	exit 1
fi

cd $DICT_DIR 
OLD_FILE="${FILENAME}-cost.csv"

# remove old user definitions
ls | grep $USER_PREFIX | xargs rm

# move new file and make
sudo cp ../"${FILENAME}-cost.csv" ./ \
&& sudo $DICT_INDEX_PATH -f utf-8 -t utf-8 \
&& sudo make install
echo "updated ipadic"
