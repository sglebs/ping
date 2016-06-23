if [ "$(java -Xmx512m -Djava.library.path=/Users/mqm/s101-build -jar /Users/mqm/s101-build/structure101-gen-build.jar s101.build.xml 2>&1 | tee s101-out.txt | grep -cim1 SEVERE)" -ge 1 ]; then
  cat s101-out.txt
  exit 1
else
  cat s101-out.txt
  exit 0
fi