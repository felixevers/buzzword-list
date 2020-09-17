README="README.md"
WORDLIST="rockme.txt"
WORDLIST_COMPRESSED="rockme.tar.gz"

echo "Counting words..."
WORD_COUNT=$(wc -l $WORDLIST)

echo "Compressing wordlist..."
# create .tar.gz
tar cfvz $WORDLIST_COMPRESSED $WORDLIST

echo "Calculating checksums..."
# calculate checksums
MD5=($(md5sum $WORDLIST_COMPRESSED))
SHA1=($(sha1sum $WORDLIST_COMPRESSED))
SHA256=($(sha256sum $WORDLIST_COMPRESSED))


echo "Generating README.md"
echo "# Buzzwords  " > $README
echo "The largest buzzword list collection on the globe. Including COWORKING!!!" >> $README

echo "## Words  " >> $README
echo "This wordlist includes ${WORD_COUNT} word. IT IS SOOO AMAZING!" >> $README

echo "## Checksums" >> $README
echo "| Algorithm | Checksum |" >> $README
echo "|:---------:|:----------------------------|" >> $README
echo "| MD5       | $MD5 |" >> $README
echo "| SHA1      | $SHA1 |" >> $README
echo "| SHA256    | $SHA256 |" >> $README

echo "Done."
