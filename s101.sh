if [ "$(java -Xmx512m -Djava.library.path=/Users/mqm/s101-build -jar /Users/mqm/s101-build/structure101-gen-build.jar $1 2>&1 | tee $1-out.txt | grep -cim1 SEVERE)" -ge 1 ]; then
  cat $1-out.txt
  exit 1
else
  cat $1-out.txt
  exit 0
fi