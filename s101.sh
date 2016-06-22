if [ "$(java -Xmx512m -Djava.library.path=/Users/mqm/s101-build -jar /Users/mqm/s101-build/structure101-gen-build.jar ping.udb.gen.hsp 2>&1 | tee s101-out.txt | grep -cim1 SEVERE)" -ge 1 ]; then
  exit 1
else
  exit 0
fi