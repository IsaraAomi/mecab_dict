# usage: supply the filename without extension to the first argument
# example: foo.csv → `./add-cost.sh foo`
DICT_INDEX_PATH=$(mecab-config --libexecdir)/mecab-dict-index
WORKING_DIR=./
FILENAME=$1

if [[ -z "$1" ]]; then
	echo "blank filename :/"
	exit 1
fi

$DICT_INDEX_PATH \
	-m "${WORKING_DIR}/mecab-ipadic-2.7.0-20070801.model" \
	-d "${WORKING_DIR}/mecab-ipadic-2.7.0-20070801" \
	-u "${FILENAME}-cost.csv" \
	-f utf-8 -t utf-8 \
	-a "${FILENAME}.csv" \
&& \
echo "added cost for ${FILENAME}.csv to ${FILENAME}-cost.csv"
