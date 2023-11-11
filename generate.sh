README="README.md"
WORDLIST="rockme.txt"
TMP_WORDLIST="tmp_$WORDLIST"
WORDLIST_COMPRESSED="rockme.tar.gz"

echo "Trim entire wordlist..."
sed 's/^ *//; s/ *$//; /^$/d' $WORDLIST > $TMP_WORDLIST
mv $TMP_WORDLIST $WORDLIST

echo "Sorting wordlist..."
sort -u -o $WORDLIST $WORDLIST

echo "Counting words..."
WORD_COUNT=($(wc -l $WORDLIST))

echo "Compressing wordlist..."
tar cfvz $WORDLIST_COMPRESSED $WORDLIST > /dev/null

echo "Calculating checksums..."
MD5=($(md5sum $WORDLIST_COMPRESSED))
SHA1=($(sha1sum $WORDLIST_COMPRESSED))
SHA256=($(sha256sum $WORDLIST_COMPRESSED))


echo "Generating README.md"
echo "# Buzzwords  " > $README

examples=($(sh random.sh 3))
echo "The largest buzzword list collection on the globe. Including words like \`${examples[0]}\`, \`${examples[1]}\`, \`${examples[2]}\`, ... AND MANY MORE!!!" >> $README

echo "" >> $README

echo "## Words  " >> $README
echo "This wordlist contains ${WORD_COUNT} words. IT IS SOOO AMAZING!" >> $README

echo "" >> $README

echo "## Checksums" >> $README
echo $WORDLIST_COMPRESSED >> $README
echo "| Algorithm | Checksum |" >> $README
echo "|:----------|:----------------------------|" >> $README
echo "| MD5       | $MD5 |" >> $README
echo "| SHA1      | $SHA1 |" >> $README
echo "| SHA256    | $SHA256 |" >> $README

echo "" >> $README

echo "## Important" >> $README
echo "Don't use normal text editors to open this file unless you have about 16 GB of RAM, or you may face RAM Crash." >> $README

echo "Done."
