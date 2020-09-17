README="README.md"
WORDLIST="rockme.txt"
WORDLIST_COMPRESSED="rockme.tar.gz"

echo "Counting words..."
WORD_COUNT=($(wc -l $WORDLIST))

echo "Sorting wordlist..."
sort -u -o $WORDLIST $WORDLIST

echo "Compressing wordlist..."
tar cfvz $WORDLIST_COMPRESSED $WORDLIST

echo "Calculating checksums..."
MD5=($(md5sum $WORDLIST_COMPRESSED))
SHA1=($(sha1sum $WORDLIST_COMPRESSED))
SHA256=($(sha256sum $WORDLIST_COMPRESSED))


echo "Generating README.md"
echo "# Buzzwords  " > $README
echo "The largest buzzword list collection on the globe. Including words like COWORKING... AND MANY MORE!!!" >> $README

echo "## Words  " >> $README
echo "This wordlist contains ${WORD_COUNT} words. IT IS SOOO AMAZING!" >> $README

echo "## Checksums" >> $README
echo $WORDLIST_COMPRESSED >> $README
echo "| Algorithm | Checksum |" >> $README
echo "|:----------|:----------------------------|" >> $README
echo "| MD5       | $MD5 |" >> $README
echo "| SHA1      | $SHA1 |" >> $README
echo "| SHA256    | $SHA256 |" >> $README

echo "## Important" >> $README
echo "Don't use normal text editors to open this file unless you have about 16 GB of RAM, or you may face RAM Crash." >> $README

echo "Done."
